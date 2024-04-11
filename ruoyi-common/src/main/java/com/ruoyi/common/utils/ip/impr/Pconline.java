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
public class Pconline implements IAddressIP
{

    // IP地址查询
    public static final String IP_URL = "http://whois.pconline.com.cn/ipJson.jsp";
    private static final Logger log = LoggerFactory.getLogger(Pconline.class);

    /**
     * 太平洋电脑网
     *
     * @param ip IP地址
     * @return 地址
     */
    public String getRealAddressByIP(String ip)
    {
        String rspStr = HttpUtils.sendGet(IP_URL, "ip=" + ip + "&json=true", Constants.GBK);
        if (StringUtils.isEmpty(rspStr))
        {
            log.error("获取地理位置异常 {}", ip);
            return rspStr;
        }
        JSONObject obj = JSON.parseObject(rspStr);
        String region = obj.getString("pro");
        String city = obj.getString("city");
        String addr = obj.getString("addr");
        if (addr.isEmpty())
        {
            return String.format("%s %s", region, city);
        }
        else
        {
            return city;
        }
    }
}
