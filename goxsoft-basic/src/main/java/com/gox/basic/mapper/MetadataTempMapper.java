package com.gox.basic.mapper;

import java.util.List;
import com.gox.basic.domain.MetadataTemp;

/**
 *   Mapper接口
 * 
 * @author gox
 * @date 2021-03-10
 */
public interface MetadataTempMapper 
{
    /**
     * 查询  
     * 
     * @param id   ID
     * @return   
     */
    public MetadataTemp selectMetadataTempById(Long id);

    /**
     * 查询  列表
     * 
     * @param metadataTemp   
     * @return   集合
     */
    public List<MetadataTemp> selectMetadataTempList(MetadataTemp metadataTemp);

    /**
     * 新增  
     * 
     * @param metadataTemp   
     * @return 结果
     */
    public int insertMetadataTemp(MetadataTemp metadataTemp);

    /**
     * 修改  
     * 
     * @param metadataTemp   
     * @return 结果
     */
    public int updateMetadataTemp(MetadataTemp metadataTemp);

    /**
     * 删除  
     * 
     * @param id   ID
     * @return 结果
     */
    public int deleteMetadataTempById(Long id);

    /**
     * 批量删除  
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMetadataTempByIds(Long[] ids);
}
