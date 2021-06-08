package com.stdiet.custom.server;

import com.alibaba.fastjson.JSONObject;
import com.stdiet.common.core.domain.model.LoginUser;
import com.stdiet.common.utils.spring.SpringUtils;
import com.stdiet.custom.domain.SysServicesTopic;
import com.stdiet.custom.service.ISysServicesTopicService;
import com.stdiet.custom.utils.WsUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArraySet;

@ServerEndpoint(value = "/ws")
@Component
@Slf4j
public class WebSocketServer {
    // concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
    private static CopyOnWriteArraySet<WebSocketServer> webSocketSet = new CopyOnWriteArraySet<WebSocketServer>();

    //private static ConcurrentHashMap<String,WebSocketServer> websocketList = new ConcurrentHashMap<>();
    // 与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;
    // 接收sidw
    private String sid = "";

    public static CopyOnWriteArraySet<WebSocketServer> getWebSocketSet() {
        return webSocketSet;
    }

    /**
     * 群发自定义消息
     */
    public static void sendInfo(String message, String sid) throws IOException {
        log.info("推送消息到窗口" + sid + "，推送内容:" + message + "目标:" + webSocketSet.size());
        for (WebSocketServer item : webSocketSet) {
            try {
                // 这里可以设定只推送给这个sid的，为null则全部推送
                if (sid == null) {
                    item.sendMessage(message);
                } else if (item.sid.equals(sid)) {
                    item.sendMessage(message);
                }
            } catch (IOException e) {
                // 清理断开的连接
                webSocketSet.remove(item);
                continue;
            }
        }
    }

    // * 连接建立成功调用的方法*
    @OnOpen
    public void onOpen(Session session) {
        this.session = session;
        this.sid = String.valueOf(getUserId(session));

        webSocketSet.add(this); // 加入set中

        try {
            JSONObject object = new JSONObject();
            object.put("type", WsUtils.WS_TYPE_SYSTEM_MESSAGE);
            object.put("msg", "连接成功");
            sendMessage(object.toJSONString());
        } catch (IOException e) {
            log.error("websocket IO异常");
        }
    }

    @OnClose
    public void onClose() {
        webSocketSet.remove(this); // 从set中删除
        log.info("有一连接关闭！");
    }


    /**
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {
        log.error("发生错误");
        error.printStackTrace();
    }

    /**
     * 实现服务器主动推送
     */
    public void sendMessage(String message) throws IOException {
        log.info("服务器消息推送：" + message);
        this.session.getBasicRemote().sendText(message);
    }

    public Long getUserId(Session session) {
        try {
            return ((LoginUser) ((UsernamePasswordAuthenticationToken) session.getUserPrincipal()).getPrincipal()).getUser().getUserId();
        } catch (Exception e) {
            return 0L;
        }
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        log.info("收到来自窗口" + sid + "的信息:" + message);
        try {
            String sid = String.valueOf(getUserId(session));
            if (sid.equals("0")) {
                return;
            }
            JSONObject resultObj = new JSONObject();
            if (message.equals(WsUtils.WS_GET_UNREAD_COUNT)) {
                SysServicesTopic topic = new SysServicesTopic();
                topic.setUid(sid);
                List<SysServicesTopic> statusList = new ArrayList<>();
                statusList.add(topic);
                ISysServicesTopicService servicesTopicService = SpringUtils.getBean(ISysServicesTopicService.class);
                List<SysServicesTopic> result = servicesTopicService.selectUnreadTopicCount(statusList);

                JSONObject dataObj = new JSONObject();
                dataObj.put("count", result.get(0).getCount());

                resultObj.put("type", WsUtils.WS_TYPE_MESSAGE_COUNT);
                resultObj.put("msg", "未读消息数");
                resultObj.put("data", dataObj);

            } else if (message.equals(WsUtils.WS_PING)) {

            }
            WebSocketServer.sendInfo(resultObj.toJSONString(), sid);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}