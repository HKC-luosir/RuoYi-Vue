package com.ruoyi.project.benyi.mapper;

import java.util.List;

import com.ruoyi.project.benyi.domain.ByFiles;

/**
 * 文件管理Mapper接口
 *
 * @author tsbz
 * @date 2020-08-12
 */
public interface ByFilesMapper {
    /**
     * 查询文件管理
     *
     * @param id 文件管理ID
     * @return 文件管理
     */
    public ByFiles selectByFilesById(Long id);

    /**
     * 查询文件管理列表
     *
     * @param byFiles 文件管理
     * @return 文件管理集合
     */
    public List<ByFiles> selectByFilesList(ByFiles byFiles);

    /**
     * 新增文件管理
     *
     * @param byFiles 文件管理
     * @return 结果
     */
    public int insertByFiles(ByFiles byFiles);

    /**
     * 修改文件管理
     *
     * @param byFiles 文件管理
     * @return 结果
     */
    public int updateByFiles(ByFiles byFiles);

    /**
     * 删除文件管理
     *
     * @param id 文件管理ID
     * @return 结果
     */
    public int deleteByFilesById(Long id);

    /**
     * 批量删除文件管理
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteByFilesByIds(Long[] ids);
}
