package com.ruoyi.system.domain.dto.play;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * @Author : XGF（徐桂烽）
 * @create 2024/1/18/018 10:35
 * @Description :
 */
@ApiModel("炒群状态操作")
@Data
public class PushOperationDTO {

    @ApiModelProperty("推送ID")
    @NotNull(message = "推送ID不能为空")
    private Integer pushId;

    @ApiModelProperty("操作类型 0-暂停 1-继续 2-取消 3-强制开炒")
    @NotNull(message = "操作类型不能为空")
    private Integer op;
}
