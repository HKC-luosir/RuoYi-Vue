package com.ruoyi.student.mapper;

import com.ruoyi.student.domain.StuAccVo;

import java.util.List;

public interface StuAccMapper {

    List<StuAccVo> selectStuAccList(StuAccVo stuAccVo);

    List<StuAccVo> selectStuAccSumList(StuAccVo stuAccVo);
}
