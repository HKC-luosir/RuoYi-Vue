package com.ruoyi.system.domain.vo;

import com.alibaba.fastjson2.annotation.JSONField;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * @author 朱少波
 * @date 2024/1/25/025 10:31
 */
@Data
@ApiModel("批次进度VO")
public class ScreeningBatchProgressVO extends ScreeningBatchVO {

    @ApiModelProperty(value = "批次任务状态： 0，待进行  1、进行中 2、暂停 3、取消 4、已完成")
    private Integer batchState;

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "导入时间")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "号码总数")
    private Long targetCount;

    @ApiModelProperty(value = "筛查总数")
    private Long screeningCount;

    @ApiModelProperty(value = "进度")
    private BigDecimal screeningRadio;

    @ApiModelProperty(value = "有效号码数")
    private Long validCount;

    @ApiModelProperty(value = "有效率")
    private BigDecimal validRadio;


}
