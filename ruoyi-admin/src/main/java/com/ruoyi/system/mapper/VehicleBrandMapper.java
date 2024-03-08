package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.VehicleBrand;

/**
 * 品牌管理Mapper接口
 * 
 * @author carol
 * @date 2024-03-01
 */
public interface VehicleBrandMapper 
{
    /**
     * 查询品牌管理
     * 
     * @param id 品牌管理主键
     * @return 品牌管理
     */
    public VehicleBrand selectVehicleBrandById(Long id);

    /**
     * 查询品牌管理列表
     * 
     * @param vehicleBrand 品牌管理
     * @return 品牌管理集合
     */
    public List<VehicleBrand> selectVehicleBrandList(VehicleBrand vehicleBrand);

    /**
     * 新增品牌管理
     * 
     * @param vehicleBrand 品牌管理
     * @return 结果
     */
    public int insertVehicleBrand(VehicleBrand vehicleBrand);

    /**
     * 修改品牌管理
     * 
     * @param vehicleBrand 品牌管理
     * @return 结果
     */
    public int updateVehicleBrand(VehicleBrand vehicleBrand);

    /**
     * 删除品牌管理
     * 
     * @param id 品牌管理主键
     * @return 结果
     */
    public int deleteVehicleBrandById(Long id);

    /**
     * 批量删除品牌管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteVehicleBrandByIds(Long[] ids);
}
