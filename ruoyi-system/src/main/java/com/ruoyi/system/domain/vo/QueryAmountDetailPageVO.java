package com.ruoyi.system.domain.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @Author : XGF（徐桂烽）
 * @create 2023/12/26/026 10:08
 * @Description :
 */
@Data
public class QueryAmountDetailPageVO {
    @ApiModelProperty("主键ID")
    private String detailId;

    @ApiModelProperty("商家ID")
    private String merchantId;

    @ApiModelProperty("操作类型 1-划拨 2-消费 3-退款 4-扣款")
    private Integer operationType;

    @ApiModelProperty("变动金额")
    private Long changeAmount;

    @ApiModelProperty("订单编号")
    private String orderId;

    @ApiModelProperty("描述")
    private String describe;

    @ApiModelProperty("创建时间")
    private Date createTime;

    @ApiModelProperty("修改时间")
    private Date modifyTime;
}
