package com.ruoyi.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.domain.entity.robot.Robot;
import com.ruoyi.system.domain.dto.robot.SelectRobotListDTO;
import com.ruoyi.system.domain.vo.robot.SelectRobotListVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RobotMapper extends BaseMapper<Robot> {
    List<SelectRobotListVO> selectRobotPageList(Page<SelectRobotListVO> page,@Param("dto") SelectRobotListDTO dto);
}
