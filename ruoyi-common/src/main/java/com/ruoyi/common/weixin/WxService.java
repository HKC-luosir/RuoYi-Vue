package com.ruoyi.common.weixin;

import cn.binarywang.wx.miniapp.api.WxMaSecCheckService;
import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.api.WxMaUserService;
import cn.binarywang.wx.miniapp.api.impl.WxMaUserServiceImpl;
import cn.binarywang.wx.miniapp.bean.WxMaJscode2SessionResult;
import cn.binarywang.wx.miniapp.bean.WxMaPhoneNumberInfo;
import cn.binarywang.wx.miniapp.bean.WxMaSubscribeMessage;
import cn.hutool.core.util.ObjectUtil;
import com.github.binarywang.wxpay.bean.request.WxPayRefundRequest;
import com.github.binarywang.wxpay.bean.request.WxPayUnifiedOrderRequest;
import com.github.binarywang.wxpay.bean.result.WxPayRefundResult;
import com.github.binarywang.wxpay.bean.result.WxPayUnifiedOrderResult;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.WxPayService;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.sign.Md5Utils;
import com.ruoyi.common.weixin.model.dto.UnifiedOrderRequestDto;
import com.ruoyi.common.weixin.model.dto.WxPayRefundDto;
import com.ruoyi.common.weixin.model.dto.WxServiceNotifyDto;
import com.ruoyi.common.weixin.model.vo.WxPayResultVo;
import com.ruoyi.common.weixin.properties.WxPayInfoProperties;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.subscribe.WxMpSubscribeMessage;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateMessage;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

