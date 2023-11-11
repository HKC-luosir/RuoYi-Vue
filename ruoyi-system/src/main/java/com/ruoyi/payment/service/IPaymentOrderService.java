package com.ruoyi.payment.service;

import java.util.List;
import com.ruoyi.payment.domain.PaymentOrder;

/**
 * 支付订单Service接口
 *
 * @author Lam
 * @date 2023-09-15
 */
public interface IPaymentOrderService {

    /**
     * 查询支付订单
     *
     * @param id 支付订单主键
     * @return 支付订单
     */
    public PaymentOrder selectPaymentOrderById(Long id);

    /**
     * 查询支付订单列表
     *
     * @param paymentOrder 支付订单
     * @return 支付订单集合
     */
    public List<PaymentOrder> selectPaymentOrderList(PaymentOrder paymentOrder);

    /**
     * 新增支付订单
     *
     * @param paymentOrder 支付订单
     * @return 结果
     */
    public int insertPaymentOrder(PaymentOrder paymentOrder);

    /**
     * 修改支付订单
     *
     * @param paymentOrder 支付订单
     * @return 结果
     */
    public int updatePaymentOrder(PaymentOrder paymentOrder);

    /**
     * 批量删除支付订单
     *
     * @param ids 需要删除的支付订单主键集合
     * @return 结果
     */
    public int deletePaymentOrderByIds(Long[] ids);

    /**
     * 删除支付订单信息
     *
     * @param id 支付订单主键
     * @return 结果
     */
    public int deletePaymentOrderById(Long id);
}
