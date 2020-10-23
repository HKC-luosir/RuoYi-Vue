package com.ruoyi.custom.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 合同对象 sys_contract
 * 
 * @author wonder
 * @date 2020-10-23
 */
public class SysContract extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 合同编号 */
    @Excel(name = "合同编号")
    private Long id;

    /** 客户姓名 */
    @Excel(name = "客户姓名")
    private String name;

    /** 电话 */
    @Excel(name = "电话")
    private String phone;

    /** 服务时间 */
    @Excel(name = "服务时间")
    private Integer serveTime;

    /** 金额 */
    @Excel(name = "金额")
    private BigDecimal amount;

    /** 文件路径 */
    @Excel(name = "文件路径")
    private String path;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }
    public void setServeTime(Integer serveTime) 
    {
        this.serveTime = serveTime;
    }

    public Integer getServeTime() 
    {
        return serveTime;
    }
    public void setAmount(BigDecimal amount) 
    {
        this.amount = amount;
    }

    public BigDecimal getAmount() 
    {
        return amount;
    }
    public void setPath(String path) 
    {
        this.path = path;
    }

    public String getPath() 
    {
        return path;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("phone", getPhone())
            .append("serveTime", getServeTime())
            .append("amount", getAmount())
            .append("path", getPath())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
