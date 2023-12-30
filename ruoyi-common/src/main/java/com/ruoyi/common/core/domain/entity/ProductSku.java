package com.ruoyi.common.core.domain.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("t_product_sku")
public class ProductSku {
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 商品id
     */
    private Long productId;

    /**
     * 价格 单位 分
     */
    private Long price;

    /**
     * 价格单位
     */
    private String priceUnit;

    /**
     * 支持量
     */
    private Long stock;

    /**
     * 国家编码
     */
    private String countyCode;

    /**
     * 国家名
     */
    private String countyName;
}
