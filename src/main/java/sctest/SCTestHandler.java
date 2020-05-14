package sctest;

import com.sun.org.slf4j.internal.Logger;
import com.sun.org.slf4j.internal.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.ArrayList;
import java.util.List;

public class SCTestHandler extends TextWebSocketHandler {

    List<WebSocketSession> connectedUsers;

    public SCTestHandler() {
        this.connectedUsers = new ArrayList<WebSocketSession>();
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println(session.getId() + "님 접속");
        System.out.println("연결 IP : " + session.getRemoteAddress().getHostName());
        connectedUsers.add(session);
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        System.out.println(session.getId() + "님이 메세지 전송" + message.getPayload());

        for(WebSocketSession webSocketSession : connectedUsers){
            if(!session.getId().equals(webSocketSession)){
                webSocketSession.sendMessage(new TextMessage(message.getPayload()));
            }
        }

    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        System.out.println(session.getId() + "님 접속 종료");
        connectedUsers.remove(session);
    }
}
