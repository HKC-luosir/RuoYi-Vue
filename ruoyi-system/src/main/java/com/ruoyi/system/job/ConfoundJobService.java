package com.ruoyi.system.job;

import cn.hutool.core.date.DateUtil;
import com.ruoyi.common.constant.PlayConstants;
import com.ruoyi.common.core.domain.entity.play.Play;
import com.ruoyi.common.core.redis.RedisLock;
import com.ruoyi.common.core.thread.AsyncTask;
import com.ruoyi.system.domain.PlayMessageConfound;
import com.ruoyi.system.domain.vo.PlayConfusionStateVO;
import com.ruoyi.system.domain.vo.PlayMessageConfusionStateVO;
import com.ruoyi.system.mapper.PlayMapper;
import com.ruoyi.system.mapper.PlayMessageConfoundMapper;
import com.ruoyi.system.service.PlayMessageConfoundLogService;
import com.ruoyi.system.service.PlayMessagePushService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @Author : XGF（徐桂烽）
 * @create 2024/1/18/018 13:51
 * @Description :
 */
@Slf4j
@Service("confoundJobService")
public class ConfoundJobService {

    @Resource
    private PlayMapper playInfoMapper;

    @Resource
    private PlayMessagePushService playMessagePushService;

    @Resource
    private PlayMessageConfoundMapper playMessageConfoundMapper;

    @Resource
    private PlayMessageConfoundLogService playMessageConfoundLogService;

    @Resource
    private RedisLock redisLock;

    /**
     * 混淆任务重试JOB
     */
    public void retryingConfusion() {
        String lockKey = PlayConstants.serviceName + ":retryingConfusion";
        boolean lock = redisLock.tryLock(lockKey, 90, TimeUnit.SECONDS);
        if (!lock) {
            log.info("retryingConfusion lock");
            return;
        }
        log.info("retryingConfusion start {}", LocalDateTime.now());
        playMessageConfoundLogService.retryingConfusion(lockKey);
    }

    /**
     * 更新剧本的混淆状态
     */
    public void refreshPlayConfusionState() {
        String lockKey = PlayConstants.serviceName + ":refreshPlayConfusionState";
        boolean lock = redisLock.tryLock(lockKey, 180, TimeUnit.SECONDS);
        if (!lock) {
            log.info("refreshPlayConfusionState lock");
            return;
        }
        List<PlayConfusionStateVO> list = playInfoMapper.selectConfusionStateStatistics();
        log.info("refreshPlayConfusionState start {}", list.size());
        try {
            if (CollectionUtils.isEmpty(list)) {
                return;
            }
            for (PlayConfusionStateVO vo : list) {
                // 剧本标记失败
                if (vo.getFailCount() > 0) {
                    Play playInfo = playInfoMapper.selectById(vo.getPlayId());
                    if (playInfo == null) {
                        continue;
                    }
                    playInfo.setState(3);//标记剧本暂停
                    playInfo.setConfoundState(2);
                    playInfo.setFailReason("剧本混淆失败");
                    playInfoMapper.updateById(playInfo);
                    continue;
                }

                // 总条数 和成功条数 一致 则混淆完成
                if (!vo.getTotal().equals(vo.getSuccessCount())) {
                    continue;
                }
                Play playInfo = playInfoMapper.selectById(vo.getPlayId());
                if (playInfo == null) {
                    continue;
                }
                playInfo.setConfoundState(1);
                playInfoMapper.updateById(playInfo);
                // 剧本混淆完成 去创建t_play_message_push_detail 的混淆数据
                AsyncTask.execute(() -> {
                    try {
                        playMessagePushService.createPushDetail(playInfo.getId());
                    } catch (Exception e) {
                        log.info("refreshPlayConfusionState createPushDetail error", e);
                    }
                });
            }
        } catch (Exception e) {
            log.info("refreshPlayConfusionState error", e);
        } finally {
            redisLock.unlock(lockKey);
        }
    }

    /**
     * 更新剧本消息混淆状态
     */
    public void refreshPlayMessageConfusionState() {
        String lockKey = PlayConstants.serviceName + ":refreshPlayMessageConfusionState";
        boolean lock = redisLock.tryLock(lockKey, 180, TimeUnit.SECONDS);
        if (!lock) {
            log.info("refreshPlayMessageConfusionState lock");
            return;
        }
        List<PlayMessageConfusionStateVO> list = playMessageConfoundMapper.selectConfusionStateStatistics();
        log.info("refreshPlayMessageConfusionState start {}", list.size());
        try {
            if (CollectionUtils.isEmpty(list)) {
                return;
            }
            Date date = DateUtil.offsetMinute(new Date(), -10); //10分钟前
            for (PlayMessageConfusionStateVO vo : list) {
                PlayMessageConfound confound = playMessageConfoundMapper.selectById(vo.getConfoundId());
                if (confound == null) {
                    continue;
                }
                // 总条数 和成功条数 一致 则混淆完成
                if (vo.getTotal() == vo.getSuccessCount()) {
                    confound.setState(1);
                    playMessageConfoundMapper.updateById(confound);
                    continue;
                }
                // 超过5分钟 自动失败
                if (date.after(confound.getCreateTime())) {
                    confound.setState(2);
                    playMessageConfoundMapper.updateById(confound);
                }
            }
        } catch (Exception e) {
            log.info("refreshPlayMessageConfusionState error", e);
        } finally {
            redisLock.unlock(lockKey);
        }
    }

}
