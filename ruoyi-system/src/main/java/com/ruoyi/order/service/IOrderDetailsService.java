package com.ruoyi.order.service;

import java.util.List;
import com.ruoyi.order.domain.OrderDetails;

/**
 * 订单明细Service接口
 *
 * @author Lam
 * @date 2023-09-15
 */
public interface IOrderDetailsService {

    /**
     * 查询订单明细
     *
     * @param id 订单明细主键
     * @return 订单明细
     */
    public OrderDetails selectOrderDetailsById(Long id);

    /**
     * 查询订单明细列表
     *
     * @param orderDetails 订单明细
     * @return 订单明细集合
     */
    public List<OrderDetails> selectOrderDetailsList(OrderDetails orderDetails);

    /**
     * 新增订单明细
     *
     * @param orderDetails 订单明细
     * @return 结果
     */
    public int insertOrderDetails(OrderDetails orderDetails);

    /**
     * 修改订单明细
     *
     * @param orderDetails 订单明细
     * @return 结果
     */
    public int updateOrderDetails(OrderDetails orderDetails);

    /**
     * 批量删除订单明细
     *
     * @param ids 需要删除的订单明细主键集合
     * @return 结果
     */
    public int deleteOrderDetailsByIds(Long[] ids);

    /**
     * 删除订单明细信息
     *
     * @param id 订单明细主键
     * @return 结果
     */
    public int deleteOrderDetailsById(Long id);
}
