package com.ruoyi.office.domain.enums;

public class OfficeEnum {

    public enum WxPayRespCode {
        TRADE_ERROR(403, "交易错误"), SYSTEM_ERROR(500, "系统错误"), SIGN_ERROR(401, "签名错误"), RULE_LIMIT(403, "业务规则限制"), PARAM_ERROR(400, "参数错误"), OUT_TRADE_NO_USED(403, "商户订单号重复"), ORDER_NOT_EXIST(404, "订单不存在");

        private final Integer code;
        private final String info;

        WxPayRespCode(Integer code, String info) {
            this.code = code;
            this.info = info;
        }

        public Integer getCode() {
            return code;
        }

        public String getInfo() {
            return info;
        }

        public static WxPayRespCode GetValueByCode(Integer code) {
            for (WxPayRespCode e : WxPayRespCode.values()) {
                if (e.getCode().equals(code)) {
                    return e;
                }
            }
            throw new RuntimeException("枚举值错误");
        }
    }

    public enum RoomOrderStatus {
        IDEAL(0, "空闲"), TO_PAY(1, "待支付"), ORDERED(2, "已预约"), USING(3, "使用中"),
        OVER_TIME(4, "超时未使用"), USED(5, "已完成"), CANCEL(9, "取消");

        private final Integer code;
        private final String info;

        RoomOrderStatus(Integer code, String info) {
            this.code = code;
            this.info = info;
        }

        public Integer getCode() {
            return code;
        }

        public String getInfo() {
            return info;
        }

        public static RoomOrderStatus GetValueByCode(Integer code) {
            for (RoomOrderStatus e : RoomOrderStatus.values()) {
                if (e.getCode().equals(code)) {
                    return e;
                }
            }
            throw new RuntimeException("枚举值错误");
        }
    }

    public enum CouponType {
        TIMES_CARD(1, "次数卡"), HOUR_CARD(2, "时长卡");

        private final Integer code;
        private final String info;

        CouponType(Integer code, String info) {
            this.code = code;
            this.info = info;
        }

        public Integer getCode() {
            return code;
        }

        public String getInfo() {
            return info;
        }

        public static CouponType GetValueByCode(Integer code) {
            for (CouponType e : CouponType.values()) {
                if (e.getCode().equals(code)) {
                    return e;
                }
            }
            throw new RuntimeException("枚举值错误");
        }
    }

    public enum PayType {
        WX_PAY(1, "微信支付"), CARD_BALANCE_PAY(2, "储值卡余额支付"), COUPON_PAY(4, "优惠券支付");

        private final Integer code;
        private final String info;

        PayType(Integer code, String info) {
            this.code = code;
            this.info = info;
        }

        public Integer getCode() {
            return code;
        }

        public String getInfo() {
            return info;
        }

        public static PayType GetValueByCode(Integer code) {
            for (PayType e : PayType.values()) {
                if (e.getCode().equals(code)) {
                    return e;
                }
            }
            throw new RuntimeException("枚举值错误");
        }
    }

    public enum WxPayState {
        SUCCESS("SUCCESS", "支付成功"), REFUND("REFUND", "转入退款"), NOTPAY("NOTPAY", "未支付"), CLOSED("CLOSED", "已关闭"), REVOKED("REVOKED", "已撤销（仅付款码支付会返回）"), USERPAYING("USERPAYING", "用户支付中（仅付款码支付会返回）"), PAYERROR("PAYERROR", "支付失败（仅付款码支付会返回）");

        private final String code;
        private final String info;

        WxPayState(String code, String info) {
            this.code = code;
            this.info = info;
        }

        public String getCode() {
            return code;
        }

        public String getInfo() {
            return info;
        }

        public static WxPayState GetValueByCode(Integer code) {
            for (WxPayState e : WxPayState.values()) {
                if (e.getCode().equals(code)) {
                    return e;
                }
            }
            throw new RuntimeException("枚举值错误");
        }
    }

    public enum WxTradeType {
        PACK("PACK", "套餐订单"), ROOM_ORDER("ROOM_ORDER", "房间订单");

        private final String code;
        private final String info;

        WxTradeType(String code, String info) {
            this.code = code;
            this.info = info;
        }

        public String getCode() {
            return code;
        }

        public String getInfo() {
            return info;
        }

        public static WxTradeType GetValueByCode(String code) {
            for (WxTradeType e : WxTradeType.values()) {
                if (e.getCode().equals(code)) {
                    return e;
                }
            }
            throw new RuntimeException("枚举值错误");
        }
    }

    public enum EquipType {
        HORN("horn", "喇叭"), MACHINE("machine", "机器"), AIR_CONDITION("aircondition", "空调"), LIGHT("light", "电灯"), DOOR("door", "门禁");

        private final String code;
        private final String info;

        EquipType(String code, String info) {
            this.code = code;
            this.info = info;
        }

        public String getCode() {
            return code;
        }

        public String getInfo() {
            return info;
        }

        public static EquipType GetValueByCode(String code) {
            for (EquipType e : EquipType.values()) {
                if (e.getCode().equals(code)) {
                    return e;
                }
            }
            throw new RuntimeException("枚举值错误");
        }
    }

}
