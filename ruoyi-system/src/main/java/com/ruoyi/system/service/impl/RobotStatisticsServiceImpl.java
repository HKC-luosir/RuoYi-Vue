package com.ruoyi.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.domain.entity.VibeRule;
import com.ruoyi.common.core.domain.entity.robot.RobotStatistics;
import com.ruoyi.common.core.redis.RedisLock;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.dto.robot.AddCountDTO;
import com.ruoyi.system.domain.dto.robot.GetRobotDTO;
import com.ruoyi.system.domain.dto.robot.SelectRobotByRuleDTO;
import com.ruoyi.system.domain.vo.robot.GetRobotVO;
import com.ruoyi.system.domain.vo.robot.SelectRobotByRuleVO;
import com.ruoyi.system.mapper.RobotStatisticsMapper;
import com.ruoyi.system.mapper.VibeRuleMapper;
import com.ruoyi.system.service.RobotStatisticsService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

@Slf4j
@Service
public class RobotStatisticsServiceImpl extends ServiceImpl<RobotStatisticsMapper, RobotStatistics> implements RobotStatisticsService {

    @Autowired
    private RobotStatisticsMapper robotStatisticsMapper;
    @Autowired
    private VibeRuleMapper vibeRuleMapper;
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    @Autowired
    private RedisLock redisLock;

    @Override
    public R<List<GetRobotVO>> getRobot(GetRobotDTO dto) {
        VibeRule vibeRule = vibeRuleMapper.selectOne(new LambdaQueryWrapper<VibeRule>().last("limit 1"));
        if(vibeRule == null){
            return R.fail("查询不到规则表数据");
        }
        SelectRobotByRuleDTO selectRobotByRuleDTO = new SelectRobotByRuleDTO();
        selectRobotByRuleDTO.setGroupCount(vibeRule.getGroupNum());
        selectRobotByRuleDTO.setOneDayJoinGroupCount(vibeRule.getJoinLimitByDay());
        selectRobotByRuleDTO.setTotalJoinGroupCount(vibeRule.getJoinLimitByTotal());
        selectRobotByRuleDTO.setOneDaySetAdminCount(vibeRule.getSetManageLimitByDay());
        selectRobotByRuleDTO.setTotalSetAdminCount(vibeRule.getSetManageLimitByTotal());
        Boolean adminFlag = false;
        List<SelectRobotByRuleVO> selectRobotByRuleVOS = new ArrayList<>();
        //如果需要设置管理员的号,先获取设置管理员的号
        if(dto.getSetAdminCount() > 0){
            selectRobotByRuleDTO.setLimit(dto.getSetAdminCount());
            selectRobotByRuleDTO.setIsSetAdmin(1);
            adminFlag = true;
            selectRobotByRuleDTO.setCountryCode(dto.getCountryCode());
            selectRobotByRuleDTO.setSetAdminCount(dto.getSetAdminCount());
            selectRobotByRuleDTO.setIpType(dto.getIpType());
            selectRobotByRuleVOS = robotStatisticsMapper.selectRobotByRule(selectRobotByRuleDTO);
            if(CollectionUtils.isEmpty(selectRobotByRuleVOS)){
                return R.fail("号资源不足");
            }
            if(selectRobotByRuleVOS.size() < dto.getSetAdminCount()){
                return R.fail("号资源不足");
            }
        }
//        if(adminFlag){
//            if(selectRobotByRuleVOS.size() < dto.getSetAdminCount()){
//                return R.fail("号资源不足");
//            }
//        }else{
//            if(selectRobotByRuleVOS.size() < dto.getCount()){
//                return R.fail("号资源不足");
//            }
//        }

        List<SelectRobotByRuleVO> selectRobotByRuleVOSTotal = new ArrayList<>();
        selectRobotByRuleVOSTotal.addAll(selectRobotByRuleVOS);
        List<SelectRobotByRuleVO> selectRobotByRuleVOS1 = new ArrayList<>();
        //如果有需要设置管理员号的,需要再次获取其他号
        if(dto.getCount() > 0){
            List<String> ips = selectRobotByRuleVOS.stream().map(SelectRobotByRuleVO::getIp).collect(Collectors.toList());
            selectRobotByRuleDTO.setIps(ips);
            selectRobotByRuleDTO.setIsSetAdmin(0);
            selectRobotByRuleDTO.setLimit(dto.getCount());
            selectRobotByRuleVOS1 = robotStatisticsMapper.selectRobotByRule(selectRobotByRuleDTO);
            if(CollectionUtils.isEmpty(selectRobotByRuleVOS1) || selectRobotByRuleVOS1.size() < dto.getCount()){
                return R.fail("号资源不足");
            }
            selectRobotByRuleVOSTotal.addAll(selectRobotByRuleVOS1);
        }
        List<String> ids = selectRobotByRuleVOSTotal.stream().filter(f-> StringUtils.isNotEmpty(f.getId())).map(SelectRobotByRuleVO::getId).collect(Collectors.toList());
        log.info("selectRobotByRuleVOSTotal:{},ids:{}",selectRobotByRuleVOSTotal,ids);
        List<GetRobotVO> resultData = new ArrayList<>();
        try {
            if(adminFlag){
                //增加设置管理员号的计数
                List<String> adminRobotSerialNos = selectRobotByRuleVOS.stream().map(SelectRobotByRuleVO::getRobotSerialNo).collect(Collectors.toList());
                AddCountDTO addCountDTO = new AddCountDTO();
                addCountDTO.setRobotSerialNos(adminRobotSerialNos);
                addCountDTO.setIsSetAdmin(1);
                robotStatisticsMapper.addCount(addCountDTO);
                for (String robotSerialNo : adminRobotSerialNos) {
                    GetRobotVO vo = new GetRobotVO();
                    vo.setIsSetAdmin(1);
                    vo.setRobotSerialNo(robotSerialNo);
                    resultData.add(vo);
                }
            }
            if(dto.getCount() > 0){
                //增加号的计数
                List<String> robotSerialNos = selectRobotByRuleVOS1.stream().map(SelectRobotByRuleVO::getRobotSerialNo).collect(Collectors.toList());
                AddCountDTO addCountDTO = new AddCountDTO();
                addCountDTO.setRobotSerialNos(robotSerialNos);
                addCountDTO.setIsSetAdmin(0);
                robotStatisticsMapper.addCount(addCountDTO);
                for (String robotSerialNo : robotSerialNos) {
                    GetRobotVO vo = new GetRobotVO();
                    vo.setIsSetAdmin(0);
                    vo.setRobotSerialNo(robotSerialNo);
                    resultData.add(vo);
                }
            }
            //将号标记为锁定状态
            if(dto.getIsLock() == 1){
                this.update(new LambdaUpdateWrapper<RobotStatistics>().in(RobotStatistics::getId,ids).set(RobotStatistics::getIsLock,1));
            }
        }catch (Exception e){
            log.error("getRobot 计数失败",e);
            return R.fail("计数失败");
        }
        return R.ok(resultData);
    }

