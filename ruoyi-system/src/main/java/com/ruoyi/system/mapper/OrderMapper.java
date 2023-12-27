package com.ruoyi.system.mapper;

import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.common.core.domain.app.OrderRequest;
import com.ruoyi.common.core.domain.entity.order.Order;

/**
 * @Entity com.ruoyi.system.domain.MerchantAmountDetail
 */
public interface OrderMapper extends BaseMapper<Order> {

	public List<Order> list(OrderRequest orderRequest);

	public Integer listCount(OrderRequest orderRequest);

	public default void updateStatus(String orderId, int orderStatus) {
		Order entity = new Order();
		entity.setOrderId(orderId);
		entity.setModifyTime(new Date());
		entity.setOrderStatus(orderStatus);
		updateById(entity);
	}

	public default void updateFinish(String orderId) {
		Order entity = new Order();
		entity.setOrderId(orderId);
		entity.setFinishTime(new Date());
		entity.setOrderStatus(2);
		entity.setModifyTime(new Date());
		updateById(entity);
	}
}
