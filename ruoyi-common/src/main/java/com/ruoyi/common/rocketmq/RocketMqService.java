package com.ruoyi.common.rocketmq;

import com.alibaba.fastjson.JSON;
import com.ruoyi.common.enums.MqDelayLevelEnums;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.client.producer.SendStatus;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Component;

/**
 * @author LAM
 * @date 2023/10/5 20:24
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class RocketMqService {

    private final RocketMQTemplate rocketMQTemplate;

    /**
     * 发送异步消息
     *
     * @param topic  消息Topic
     * @param params 泛型
     */
    public <T> Boolean asyncSend(String topic, T params) {
        log.info("发送异步消息：开始，参数：topic：{}， params：{}", topic, params);
        SendResult sendResult = rocketMQTemplate.syncSend(topic, MessageBuilder.withPayload(params).build());
        if (SendStatus.SEND_OK.equals(sendResult.getSendStatus())){
            log.info("发送异步消息：成功");
            return Boolean.TRUE;
        }
        log.warn("发送异步消息：失败，失败数据：{}", JSON.toJSONString(sendResult));
        return Boolean.FALSE;
    }

    /**
     * 延时发送信息
     *
     * @param topic      topic
     * @param params     发送参数
     * @param timeout    毫秒-发送超时
     * @param delayLevel 延时发送等级 {@link com.ruoyi.common.enums.MqDelayLevelEnums}
     * @return SendResult 返回结果 {@link SendResult}
     */
    public <T> SendResult delayedSend(String topic, T params, Long timeout, MqDelayLevelEnums delayLevel) {
        log.info("发送延时信息：开始，参数：topic：{}， params：{}， timeout：{}， delayLevel：{}", topic, params, timeout, delayLevel);
        return rocketMQTemplate.syncSend(topic, MessageBuilder.withPayload(params).build(), timeout, delayLevel.getDelayLevel());
    }
}