    @Override
    public boolean checkAndAddLeaderCount(String robotSerialNo, Integer count, Integer checkCount) {
        String key = "robotStatistics:leaderCount:" + robotSerialNo;
        //等待锁 等待10秒
        if (!redisLock.tryLock(key, 10, 5, TimeUnit.SECONDS)) {
            return false;
        }
        try {
            RobotStatistics robotStatistics = baseMapper.selectById(robotSerialNo);
            if(robotStatistics == null){
                return false;
            }
            if(robotStatistics.getTotalLeaderSetAdminCount() + count > checkCount){
                return false;
            }
            baseMapper.addLeaderCount(robotSerialNo, count);
            return true;
        } finally {
            redisLock.unlock(key);
        }
    }

    @Override
    public void restoreQuantity(String robotSerialNo, Integer count) {
        String key = "robotStatistics:leaderCount:" + robotSerialNo;
        //等待锁 等待10秒
        if (redisLock.tryLock(key, 10, 5, TimeUnit.SECONDS)) {
            //加锁失败直接相减
            baseMapper.addLeaderCount(robotSerialNo, -count);
            return ;
        }
        try {
            baseMapper.addLeaderCount(robotSerialNo, count);
        } finally {
            redisLock.unlock(key);
        }
    }

    @Override
    public boolean unLockRobot(List<String> robotSerialNos) {
        if(this.update(new LambdaUpdateWrapper<RobotStatistics>().in(RobotStatistics::getRobotSerialNo,robotSerialNos).set(RobotStatistics::getIsLock,0))){
            return true;
        }
        return false;
    }

    @Override
    public boolean decreaseRobotGroup(List<String> robotSerialNos) {
        if(!CollectionUtils.isEmpty(robotSerialNos)){
            baseMapper.decreaseRobotGroup(robotSerialNos);
            return true;
        }
        return false;
    }

    @Override
    public void clearRobotOneDayNum() {
        baseMapper.clearRobotOneDayNum();
    }


}
