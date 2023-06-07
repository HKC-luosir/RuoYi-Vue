package com.ruoyi.office.service;

import java.math.BigDecimal;
import java.util.List;

import com.ruoyi.common.core.domain.entity.WxUser;
import com.ruoyi.office.domain.TRoomOrder;
import com.ruoyi.office.domain.vo.GetRoomPriceVo;
import com.ruoyi.office.domain.vo.PrepayReq;
import com.ruoyi.office.domain.vo.PrepayResp;
import com.ruoyi.office.domain.vo.WxPayCallback;

/**
 * 房间占用（点支付时再次校验可用性并改变状态，支付失败回滚）Service接口
 *
 * @author ruoyi
 * @date 2023-05-29
 */
public interface ITRoomOrderService {
    /**
     * 查询房间占用（点支付时再次校验可用性并改变状态，支付失败回滚）
     *
     * @param id 房间占用（点支付时再次校验可用性并改变状态，支付失败回滚）主键
     * @return 房间占用（点支付时再次校验可用性并改变状态，支付失败回滚）
     */
    public TRoomOrder selectTRoomOrderById(Long id);

    /**
     * 查询房间占用（点支付时再次校验可用性并改变状态，支付失败回滚）列表
     *
     * @param tRoomOrder 房间占用（点支付时再次校验可用性并改变状态，支付失败回滚）
     * @return 房间占用（点支付时再次校验可用性并改变状态，支付失败回滚）集合
     */
    public List<TRoomOrder> selectTRoomOrderList(TRoomOrder tRoomOrder);

    /**
     * 新增房间占用（点支付时再次校验可用性并改变状态，支付失败回滚）
     *
     * @param tRoomOrder 房间占用（点支付时再次校验可用性并改变状态，支付失败回滚）
     * @return 结果
     */
    public int insertTRoomOrder(TRoomOrder tRoomOrder);

    /**
     * 修改房间占用（点支付时再次校验可用性并改变状态，支付失败回滚）
     *
     * @param tRoomOrder 房间占用（点支付时再次校验可用性并改变状态，支付失败回滚）
     * @return 结果
     */
    public int updateTRoomOrder(TRoomOrder tRoomOrder);

    /**
     * 批量删除房间占用（点支付时再次校验可用性并改变状态，支付失败回滚）
     *
     * @param ids 需要删除的房间占用（点支付时再次校验可用性并改变状态，支付失败回滚）主键集合
     * @return 结果
     */
    public int deleteTRoomOrderByIds(Long[] ids);

    /**
     * 删除房间占用（点支付时再次校验可用性并改变状态，支付失败回滚）信息
     *
     * @param id 房间占用（点支付时再次校验可用性并改变状态，支付失败回滚）主键
     * @return 结果
     */
    public int deleteTRoomOrderById(Long id);

    BigDecimal getPeriodPrice(GetRoomPriceVo vo);

    PrepayResp orderRoom(PrepayReq vo, Long userId);

    boolean checkCoupon(PrepayReq vo, Long userId);

    String orderRoomWxCallback(WxPayCallback callback, WxUser wxUser);

    String finish(PrepayResp vo, Long id);
}
