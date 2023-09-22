package com.ruoyi.web.controller.system;

import java.util.List;
import java.util.Set;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.domain.entity.WxUser;
import com.ruoyi.common.core.domain.model.WxLoginBody;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.office.domain.vo.LoginByOtherSourceBody;
import com.ruoyi.office.domain.vo.MerchantBindingReq;
import io.swagger.annotations.ApiOperation;
import me.zhyd.oauth.config.AuthConfig;
import me.zhyd.oauth.request.AuthGiteeRequest;
import me.zhyd.oauth.request.AuthRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysMenu;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginBody;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.web.service.SysLoginService;
import com.ruoyi.framework.web.service.SysPermissionService;
import com.ruoyi.system.service.ISysMenuService;

/**
 * 登录验证
 *
 * @author ruoyi
 */
@RestController
public class SysLoginController {
    @Autowired
    private SysLoginService loginService;

    @Autowired
    private ISysMenuService menuService;

    @Autowired
    private SysPermissionService permissionService;

    /**
     * 登录方法
     *
     * @param loginBody 登录信息
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody) {
        AjaxResult ajax = AjaxResult.success();
        // 生成令牌
        String token = loginService.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getCode(),
                loginBody.getUuid());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }


    /**
     * 微信用户登录
     */
//    @Log(title = "微信用户信息", businessType = BusinessType.INSERT)
    @PostMapping("/wxLogin")
    public AjaxResult wxlogin(@RequestBody WxLoginBody loginBody) {
        String token = loginService.wxMaLogin(loginBody);
        AjaxResult ajax = AjaxResult.success();
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public AjaxResult getInfo() {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(user);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(user);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", user);
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        return ajax;
    }

    /**
     * 获取路由信息
     *
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public AjaxResult getRouters() {
        Long userId = SecurityUtils.getUserId();
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(userId);
        return AjaxResult.success(menuService.buildMenus(menus));
    }


    /**
     * 绑定后台账号
     *
     * @return
     */
    @ApiOperation("商家小程序绑定后台账号")
    @PostMapping("/binding")
    public AjaxResult binding(@RequestBody MerchantBindingReq bindingReq) {

        AjaxResult ajax = AjaxResult.success();
        final WxUser wxUser = SecurityUtils.getLoginUser().getWxUser();
        bindingReq.setOpenId(wxUser.getOpenId());
        // 生成令牌
        String token = loginService.binding(bindingReq, SecurityUtils.getLoginUser());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }
}
