package com.stdiet.custom.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import com.stdiet.custom.domain.SysOrder;

/**
 * 销售订单Service接口
 *
 * @author wonder
 * @date 2020-09-24
 */
public interface ISysOrderService
{
    /**
     * 查询销售订单
     *
     * @param orderId 销售订单ID
     * @return 销售订单
     */
    public SysOrder selectSysOrderById(Long orderId);

    /**
     * 查询销售订单列表
     *
     * @param sysOrder 销售订单
     * @return 销售订单集合
     */
    public List<SysOrder> selectSysOrderList(SysOrder sysOrder);

    /**
     * 新增销售订单
     *
     * @param sysOrder 销售订单
     * @return 结果
     */
    public int insertSysOrder(SysOrder sysOrder);

    /**
     * 修改销售订单
     *
     * @param sysOrder 销售订单
     * @return 结果
     */
    public int updateSysOrder(SysOrder sysOrder);

    /**
     * 批量删除销售订单
     *
     * @param orderIds 需要删除的销售订单ID
     * @return 结果
     */
    public int deleteSysOrderByIds(Long[] orderIds);

    /**
     * 删除销售订单信息
     *
     * @param orderId 销售订单ID
     * @return 结果
     */
    public int deleteSysOrderById(Long orderId);

    /**
     * 计算所有订单总额
     * @param sysOrder
     * @return
     */
    public BigDecimal selectAllOrderAmount(SysOrder sysOrder);

    /**
     * 根据订单ID更新该订单的服务到期时间，异步更新食谱计划
     * @param orderId  订单ID
     * @param updatePlan 是否更新食谱
     * @return
     */
    int updateOrderServerEndDate(Long orderId, boolean updatePlan);
}