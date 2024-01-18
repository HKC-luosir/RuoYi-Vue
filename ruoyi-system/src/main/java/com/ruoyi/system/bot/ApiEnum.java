package com.ruoyi.system.bot;

import lombok.AllArgsConstructor;
import lombok.Getter;


@Getter
@AllArgsConstructor
public enum ApiEnum {

    GET_BOT("分页获取bot", "/api/v1/bot/page"),

    SET_BOT_AD_MONITOR("设置机器广告监控", "/api/v1/botAd/addOrUpdate"),

    ;

    /**
     * Api描述
     */
    private final String apiDesc;
    /**
     * 请求地址
     */
    private final String requestUrl;



}
