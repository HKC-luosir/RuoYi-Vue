package com.ruoyi.system.extend.data;

import lombok.Data;

@Data
public class GetChatRoomJoinTaskDetailInput {

    private long taskID;

    private long isCache;

    private String userCode;

}
