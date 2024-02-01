package com.ruoyi.system.service.impl;

import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.domain.entity.VibeRule;
import com.ruoyi.common.core.domain.entity.robot.RobotStatistics;
import com.ruoyi.common.core.redis.RedisLock;
import com.ruoyi.common.utils.ListTools;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.dto.robot.AddCountDTO;
import com.ruoyi.system.domain.dto.robot.GetRobotDTO;
import com.ruoyi.system.domain.dto.robot.SelectRobotByRuleDTO;
import com.ruoyi.system.domain.vo.robot.GetRobotVO;
import com.ruoyi.system.domain.vo.robot.SelectRobotByRuleVO;
import com.ruoyi.system.mapper.RobotStatisticsMapper;
import com.ruoyi.system.mapper.VibeRuleMapper;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.RobotStatisticsService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    private RedisLock redisLock;

    @Autowired
    private ISysConfigService configService;

    @Transactional
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
        selectRobotByRuleDTO.setIsLock(dto.getIsLock());
        selectRobotByRuleDTO.setFilterUserName(configService.selectConfigByKey("selectRobot:filterUserName"));
        selectRobotByRuleDTO.setCountryCode(dto.getCountryCode());
        Boolean adminFlag = false;
        int robotSize;
        boolean countryCodeFlag = CollectionUtils.isNotEmpty(dto.getCountryCode());
        List<SelectRobotByRuleVO> tmpSelectData;
        List<SelectRobotByRuleVO> selectRobotByRuleVOS = new ArrayList<>();
        List<String> excludeRobotSerialNos = new ArrayList<>();
        List<String> ips = new ArrayList<>();
        //如果需要设置管理员的号,先获取设置管理员的号
        if(dto.getSetAdminCount() > 0){
            selectRobotByRuleDTO.setLimit(dto.getSetAdminCount());
            selectRobotByRuleDTO.setIsSetAdmin(1);
            adminFlag = true;
            selectRobotByRuleDTO.setSetAdminCount(dto.getSetAdminCount());
            selectRobotByRuleDTO.setIpType(dto.getIpType());
            selectRobotByRuleVOS = robotStatisticsMapper.selectRobotByRule(selectRobotByRuleDTO);
            log.info("getRobot selectRobotByRuleVOS:{},{}", JSON.toJSONString(selectRobotByRuleDTO),JSON.toJSONString(selectRobotByRuleVOS));

            // 目标国家不够则随机取其它国家
            if (countryCodeFlag && (CollectionUtils.isEmpty(selectRobotByRuleVOS) || selectRobotByRuleVOS.size() < dto.getSetAdminCount())) {
                if (CollectionUtils.isEmpty(selectRobotByRuleVOS)) {
                    robotSize = 0;
                } else {
                    robotSize = selectRobotByRuleVOS.size();

                    //过滤查询数据
                    for (SelectRobotByRuleVO selectRobotByRuleVO : selectRobotByRuleVOS) {
                        excludeRobotSerialNos.add(selectRobotByRuleVO.getRobotSerialNo());
                        if (StringUtils.isNotEmpty(selectRobotByRuleVO.getIp())) {
                            ips.add(selectRobotByRuleVO.getIp());
                        }
                    }
                    selectRobotByRuleDTO.setExcludeRobotSerialNos(excludeRobotSerialNos);
                    if(CollectionUtils.isNotEmpty(ips)){
                        selectRobotByRuleDTO.setIps(ips);
                    }
                }

                tmpSelectData = this.selectRobotByAllCountyCode(selectRobotByRuleDTO, dto.getSetAdminCount() - robotSize);
                if (CollectionUtils.isNotEmpty(tmpSelectData)) {
                    selectRobotByRuleVOS.addAll(tmpSelectData);
                }
            }

            if(CollectionUtils.isEmpty(selectRobotByRuleVOS) || selectRobotByRuleVOS.size() < dto.getSetAdminCount()){
                return R.fail("管理员号资源不足");
            }
        }

        List<SelectRobotByRuleVO> selectRobotByRuleVOS1 = new ArrayList<>();
        //如果有需要设置管理员号的,需要再次获取其他号
        if(dto.getCount() > 0){
            excludeRobotSerialNos.clear();
            ips.clear();
            for (SelectRobotByRuleVO selectRobotByRuleVO : selectRobotByRuleVOS) {
                excludeRobotSerialNos.add(selectRobotByRuleVO.getRobotSerialNo());
                if (StringUtils.isNotEmpty(selectRobotByRuleVO.getIp())) {
                    ips.add(selectRobotByRuleVO.getIp());
                }
            }
            if(!CollectionUtils.isEmpty(ips)){
                selectRobotByRuleDTO.setIps(ips);
            }
            selectRobotByRuleDTO.setIsSetAdmin(0);
            selectRobotByRuleDTO.setLimit(dto.getCount());
            selectRobotByRuleDTO.setExcludeRobotSerialNos(excludeRobotSerialNos);
            selectRobotByRuleVOS1 = robotStatisticsMapper.selectRobotByRule(selectRobotByRuleDTO);
            log.info("getRobot selectRobotByRuleVOS1:{},{}",JSON.toJSONString(selectRobotByRuleDTO), JSON.toJSONString(selectRobotByRuleVOS1));

            if (countryCodeFlag && (CollectionUtils.isEmpty(selectRobotByRuleVOS1) || selectRobotByRuleVOS1.size() < dto.getCount())) {
                if (CollectionUtils.isEmpty(selectRobotByRuleVOS1)) {
                    robotSize = 0;
                } else {
                    robotSize = selectRobotByRuleVOS1.size();

                    for (SelectRobotByRuleVO selectRobotByRuleVO : selectRobotByRuleVOS1) {
                        excludeRobotSerialNos.add(selectRobotByRuleVO.getRobotSerialNo());
                        if (StringUtils.isNotEmpty(selectRobotByRuleVO.getIp())) {
                            ips.add(selectRobotByRuleVO.getIp());
                        }
                    }
                    if(!CollectionUtils.isEmpty(ips)){
                        selectRobotByRuleDTO.setIps(ips);
                    }
                    selectRobotByRuleDTO.setExcludeRobotSerialNos(excludeRobotSerialNos);
                }

                tmpSelectData = this.selectRobotByAllCountyCode(selectRobotByRuleDTO, dto.getCount() - robotSize);
                if (CollectionUtils.isNotEmpty(tmpSelectData)) {
                    selectRobotByRuleVOS1.addAll(tmpSelectData);
                }
            }

            if(null == selectRobotByRuleVOS1 || selectRobotByRuleVOS1.size() < dto.getCount()){
                return R.fail("普通号资源不足");
            }
        }
        List<GetRobotVO> resultData = new ArrayList<>();
        try {
            lockRobotByIds(selectRobotByRuleVOS, dto.getIsLock());
            lockRobotByIds(selectRobotByRuleVOS1, dto.getIsLock());
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
        }catch (Exception e){
            log.error("getRobot 计数失败",e);
            return R.fail("计数失败");
        }
        return R.ok(resultData);
    }

    //将号标记为锁定状态
    private void lockRobotByIds(List<SelectRobotByRuleVO> robotData, int lockState) {
        if (CollectionUtils.isNotEmpty(robotData) && lockState == 1) {
            List<String> updateRobotStatisticsIds = robotData.stream()
                    .map(SelectRobotByRuleVO::getId)
                    .filter(StringUtils::isNotEmpty).collect(Collectors.toList());
            log.info("getRobot_lockRobot_ids:{}", updateRobotStatisticsIds);
            this.update(new LambdaUpdateWrapper<RobotStatistics>()
                    .in(RobotStatistics::getId, updateRobotStatisticsIds)
                    .set(RobotStatistics::getIsLock, 1));
        }
    }

    private List<SelectRobotByRuleVO> selectRobotByAllCountyCode(SelectRobotByRuleDTO query, Integer limit) {
        SelectRobotByRuleDTO selectRobotQuery = new SelectRobotByRuleDTO();
        BeanUtils.copyProperties(query, selectRobotQuery);
        selectRobotQuery.setCountryCode(null);
        selectRobotQuery.setLimit(limit);
        final List<SelectRobotByRuleVO> selectRobotByRuleVOS = robotStatisticsMapper.selectRobotByRule(selectRobotQuery);
        log.info("getRobot_不限制国家_params:{}_data:{}", JSON.toJSONString(selectRobotQuery), JSON.toJSONString(selectRobotByRuleVOS));
        return selectRobotByRuleVOS;
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
        log.info("定时清除号每日累计数");
        List<RobotStatistics> robotStatistics = baseMapper.selectList(null);
        if(!CollectionUtils.isEmpty(robotStatistics)){
            for (List<RobotStatistics> statistics : ListTools.partition(robotStatistics, 500)) {
                List<String> robotSerialNos = statistics.stream().map(RobotStatistics::getRobotSerialNo).collect(Collectors.toList());
                baseMapper.clearRobotOneDayNum(robotSerialNos);
            }
        }
    }


}
