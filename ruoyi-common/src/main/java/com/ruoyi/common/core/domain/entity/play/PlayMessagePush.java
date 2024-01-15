package com.ruoyi.common.core.domain.entity.play;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("t_play_message_push")
public class PlayMessagePush {
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 剧本ID
     */
    private String playId;

    /**
     * 群ID
     */
    private String groupId;

    /**
     * 群名称
     */
    private String groupName;

    /**
     * 发言人数量
     */
    private Integer robotNum;

    /**
     * 内容数量
     */
    private Integer contentNum;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 修改时间
     */
    private Date modifyTime;

    /**
     * 推送状态:1:待发送 2:进行中 3:已结束 4:人工暂停 5:推送失败 6:系统暂停
     */
    private Integer pushState;

    /**
     * 推送时间
     */
    private Date pushTime;

    /**
     * 0正常 1删除
     */
    private Integer isDelete;

    /**
     * 0-TG
     */
    private Integer createType;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}
