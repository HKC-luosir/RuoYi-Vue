package com.ruoyi.office.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 微信用户信息 t_wx_user对象 t_wx_user
 *
 * @author ruoyi
 * @date 2023-05-30
 */
@Data
public class TWxUser extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    private Long id;

    /**
     * 昵称
     */
    @Excel(name = "昵称")
    private String nickName;

    /**
     * 微信app id
     */
    @Excel(name = "微信openId")
    private String openId;

    /**
     * uinion id
     */
    @Excel(name = "uinion id")
    private String unionId;

    private String mpOpenId;

    /**
     * 手机号
     */
    @Excel(name = "手机号")
    private String phone;

    /**
     * 分享码
     */
    @Excel(name = "分享码")
    private String shareCode;

    /**
     * 微信code
     */
    @Excel(name = "微信code")
    private String wxCode;

    /**
     * 邀请人手机号
     */
    @Excel(name = "邀请人手机号")
    private String inviterPhone;

    /**
     * 是否会员
     */
    @Excel(name = "是否会员")
    private String isMember;

    /**
     * 性别
     */
    @Excel(name = "性别")
    private String sex;

    /**
     * 登录ip
     */
    @Excel(name = "登录ip")
    private String loginIp;

    /**
     * 登录时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "登录时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date loginDate;

    /**
     * 状态
     */
    @Excel(name = "状态")
    private Long status;

    private Long userId;
    private String userType;

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getUserType() {
        return userType;
    }
}
