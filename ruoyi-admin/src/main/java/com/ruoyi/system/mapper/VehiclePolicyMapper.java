package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.VehiclePolicy;

/**
 * 出口国家政策Mapper接口
 * 
 * @author carol
 * @date 2024-02-29
 */
public interface VehiclePolicyMapper 
{
    /**
     * 查询出口国家政策
     * 
     * @param id 出口国家政策主键
     * @return 出口国家政策
     */
    public VehiclePolicy selectVehiclePolicyById(Long id);

    /**
     * 查询出口国家政策列表
     * 
     * @param vehiclePolicy 出口国家政策
     * @return 出口国家政策集合
     */
    public List<VehiclePolicy> selectVehiclePolicyList(VehiclePolicy vehiclePolicy);

    /**
     * 新增出口国家政策
     * 
     * @param vehiclePolicy 出口国家政策
     * @return 结果
     */
    public int insertVehiclePolicy(VehiclePolicy vehiclePolicy);

    /**
     * 修改出口国家政策
     * 
     * @param vehiclePolicy 出口国家政策
     * @return 结果
     */
    public int updateVehiclePolicy(VehiclePolicy vehiclePolicy);

    /**
     * 删除出口国家政策
     * 
     * @param id 出口国家政策主键
     * @return 结果
     */
    public int deleteVehiclePolicyById(Long id);

    /**
     * 批量删除出口国家政策
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteVehiclePolicyByIds(Long[] ids);
}
