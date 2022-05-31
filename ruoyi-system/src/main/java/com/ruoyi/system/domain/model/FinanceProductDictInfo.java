package com.ruoyi.system.domain.model;

/**
 * @author renjf
 * @date 2022年05月26日 16:13
 */
public class FinanceProductDictInfo {
    // 搜索值
    private String searchValue;

    // 创建者
    private String createBy;

    // 更新者
    private String updateBy;

    // 更新时间
    private String updateTime;

    // 字典编码
    private String dictCode;

    // 字典排序
    private String dictSort;

    // 字典标签
    private String dictLabel;

    // 字典类型键值
    private String dictValue;

    // 字典类型
    private String dictType;

    // 样式属性（其他样式扩展）
    private String cssClass;

    // 表格字典样式
    private String listClass;

    // 是否默认（Y是 N否）
    private String isDefault;

    // 状态（0正常 1停用）
    private String status;


    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getDictCode() {
        return dictCode;
    }

    public void setDictCode(String dictCode) {
        this.dictCode = dictCode;
    }

    public String getDictSort() {
        return dictSort;
    }

    public void setDictSort(String dictSort) {
        this.dictSort = dictSort;
    }

    public String getDictLabel() {
        return dictLabel;
    }

    public void setDictLabel(String dictLabel) {
        this.dictLabel = dictLabel;
    }

    public String getDictValue() {
        return dictValue;
    }

    public void setDictValue(String dictValue) {
        this.dictValue = dictValue;
    }

    public String getDictType() {
        return dictType;
    }

    public void setDictType(String dictType) {
        this.dictType = dictType;
    }

    public String getCssClass() {
        return cssClass;
    }

    public void setCssClass(String cssClass) {
        this.cssClass = cssClass;
    }

    public String getListClass() {
        return listClass;
    }

    public void setListClass(String listClass) {
        this.listClass = listClass;
    }

    public String getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(String isDefault) {
        this.isDefault = isDefault;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "FinanceProductDictInfo{" +
                "searchValue='" + searchValue + '\'' +
                ", createBy='" + createBy + '\'' +
                ", updateBy='" + updateBy + '\'' +
                ", updateTime='" + updateTime + '\'' +
                ", dictCode='" + dictCode + '\'' +
                ", dictSort='" + dictSort + '\'' +
                ", dictLabel='" + dictLabel + '\'' +
                ", dictValue='" + dictValue + '\'' +
                ", dictType='" + dictType + '\'' +
                ", cssClass='" + cssClass + '\'' +
                ", listClass='" + listClass + '\'' +
                ", isDefault='" + isDefault + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
