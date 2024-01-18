package com.ruoyi.system.callback.dto;

import com.alibaba.fastjson2.annotation.JSONField;
import lombok.Data;

import java.util.List;

@Data
public class Called1100910018DTO {

    @JSONField(name = "member_list")
    private List<Called1100910018MemberDTO> memberList;

    @JSONField(name = "chatroom_info")
    private Called1100910018ChatroomInfoDTO chatroomInfo;

    @Data
    public static class Called1100910018MemberDTO {
        @JSONField(name = "is_admin")
        private Boolean isAdmin;

        @JSONField(name = "member_serial_no")
        private String memberSerialNo;

        @JSONField(name = "phone")
        private String phone;

        @JSONField(name = "user_name")
        private String userName;

        @JSONField(name = "last_name")
        private String lastName;

        @JSONField(name = "invite_serial_no")
        private String inviteSerialNo;

        @JSONField(name = "first_name")
        private String firstName;
    }

    @Data
    public static class Called1100910018ChatroomInfoDTO {

        /**
         * 群名称
         */
        @JSONField(name = "chatroom_name")
        private String chatroomName;

        @JSONField(name = "chatroom_name_base")
        private String chatroomNameBase;

        /**
         * 群编号
         */
        @JSONField(name = "chatroom_serial_no")
        private String chatroomSerialNo;

        /**
         * 备注
         */
        @JSONField(name = "remark")
        private String remark;

        /**
         * 总人数
         */
        @JSONField(name = "member_count")
        private Integer memberCount;

        /**
         * 被踢人数
         */
        @JSONField(name = "kicked_count")
        private Integer kickedCount;

        /**
         * 封号数
         */
        @JSONField(name = "banned_count")
        private Integer bannedCount;

        /**
         * 在线人数
         */
        @JSONField(name = "online_member_count")
        private Integer onlineMemberCount;

        /**
         * 群简介
         */
        @JSONField(name = "about")
        private String about;

        /**
         * 群链接
         */
        @JSONField(name = "link")
        private String link;

        @JSONField(name = "private_link")
        private String privateLink;

        /**
         * 是否频道
         */
        @JSONField(name = "is_channel")
        private Boolean isChannel;

        /**
         * 群类型：10私密群 20公开群
         */
        @JSONField(name = "type")
        private Integer type;
    }

}
