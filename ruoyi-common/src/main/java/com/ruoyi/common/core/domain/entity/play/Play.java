package com.ruoyi.common.core.domain.entity.play;

import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.core.domain.dto.play.AdMonitor;
import com.ruoyi.common.core.domain.dto.play.PlayExt;
import com.ruoyi.common.core.domain.dto.play.SendMechanism;
import com.ruoyi.common.utils.StringUtils;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
@TableName("t_play_info")
public class Play {
    @TableId
    private String id;

    /**
     * 名称
     */
    private String name;

    /**
     * 群来源：0-平台提供 1-外部群
     */
    private Integer groupSource;

    /**
     * 平台群条件:群注册天数
     */
    private Integer groupDay;

    /**
     * 平台群条件:群需求数量
     */
    private Integer groupNum;

    /**
     * 炒群条件类型：0-人数 1-时间
     */
    private Integer groupCondition;

    /**
     * 人数炒群条件 群人数
     */
    private Integer userNum;

    /**
     * 时间炒群条件 时间类型：0-立即开始 1定时开始
     */
    private Integer startType;

    /**
     *  时间炒群条件 开始炒群时间
     */
    private Date startGroupDate;

    /**
     * 外包群邀请链接
     */
    private String groupUrls;

    /**
     * 外包群邀请链接数量
     */
    private String groupUrlNum;

    /**
     * 每个群演员数
     */
    private Integer robotNum;

    /**
     * 混淆状态：0-不混淆 1-混淆
     */
    private Integer isConfound;

    /**
     * 混淆状态 0-未混淆 1-已混淆 2-混淆失败
     */
    private Integer confoundState;
    
    /**
     * 号人设状态 0-未执行 1-已执行
     */
    private Integer robotSettingsState;

    /**
     * 剧本状态：1-调度中 2-炒群中 3-已暂停 4-已取消 5-已完成
     */
    private Integer state;

    /**
     * 发送机制配置
     */
    private String sendMechanism;

    /**
     * 广告监控配置
     */
    private String adMonitor;

    /**
     * 扩展配置
     */
    private String playExt;

    /**
     * 接粉号池
     */
    private String urlPool;

    /**
     * 商家id
     */
    private String merchantId;

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 是否删除: 0否 1是
     */
    @TableLogic(value = "0", delval = "1")
    private Integer isDelete;

    /**
     * 速度
     */
    private BigDecimal speed;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * TITLE : 剧本执行进度：0未开始 1调度修改群人设中 2 调用入群中 3 入群等待中 4 混淆 5 号分配,人设 6等待超群条件 7发剧本
     */
    private Integer scanProgress;

    /**
     * 内容目标国编码
     */
    private String targetCountyCode;

    /**
     * 内容目标国名称
     */
    private String targetCountyName;

    /**
     * 失败原因
     */
    private String failReason;

    /**
     * 是否锁定水军
     */
    private Integer lockRobotStatus;

    private Long productId;

    /**
     * 剧本最终状态时间(取消或完成)
     */
    private Date endDate;

    /**
     * 筛选群条件: 1私密群组 2公开群组
     */
    private Integer groupType;

    public SendMechanism convertSendMechanismStr() {
        if (StringUtils.isEmpty(this.sendMechanism)) {
            return null;
        }
        return JSONObject.parseObject(this.sendMechanism, SendMechanism.class);
    }

    public AdMonitor convertAdMonitorStr() {
        if (StringUtils.isEmpty(this.adMonitor)) {
            return null;
        }
        return JSONObject.parseObject(this.adMonitor, AdMonitor.class);
    }

    public PlayExt convertPlayExtStr() {
        if (StringUtils.isEmpty(this.playExt)) {
            return null;
        }
        return JSONObject.parseObject(this.playExt, PlayExt.class);
    }
}
