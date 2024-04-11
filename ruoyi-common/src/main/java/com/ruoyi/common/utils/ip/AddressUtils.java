package com.ruoyi.common.utils.ip;

import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.ip.impr.CSDN;
import com.ruoyi.common.utils.ip.impr.Pconline;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.LinkedList;
import java.util.List;

/**
 * 获取地址类
 *
 * @author ruoyi
 */
public class AddressUtils
{
    // 未知地址
    public static final String UNKNOWN = "位置未知";
    // 日志
    private static final Logger log = LoggerFactory.getLogger(AddressUtils.class);
    // 地址查询服务列表
    private static final List<IAddressIP> addressServiceList = new LinkedList<>();

    // 加载所有实现类
    static
    {
        addressServiceList.add(new CSDN());
        addressServiceList.add(new Pconline());
    }

    public static String getRealAddressByIP(String ip)
    {
        // 内网不查询
        if (IpUtils.internalIp(ip))
        {
            return "内网IP";
        }
        if (RuoYiConfig.isAddressEnabled())
        {
            try
            {
                for (IAddressIP addressService : addressServiceList)
                {
                    String address = addressService.getRealAddressByIP(ip);
                    if (StringUtils.isNotEmpty(address))
                    {
                        return address;
                    }
                }
            }
            catch (Exception e)
            {
                log.error("获取地理位置异常 {}", ip);
            }
        }
        return UNKNOWN;
    }
}
