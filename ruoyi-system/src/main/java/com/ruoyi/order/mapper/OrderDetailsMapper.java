package com.ruoyi.order.mapper;

import java.util.List;
import com.ruoyi.order.domain.OrderDetails;
import org.apache.ibatis.annotations.Param;

/**
 * 订单明细Mapper接口
 *
 * @author Lam
 * @date 2023-09-15
 */
public interface OrderDetailsMapper {

    /**
     * 查询订单明细
     *
     * @param id 订单明细主键
     * @return 订单明细
     */
    public OrderDetails selectOrderDetailsById(Long id);

    /**
     * 根据订单标识查询详情记录
     *
     * @param orderId 订单标识
     * @return 结果
     * */
    public List<OrderDetails> selectByOrderId(Long orderId);

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
     * 根据订单标识修改状态
     *
     * @param orderId 订单标识
     * @param state 状态
     * @return 结果
     * */
    public int updateStateByOrderId(@Param("orderId") Long orderId, @Param("state") String state);

    /**
     * 删除订单明细
     *
     * @param id 订单明细主键
     * @return 结果
     */
    public int deleteOrderDetailsById(Long id);

    /**
     * 批量删除订单明细
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteOrderDetailsByIds(Long[] ids);
}
