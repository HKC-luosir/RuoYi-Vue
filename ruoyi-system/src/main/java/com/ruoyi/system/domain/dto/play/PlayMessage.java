package com.ruoyi.system.domain.dto.play;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class PlayMessage {
    @ApiModelProperty(value = "发言人标识")
    private String label;

    @ApiModelProperty(value = "剧本内容")
    private MessageContent messageContent;
}
