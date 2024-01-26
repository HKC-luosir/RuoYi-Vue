package com.ruoyi.system.domain.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 朱少波
 * @date 2024/1/25/025 11:10
 */
@Data
@ApiModel("筛选任务批量次总信息VO")
public class TaskBatchProgressVO {

    @ApiModelProperty(value = "全部批次")
    private List<ScreeningBatchProgressVO> totalList = new ArrayList<>();

    @ApiModelProperty(value = "待检查批次")
    private List<ScreeningBatchProgressVO> waitList  = new ArrayList<>();

    @ApiModelProperty(value = "检查中")
    private List<ScreeningBatchProgressVO> screeningList  = new ArrayList<>();

    @ApiModelProperty(value = "暂停")
    private List<ScreeningBatchProgressVO> stopList  = new ArrayList<>();

    @ApiModelProperty(value = "完成")
    private List<ScreeningBatchProgressVO> completeList  = new ArrayList<>();

    @ApiModelProperty(value = "取消")
    private List<ScreeningBatchProgressVO> cancelList  = new ArrayList<>();

}
