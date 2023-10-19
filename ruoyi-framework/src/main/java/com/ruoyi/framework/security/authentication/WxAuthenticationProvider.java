package com.ruoyi.framework.security.authentication;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaJscode2SessionResult;
import cn.binarywang.wx.miniapp.bean.WxMaPhoneNumberInfo;
import com.ruoyi.common.core.domain.model.WxLoginBody;
import com.ruoyi.common.enums.UserStatus;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.ip.IpUtils;
import com.ruoyi.common.config.WxMaServiceUtil;
import com.ruoyi.framework.manager.AsyncManager;
import com.ruoyi.framework.web.service.UserDetailsServiceImpl;
import com.ruoyi.common.core.domain.entity.WxUser;
import com.ruoyi.office.mapper.WxUserMapper;
import me.chanjar.weixin.common.bean.WxOAuth2UserInfo;
import me.chanjar.weixin.common.bean.oauth2.WxOAuth2AccessToken;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import org.aspectj.weaver.patterns.IToken;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class WxAuthenticationProvider implements AuthenticationProvider {

    private static final Logger log = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

    private UserDetailsServiceImpl userDetailsService;

    private WxUserMapper userMapper;

    @Autowired WxMaServiceUtil wxMaServiceUtil;

    @Autowired
    private WxMpService wxMpService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        WxLoginBody loginBody = (WxLoginBody) authentication.getCredentials();
        try {
            String openId = null, unionId = null, mpOpenId = null;
            WxOAuth2AccessToken wxOAuth2AccessToken = null;
            if(wxMpService.getWxMpConfigStorage().getAppId().equals(loginBody.getAppId())){
                unionId = "o1BWs6GDb1moZ-ZaZ3akmtu34f_8";
                mpOpenId = "oNosp6iNzApsGyyEOq9mJ1dNngps";
//                wxOAuth2AccessToken = wxMpService.getOAuth2Service().getAccessToken(loginBody.getCode());
//                mpOpenId = wxOAuth2AccessToken.getOpenId();
//                unionId = wxOAuth2AccessToken.getUnionId();
            }else{
                WxMaService wxMaService = StringUtils.isEmpty(loginBody.getAppId()) ?
                        wxMaServiceUtil.getMaServiceByName(loginBody.getAppName()) : wxMaServiceUtil.getMaServiceById(loginBody.getAppId());
                WxMaJscode2SessionResult result = wxMaService.jsCode2SessionInfo(loginBody.getCode());
                openId = result.getOpenid();
                unionId = result.getUnionid();
            }

            WxUser wxUser = userMapper.selectUserByUnionId(unionId);
            if (wxUser == null) {
                wxUser = createUser(openId, unionId, mpOpenId, loginBody.getInviteCode());
            } else if(UserStatus.DISABLE.getCode().equals(wxUser.getStatus())) {
                log.info("登录用户：{} 已被停用.", wxUser.getUnionId());
                throw new ServiceException("对不起，您的账号：" + wxUser.getUnionId() + " 已停用");
            } else {
                updateUser(wxUser, openId, mpOpenId);
            }
            if(wxOAuth2AccessToken != null){
                updateWxMpUserInfo(wxUser, wxOAuth2AccessToken);
            }
            UserDetails userDetails = userDetailsService.createWxLoginUser(wxUser);
            WxAuthenticationToken authenticationToken = new WxAuthenticationToken(userDetails, loginBody, userDetails.getAuthorities());
            return authenticationToken;
        } catch (WxErrorException e) {
            throw new ServiceException("微信小程序登录出错");
        }
    }

    private WxUser createUser(String openId, String unionId, String mpOpenId, String inviteCode){
        WxUser wxUser = new WxUser();
        wxUser.setNickName("微信用户");
        if(openId != null){
            wxUser.setOpenId(openId);
        }
        if(mpOpenId != null){
            wxUser.setMpOpenId(mpOpenId);
        }
        wxUser.setUnionId(unionId);
        wxUser.setCreateBy("admin");
        wxUser.setCreateTime(new Date());
        wxUser.setLoginDate(DateUtils.getNowDate());
        wxUser.setLoginIp(IpUtils.getIpAddr());
        if (StringUtils.isNotEmpty(inviteCode)) {
            wxUser.setShareCode(inviteCode);
            // 新用户奖励 待补充

        }
        userMapper.insertWxUser(wxUser);
        return wxUser;
    }

    private void updateUser(WxUser wxUser, String openId, String mpOpenId){
        if(openId != null){
            wxUser.setOpenId(openId);
        }
        if(mpOpenId != null){
            wxUser.setMpOpenId(mpOpenId);
        }
        wxUser.setUpdateTime(DateUtils.getNowDate());
        wxUser.setLoginDate(DateUtils.getNowDate());
        userMapper.updateWxUser(wxUser);
    }

    private void updateWxMpUserInfo(WxUser wxUser, WxOAuth2AccessToken token){
        AsyncManager.me().execute(()->{
            try {
                WxOAuth2UserInfo wxOAuth2UserInfo = wxMpService.getOAuth2Service().getUserInfo(token, null);
                WxUser toUpdate = new WxUser();
                toUpdate.setId(wxUser.getId());
                toUpdate.setNickName(wxOAuth2UserInfo.getNickname());
                userMapper.updateWxUser(toUpdate);
            } catch (WxErrorException e) {
                e.printStackTrace();
            }
        });
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return WxAuthenticationToken.class.isAssignableFrom(authentication);
    }

    @Autowired
    public void setUserDetailsService(UserDetailsServiceImpl userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    @Autowired
    public void setUserMapper(WxUserMapper userMapper) {
        this.userMapper = userMapper;
    }
}
