package com.ruoyi.common.utils.ip.impr;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.common.utils.ip.IAddressIP;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 获取地址类
 *
 * @author bigroc
 */
public class CSDN implements IAddressIP
{

    public static final String IP_URL = "https://searchplugin.csdn.net/api/v1/ip/get";
    private static final Logger log = LoggerFactory.getLogger(CSDN.class);

    /**
     * CSDN ip查询
     * 暂不确定是否有次数限制
     * 实际使用要比 Pconline 效果好一些。
     *
     * @param ip IP地址
     * @return 地址
     */
    @Override
    public String getRealAddressByIP(String ip)
    {
        String rspStr = HttpUtils.sendGet(IP_URL, "ip=" + ip, Constants.UTF8);
        if (StringUtils.isEmpty(rspStr))
        {
            log.error("获取地理位置异常 {}", ip);
            return "";
        }
        JSONObject obj = JSON.parseObject(rspStr);
        JSONObject data = obj.getJSONObject("data");
        String city = data.getString("address");
        if (city.isEmpty())
        {
            return String.format("%s", city);
        }
        else
        {
            return city;
        }
    }
}
