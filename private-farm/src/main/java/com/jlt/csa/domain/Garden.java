package com.jlt.csa.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 菜地划分对象 csa_garden
 * 
 * @author 郏磊涛
 * @date 2022-03-24
 */
public class Garden extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 菜地编号 */
    @Excel(name = "菜地编号")
    private String code;

    /** 分区代码 */
    @Excel(name = "分区代码")
    private String zoneCode;

    /** 菜地名称 */
    @Excel(name = "菜地名称")
    private String name;

    /** 平方米 */
    @Excel(name = "平方米")
    private BigDecimal m2;

    /** 会员id */
    private Long memberId;

    /** 菜地管理员id */
    private Long managerId;

    /** 工人id */
    private Long workerId;

    /** 客服人员id */
    private Long contacterId;

    /** 耕作状态 */
    private String isFarming;

    /** 售出状态 */
    private String isSelled;

    /** 竣工状态 */
    @Excel(name = "竣工状态")
    private String isCompleted;

    /** 状态（0正常 1停用） */
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setCode(String code) 
    {
        this.code = code;
    }

    public String getCode() 
    {
        return code;
    }
    public void setZoneCode(String zoneCode) 
    {
        this.zoneCode = zoneCode;
    }

    public String getZoneCode() 
    {
        return zoneCode;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setM2(BigDecimal m2) 
    {
        this.m2 = m2;
    }

    public BigDecimal getM2() 
    {
        return m2;
    }
    public void setMemberId(Long memberId) 
    {
        this.memberId = memberId;
    }

    public Long getMemberId() 
    {
        return memberId;
    }
    public void setManagerId(Long managerId) 
    {
        this.managerId = managerId;
    }

    public Long getManagerId() 
    {
        return managerId;
    }
    public void setWorkerId(Long workerId) 
    {
        this.workerId = workerId;
    }

    public Long getWorkerId() 
    {
        return workerId;
    }
    public void setContacterId(Long contacterId) 
    {
        this.contacterId = contacterId;
    }

    public Long getContacterId() 
    {
        return contacterId;
    }
    public void setIsFarming(String isFarming) 
    {
        this.isFarming = isFarming;
    }

    public String getIsFarming() 
    {
        return isFarming;
    }
    public void setIsSelled(String isSelled) 
    {
        this.isSelled = isSelled;
    }

    public String getIsSelled() 
    {
        return isSelled;
    }
    public void setIsCompleted(String isCompleted) 
    {
        this.isCompleted = isCompleted;
    }

    public String getIsCompleted() 
    {
        return isCompleted;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("code", getCode())
            .append("zoneCode", getZoneCode())
            .append("name", getName())
            .append("m2", getM2())
            .append("memberId", getMemberId())
            .append("managerId", getManagerId())
            .append("workerId", getWorkerId())
            .append("contacterId", getContacterId())
            .append("isFarming", getIsFarming())
            .append("isSelled", getIsSelled())
            .append("isCompleted", getIsCompleted())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
