package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.WorkHeating;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2022-08-05
 */
public interface WorkHeatingMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param heatingId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public WorkHeating selectWorkHeatingByHeatingId(Long heatingId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param workHeating 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<WorkHeating> selectWorkHeatingList(WorkHeating workHeating);

    /**
     * 新增【请填写功能名称】
     * 
     * @param workHeating 【请填写功能名称】
     * @return 结果
     */
    public int insertWorkHeating(WorkHeating workHeating);

    /**
     * 修改【请填写功能名称】
     * 
     * @param workHeating 【请填写功能名称】
     * @return 结果
     */
    public int updateWorkHeating(WorkHeating workHeating);

    /**
     * 删除【请填写功能名称】
     * 
     * @param heatingId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteWorkHeatingByHeatingId(Long heatingId);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param heatingIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWorkHeatingByHeatingIds(Long[] heatingIds);
}
