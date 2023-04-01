package com.geek.system.mapper;

import java.util.List;
import com.geek.system.domain.SysOss;

/**
 * 文件上传Mapper接口
 * 
 * @author xuek
 * @date 2023-04-01
 */
public interface SysOssMapper{
    /**
     * 查询文件上传
     * 
     * @param id 文件上传主键
     * @return 文件上传
     */
    public SysOss selectSysOssById(Long id);

    /**
     * 查询文件上传列表
     * 
     * @param sysOss 文件上传
     * @return 文件上传集合
     */
    public List<SysOss> selectSysOssList(SysOss sysOss);

    /**
     * 新增文件上传
     * 
     * @param sysOss 文件上传
     * @return 结果
     */
    public int insertSysOss(SysOss sysOss);

    /**
     * 修改文件上传
     * 
     * @param sysOss 文件上传
     * @return 结果
     */
    public int updateSysOss(SysOss sysOss);

    /**
     * 删除文件上传
     * 
     * @param id 文件上传主键
     * @return 结果
     */
    public int deleteSysOssById(Long id);

    /**
     * 批量删除文件上传
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysOssByIds(Long[] ids);
}
