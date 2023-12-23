package com.ruoyi.web.controller.business;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.MerchantInfo;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.dto.QueryMerchantPageDTO;
import com.ruoyi.system.service.MerchantInfoService;
import com.ruoyi.system.service.UserMerchantRefService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @Author : XGF（徐桂烽）
 * @create 2023/12/23/023 10:25
 * @Description : 商家管理
 */
@RestController
@RequestMapping("merchant")
public class MerchantController extends BaseController {

    @Resource
    private UserMerchantRefService userMerchantRefService;

    @Resource
    private MerchantInfoService merchantInfoService;

    @PostMapping("page")
    public AjaxResult page(@Validated @RequestBody QueryMerchantPageDTO dto){
        dto.setUserId(1L);
        Page<MerchantInfo> page = merchantInfoService.page(dto);
        return AjaxResult.success(page);
    }


}
