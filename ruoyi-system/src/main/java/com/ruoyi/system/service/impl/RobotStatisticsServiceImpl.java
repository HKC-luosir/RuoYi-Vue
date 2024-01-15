package com.ruoyi.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.domain.entity.VibeRule;
import com.ruoyi.common.core.domain.entity.robot.RobotStatistics;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.dto.robot.AddCountDTO;
import com.ruoyi.system.domain.dto.robot.GetRobotDTO;
import com.ruoyi.system.domain.dto.robot.SelectRobotByRuleDTO;
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

import java.util.List;
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
    @Override
    public R<List<String>> getRobot(GetRobotDTO dto) {
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
        selectRobotByRuleDTO.setCount(dto.getCount());
        selectRobotByRuleDTO.setCountryCode(dto.getCountryCode());
        selectRobotByRuleDTO.setIsSetAdmin(dto.getIsSetAdmin());
        selectRobotByRuleDTO.setIpType(dto.getIpType());
        List<SelectRobotByRuleVO> selectRobotByRuleVOS = robotStatisticsMapper.selectRobotByRule(selectRobotByRuleDTO);
        if(CollectionUtils.isEmpty(selectRobotByRuleVOS) || selectRobotByRuleVOS.size() < dto.getCount()){
            return R.fail("号资源不足");
        }
        List<String> robotSerialNos = selectRobotByRuleVOS.stream().map(SelectRobotByRuleVO::getRobotSerialNo).collect(Collectors.toList());
        List<String> ids = selectRobotByRuleVOS.stream().filter(f-> StringUtils.isNotEmpty(f.getId())).map(SelectRobotByRuleVO::getId).collect(Collectors.toList());
        if(CollectionUtils.isEmpty(ids)){
            AddCountDTO addCountDTO = new AddCountDTO();
            addCountDTO.setRobotSerialNos(robotSerialNos);
            addCountDTO.setIsSetAdmin(dto.getIsSetAdmin());
            robotStatisticsMapper.addCount(addCountDTO);
            return R.ok(robotSerialNos);
        }
        SqlSession sqlSession = sqlSessionTemplate.getSqlSessionFactory().openSession();
        try {
            robotStatisticsMapper.selectList(new LambdaQueryWrapper<RobotStatistics>().in(RobotStatistics::getId,ids).last(" for update"));
            AddCountDTO addCountDTO = new AddCountDTO();
            addCountDTO.setRobotSerialNos(robotSerialNos);
            addCountDTO.setIsSetAdmin(dto.getIsSetAdmin());
            robotStatisticsMapper.addCount(addCountDTO);
            sqlSession.commit();
        }catch (Exception e){
            log.error("getRobot 计数失败",e);
            sqlSession.rollback();
            return R.fail("计数失败");
        }
        return R.ok(robotSerialNos);
    }
}
