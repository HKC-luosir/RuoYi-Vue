package com.ruoyi.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.system.bot.mode.output.BotInfoVO;
import com.ruoyi.system.callback.dto.bot.MemberQuantityDTO;
import com.ruoyi.system.domain.GroupMonitorInfo;
import com.ruoyi.system.domain.vo.GroupPlayInfoVO;

import java.util.List;

/**
 * 群bot监控返回信息(GroupMonitorInfo)表服务接口
 *
 * @author 朱少波
 * @since 2024-01-15 13:51:31
 */
public interface GroupMonitorInfoService extends IService<GroupMonitorInfo> {

    void add(List<String> groupIds);

    void setPlayId(List<String> groupIds,String playId);

    void robotCheck(String groupId);

    void updateRobotSerialNo(String groupId, String botSerialNo,String robotSerialNo);

    void setBotInfo(String groupId, BotInfoVO bo);

    void updateOriginalGroupId(String groupId,String oldOriginalGroupId, String originalGroupId);

    void updateOriginalGroupIdByBot(String botId, String robotId, String originalGroupId);


    GroupMonitorInfo originalGroupIdChange(String botId, String oldGroupId, String newGroupId);

    int updateInfo(MemberQuantityDTO dto);

    void updateInfo(String id, MemberQuantityDTO dto);

    void setBotAdmin(String groupId);

    void setBotAdMonitor(String groupId);

    List<String> updateBanned(String originalGroupId);

    void updateBannedById(String groupId);

    List<GroupMonitorInfo> getPlayOriginalGroupId();


    /**
     * 根据原始官方群ID 找到最近一个剧本信息
     * @param originalGroupId
     * @return
     */
    GroupPlayInfoVO getGroupPlayInfoVO(String originalGroupId);


}
