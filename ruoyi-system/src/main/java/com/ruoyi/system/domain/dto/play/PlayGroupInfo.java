package com.ruoyi.system.domain.dto.play;

import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

@Data
@ApiModel("剧本群信息表")
public class PlayGroupInfo {

    @ApiModelProperty("主键")
    @TableId
    private String groupId;

    @ApiModelProperty("商家Id")
    private String merchantId;

    @ApiModelProperty("群链接")
    private String groupUrl;

    @ApiModelProperty("群唯一标识")
    private String tgGroupId;

    @ApiModelProperty("群头像")
    private String groupImageUrl;

    @ApiModelProperty("群名称")
    private String tgGroupName;

    @ApiModelProperty("群成员数量")
    private String memberCount;

    @ApiModelProperty("所属任务ID")
    private String playId;

    @ApiModelProperty("0正常 1删除")
    private Integer isDelete;

    @ApiModelProperty("创建时间")
    private Date createTime;

    @ApiModelProperty("修改时间")
    private Date modifyTime;
}
