package com.ruoyi.web.controller.common;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.sign.Base64;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.framework.web.service.CaptchaService;
import com.ruoyi.system.service.ISysConfigService;
import org.springframework.util.FastByteArrayOutputStream;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

/**
 * 验证码操作处理
 *
 * @author ruoyi
 */
@RestController
public class CaptchaController
{
    private final CaptchaService captchaService;

    private final ISysConfigService configService;

    public CaptchaController(CaptchaService captchaService, ISysConfigService configService) {
        this.captchaService = captchaService;
        this.configService = configService;
    }

    /**
     * 生成验证码
     */
    @GetMapping("/captchaImage")
    public AjaxResult getCode()
    {
        AjaxResult ajax = AjaxResult.success();
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        ajax.put("captchaEnabled", captchaEnabled);
        if (!captchaEnabled)
        {
            return ajax;
        }

        // 获取验证码信息
        String uuid = IdUtils.simpleUUID();
        FastByteArrayOutputStream os;
        try {
            os = (FastByteArrayOutputStream)captchaService.getCaptchaOutputStream(uuid);
        } catch (IOException e) {
            return AjaxResult.error(e.getMessage());
        }

        ajax.put("uuid", uuid);
        ajax.put("img", Base64.encode(os.toByteArray()));
        return ajax;
    }
}
