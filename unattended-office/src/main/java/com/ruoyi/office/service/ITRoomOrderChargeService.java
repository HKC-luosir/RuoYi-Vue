package com.ruoyi.office.service;

import java.util.List;
import com.ruoyi.office.domain.TRoomOrderCharge;

/**
 * 续费订单Service接口
 * 
 * @author ruoyi
 * @date 2023-10-22
 */
public interface ITRoomOrderChargeService 
{
    /**
     * 查询续费订单
     * 
     * @param id 续费订单主键
     * @return 续费订单
     */
    public TRoomOrderCharge selectTRoomOrderChargeById(Long id);

    /**
     * 查询续费订单列表
     * 
     * @param tRoomOrderCharge 续费订单
     * @return 续费订单集合
     */
    public List<TRoomOrderCharge> selectTRoomOrderChargeList(TRoomOrderCharge tRoomOrderCharge);

    /**
     * 新增续费订单
     * 
     * @param tRoomOrderCharge 续费订单
     * @return 结果
     */
    public int insertTRoomOrderCharge(TRoomOrderCharge tRoomOrderCharge);

    /**
     * 修改续费订单
     * 
     * @param tRoomOrderCharge 续费订单
     * @return 结果
     */
    public int updateTRoomOrderCharge(TRoomOrderCharge tRoomOrderCharge);

    /**
     * 批量删除续费订单
     * 
     * @param ids 需要删除的续费订单主键集合
     * @return 结果
     */
    public int deleteTRoomOrderChargeByIds(Long[] ids);

    /**
     * 删除续费订单信息
     * 
     * @param id 续费订单主键
     * @return 结果
     */
    public int deleteTRoomOrderChargeById(Long id);

    public Long getHourMaxOrder(String prefix);
}
