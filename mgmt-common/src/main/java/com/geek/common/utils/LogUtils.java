package com.geek.common.utils;

/**
 * 处理并记录日志文件
 * 
 * @author xuek
 */
public class LogUtils
{
    public static String getBlock(Object msg)
    {
        if (msg == null)
        {
            msg = "";
        }
        return "[" + msg.toString() + "]";
    }
}
