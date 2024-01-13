package com.ruoyi.system.domain.dto.play;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class PlayExt {
    @ApiModelProperty(value = "群成员是否禁言：1-是 0-否")
    private Integer memberNsgState;

    @ApiModelProperty(value = "是否拉bot助手：1-是 0-否")
    private Integer botState;

    @ApiModelProperty(value = "炒群结束水军是否自动退群：1-是 0-否")
    private Integer quitState;

    @ApiModelProperty(value = "是否使用备用号：1-是 0-否")
    private Integer standbyState;
}
