package com.ruoyi.system.extend.data;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class GetChatRoomJoinTaskDetailInfoListInput extends UtTouchQueryPage{
    private String taskId;
    private String vcChatRoomSerialNo;
    private String objName;
    private Integer runStatus;
    private String robotId;
    private LocalDateTime chatRoomJoinTimeBegin;
    private LocalDateTime chatRoomJoinTimeEnd;
    private Integer status;
    private Integer robotLogicStatus;
    private Integer phoneStatus;
    private Integer userNameStatus;
    private Integer isInChatRoom;
    private String chatRoomUrl;
    private String userCode;
}
