package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.AppNetration;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2022-12-29
 */
public interface AppNetrationMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param mId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public AppNetration selectAppNetrationByMId(Long mId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param appNetration 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<AppNetration> selectAppNetrationList(AppNetration appNetration);

    /**
     * 新增【请填写功能名称】
     * 
     * @param appNetration 【请填写功能名称】
     * @return 结果
     */
    public int insertAppNetration(AppNetration appNetration);

    /**
     * 修改【请填写功能名称】
     * 
     * @param appNetration 【请填写功能名称】
     * @return 结果
     */
    public int updateAppNetration(AppNetration appNetration);

    /**
     * 删除【请填写功能名称】
     * 
     * @param mId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteAppNetrationByMId(Long mId);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param mIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAppNetrationByMIds(Long[] mIds);
}
