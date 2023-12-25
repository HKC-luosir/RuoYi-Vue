package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 storage
 * 
 * @author ruoyi
 * @date 2023-12-19
 */
public class Storage extends BaseEntity
{
    private static final long serialVersionUID = 1L;
//    @Excel(name = "入库人")
    private Long deptId;

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    private Long userId;
    private Integer[] ids;
    private String imgSrc;
    private Integer kpStatus;

    public String getImgSrc() {
        return imgSrc;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }

    public Integer getKpStatus() {
        return kpStatus;
    }

    public void setKpStatus(Integer kpStatus) {
        this.kpStatus = kpStatus;
    }

    public Integer[] getIds() {
        return ids;
    }

    public void setIds(Integer[] ids) {
        this.ids = ids;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
    private Double minMoney;
    private Double maxMoney;
    private String minDate;
    private String maxDate;

    public String getMinDate() {
        return minDate;
    }

    public void setMinDate(String minDate) {
        this.minDate = minDate;
    }

    public String getMaxDate() {
        return maxDate;
    }

    public void setMaxDate(String maxDate) {
        this.maxDate = maxDate;
    }

    public Double getMinMoney() {
        return minMoney;
    }

    public void setMinMoney(Double minMoney) {
        this.minMoney = minMoney;
    }

    public Double getMaxMoney() {
        return maxMoney;
    }

    public void setMaxMoney(Double maxMoney) {
        this.maxMoney = maxMoney;
    }

    /** id */
    private Integer id;

    /** 入库编码 */
    @Excel(name = "入库编码")
    private String stoId;

    /** 名称 */
    @Excel(name = "名称")
    private String stoName;

    /** 规格型号 */
    @Excel(name = "规格型号")
    private String stoType;

    /** 单位 */
    @Excel(name = "单位")
    private String stoUnit;

    /** 数量 */
    @Excel(name = "数量")
    private Integer stoNum;

    /** 单价 */
    @Excel(name = "单价")
    private BigDecimal stoPrice;

    /** 金额 */
    @Excel(name = "金额")
    private BigDecimal stoMoney;

    /** 备注 */
    @Excel(name = "备注")
    private String stoRemark;

    /** 经办人 */
    private Long stoAttn;
    @Excel(name = "经办人")
    private String attnName;
    /** 验收人 */
    private Long stoAcce;
    @Excel(name = "验收人")
    private String acceName;
    /** 保管人 */
    private Long stoStor;
    @Excel(name = "保管人")
    private String storName;

    public String getAttnName() {
        return attnName;
    }

    public void setAttnName(String attnName) {
        this.attnName = attnName;
    }

    public String getAcceName() {
        return acceName;
    }

    public void setAcceName(String acceName) {
        this.acceName = acceName;
    }

    public String getStorName() {
        return storName;
    }

    public void setStorName(String storName) {
        this.storName = storName;
    }

    /** 入库日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "入库日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date stoDate;

    /** 录入日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "录入日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date entryDate;

    /** 录入人 */
    private Long entryId;

    @Excel(name = "录入人")
    private String entryName;
    /** 修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
//    @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date editDate;

    /** 修改人 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Long editId;
//    @Excel(name = "修改人")
    private String editName;

    public String getEntryName() {
        return entryName;
    }

    public void setEntryName(String entryName) {
        this.entryName = entryName;
    }

    public String getEditName() {
        return editName;
    }

    public void setEditName(String editName) {
        this.editName = editName;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
    }
    public void setStoId(String stoId)
    {
        this.stoId = stoId;
    }

    public String getStoId()
    {
        return stoId;
    }
    public void setStoName(String stoName) 
    {
        this.stoName = stoName;
    }

    public String getStoName() 
    {
        return stoName;
    }
    public void setStoType(String stoType) 
    {
        this.stoType = stoType;
    }

    public String getStoType() 
    {
        return stoType;
    }
    public void setStoUnit(String stoUnit) 
    {
        this.stoUnit = stoUnit;
    }

    public String getStoUnit() 
    {
        return stoUnit;
    }
    public void setStoNum(Integer stoNum) 
    {
        this.stoNum = stoNum;
    }

    public Integer getStoNum() 
    {
        return stoNum;
    }
    public void setStoPrice(BigDecimal stoPrice) 
    {
        this.stoPrice = stoPrice;
    }

    public BigDecimal getStoPrice() 
    {
        return stoPrice;
    }
    public void setStoMoney(BigDecimal stoMoney) 
    {
        this.stoMoney = stoMoney;
    }

    public BigDecimal getStoMoney() 
    {
        return stoMoney;
    }
    public void setStoRemark(String stoRemark) 
    {
        this.stoRemark = stoRemark;
    }

    public String getStoRemark() 
    {
        return stoRemark;
    }
    public void setStoAttn(Long stoAttn) 
    {
        this.stoAttn = stoAttn;
    }

    public Long getStoAttn() 
    {
        return stoAttn;
    }
    public void setStoAcce(Long stoAcce) 
    {
        this.stoAcce = stoAcce;
    }

    public Long getStoAcce() 
    {
        return stoAcce;
    }
    public void setStoStor(Long stoStor) 
    {
        this.stoStor = stoStor;
    }

    public Long getStoStor() 
    {
        return stoStor;
    }
    public void setStoDate(Date stoDate) 
    {
        this.stoDate = stoDate;
    }

    public Date getStoDate() 
    {
        return stoDate;
    }
    public void setEntryDate(Date entryDate) 
    {
        this.entryDate = entryDate;
    }

    public Date getEntryDate() 
    {
        return entryDate;
    }
    public void setEntryId(Long entryId) 
    {
        this.entryId = entryId;
    }

    public Long getEntryId() 
    {
        return entryId;
    }
    public void setEditDate(Date editDate) 
    {
        this.editDate = editDate;
    }

    public Date getEditDate() 
    {
        return editDate;
    }
    public void setEditId(Long editId)
    {
        this.editId = editId;
    }

    public Long getEditId()
    {
        return editId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("stoId", getStoId())
            .append("stoName", getStoName())
            .append("stoType", getStoType())
            .append("stoUnit", getStoUnit())
            .append("attnName", getAttnName())
            .append("acceName", getAcceName())
            .append("storName", getStoName())
            .append("stoNum", getStoNum())
            .append("stoPrice", getStoPrice())
            .append("stoMoney", getStoMoney())
            .append("stoRemark", getStoRemark())
            .append("stoAttn", getStoAttn())
            .append("stoAcce", getStoAcce())
            .append("stoStor", getStoStor())
            .append("stoDate", getStoDate())
            .append("entryDate", getEntryDate())
            .append("entryId", getEntryId())
            .append("editDate", getEditDate())
            .append("editId", getEditId())
            .toString();
    }
}
