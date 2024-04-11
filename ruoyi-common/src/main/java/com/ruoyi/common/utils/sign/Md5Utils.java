package com.ruoyi.common.utils.sign;

import org.springframework.util.DigestUtils;
import java.io.IOException;
import java.io.InputStream;

/**
 * Md5加密方法
 *
 * @author ruoyi
 */
public class Md5Utils {

    /**
     * 效验MD5
     * @param s 任意字符串
     * @return md5的值
     */
    public static String hash(String s) {
        return hash(s.getBytes());
    }

    /**
     * 效验MD5
     * @param s 字节
     * @return md5的值
     */
    public static String hash(byte s[]) {
        return DigestUtils.md5DigestAsHex(s);
    }

    /**
     * 效验MD5
     * @param s 文件流
     * @return md5的值
     */
    public static String hash(InputStream s) throws IOException {
        return DigestUtils.md5DigestAsHex(s);
    }


}