/**
 * @author LAM
 * @date 2022/5/16 15:09
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class WxService {

    private final WxMaService wxMiniAppletService;
    private final WxPayService wxPayService;
    private final WxPayInfoProperties wxPayInfoProperties;
    private final WxMpService wxOfficialAccountService;

    /**
     * 内容安全相关接口
     */
    public WxMaSecCheckService getWxMaSecCheckService() {
        return wxMiniAppletService.getSecCheckService();
    }

    /**
     * 使用微信小程序前端传入code，换取sessionInfo
     *
     * @param code
     * @return 结果
     */
    public WxMaJscode2SessionResult getWxMiniSessionInfo(String code) {
        log.info("请求微信登录：开始，参数：{}", code);
        WxMaJscode2SessionResult wxMaJscode2SessionResult = null;
        try {
            wxMaJscode2SessionResult = wxMiniAppletService.getUserService().getSessionInfo(code);
        } catch (Exception e) {
            e.printStackTrace();
            log.warn("请求微信登录：异常，信息：{}", e.getMessage());
        }
        log.info("请求微信登录：完成，返回数据：{}", wxMaJscode2SessionResult);
        return wxMaJscode2SessionResult;
    }

    /**
     * 解密获取微信用户手机号码
     *
     * @param sessionKey
     * @param iv
     * @param encryptedData
     * @return 结果
     */
    public String decodePhoneNumber(String sessionKey, String iv, String encryptedData) {
        log.info("解密获取微信用户手机号码：开始，参数：sessionKey：{}，iv：{}，encryptedData：{}", sessionKey, iv, encryptedData);
        WxMaPhoneNumberInfo wxMaPhoneNumberInfo = null;
        try {
            WxMaUserService wxMaUserService = new WxMaUserServiceImpl(wxMiniAppletService);
            wxMaPhoneNumberInfo = wxMaUserService.getPhoneNoInfo(sessionKey, encryptedData, iv);
        } catch (Exception e) {
            e.printStackTrace();
            log.warn("解密获取微信用户手机号码：异常，信息：{}", e.getMessage());
        }
        log.info("解密获取微信用户手机号码：完成，返回数据：{}", wxMaPhoneNumberInfo.getPhoneNumber());
        return wxMaPhoneNumberInfo.getPhoneNumber();
    }

    /**
     * 构建微信统一下单请求数据
     *
     * @param unifiedOrderRequest 构建微信请求参数
     * @return 结果
     */
    public WxPayUnifiedOrderResult unifiedOrder(UnifiedOrderRequestDto unifiedOrderRequest) throws WxPayException {
        WxPayUnifiedOrderRequest params = new WxPayUnifiedOrderRequest();
        params.setSpbillCreateIp(unifiedOrderRequest.getPayerClientIp())
                .setOpenid(unifiedOrderRequest.getOpenid())
                .setBody(unifiedOrderRequest.getBody())
                .setDetail(unifiedOrderRequest.getDescription())
                .setAttach(unifiedOrderRequest.getAttach())
                .setOutTradeNo(unifiedOrderRequest.getOutTradeNo())
                .setTotalFee(unifiedOrderRequest.getAmount())
                .setTimeStart(DateUtils.dateTimeNow())
                .setTimeExpire(unifiedOrderRequest.getTimeExpire());
        return wxPayService.unifiedOrder(params);
    }

    /**
     * 解析微信支付返回参数
     *
     * @param unifiedOrderResult
     * @return 结果
     */
    public WxPayResultVo handleWxPayResult(WxPayUnifiedOrderResult unifiedOrderResult) {
        WxPayResultVo wxPayResultVo = new WxPayResultVo();
        wxPayResultVo.setAppId(unifiedOrderResult.getAppid())
                .setTimeStamp(System.currentTimeMillis() / 1000 + "")
                .setPrepayId("prepay_id=" + unifiedOrderResult.getPrepayId())
                .setSignType("MD5")
                .setNonceStr(unifiedOrderResult.getNonceStr())
                .setPaySign(appletSign(wxPayResultVo));
        return wxPayResultVo;
    }

    /**
     * 二次签名-小程序端调用支付签名
     *
     * @param wxPayResultVo 打包好的数据
     */
    public String appletSign(WxPayResultVo wxPayResultVo) {
        String signStr = "appId=" + wxPayResultVo.getAppId() + "&nonceStr=" + wxPayResultVo.getNonceStr() +
                "&package=" + wxPayResultVo.getPrepayId() + "&signType=" + wxPayResultVo.getSignType()
                + "&timeStamp=" + wxPayResultVo.getTimeStamp() + "&key=" + wxPayInfoProperties.getMchKey();
        return Md5Utils.hash(signStr).toUpperCase();
    }

    /**
     * 构建并请求微信退款请求数据
     *
     * @param dto 退款数据
     * @return 结果
     */
    public WxPayRefundResult refundRequest(WxPayRefundDto dto) throws WxPayException {
        WxPayRefundRequest wxPayRefundRequest = new WxPayRefundRequest();
        wxPayRefundRequest.setNotifyUrl(wxPayInfoProperties.getRefundNotifyUrl())
                .setTransactionId(dto.getTransactionId())
                .setOutRefundNo(dto.getOutRefundNo())
                .setTotalFee(dto.getTotalFee())
                .setRefundFee(dto.getRefundFee());
        if (StringUtils.isNotBlank(dto.getRefundDesc())) {
            wxPayRefundRequest.setRefundDesc(dto.getRefundDesc());
        }
        return wxPayService.refundV2(wxPayRefundRequest);
    }

    /**
     * 发送公众号模板消息
     */
    public void wxOfficialAccountSendTemplateMessage(WxMpSubscribeMessage subscribeMessage) {
        log.info("发送公众号模板消息：开始，参数：{}", subscribeMessage);
        try {
            wxOfficialAccountService.getSubscribeMsgService().send(subscribeMessage);
        } catch (Exception e) {
            e.printStackTrace();
            log.warn("发送公众号模板消息：异常");
            throw new ServiceException(e.getMessage());
        }
        log.info("发送公众号模板消息：完成");
    }

    /**
     * 发送小程序模板消息
     *
     * @param dto 小程序订阅消息模板数据信息
     */
    public void wxMiniSendTemplateMessage(WxServiceNotifyDto dto) {
        log.info("发送小程序订阅信息：开始，参数：{}", dto);
        // 构建发送消息对象
        WxMaSubscribeMessage wxMaSubscribeMessage = WxMaSubscribeMessage.builder()
                .toUser(dto.getToUser())
                .templateId(dto.getTemplateId())
                .page(dto.getToPage())
                .build();
        // 消息中的数据处理
        if (ObjectUtil.isNotNull(dto.getData())) {
            List<WxMaSubscribeMessage.MsgData> dataList = new ArrayList<>();
            dto.getData().forEach((k, v) -> {
                WxMaSubscribeMessage.MsgData temp = new WxMaSubscribeMessage.MsgData();
                temp.setName(k);
                temp.setValue(v);
                dataList.add(temp);
            });
            wxMaSubscribeMessage.setData(dataList);
        }
        // 开始发送
        try {
            wxMiniAppletService.getMsgService().sendSubscribeMsg(wxMaSubscribeMessage);
        } catch (WxErrorException e) {
            log.warn("发送小程序订阅信息：失败，异常消息：{}", e.getMessage());
            throw new ServiceException("发送小程序订阅信息：失败");
        }
    }
}
