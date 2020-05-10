package stream_uk;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WsHandler extends TextWebSocketHandler {

	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("세션아이디["+session.getId()+"] 입장.");
	}

	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		System.out.println(session.getId()+"이 메세지전송."+message.getPayload());
	}

	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("세션아이디["+session.getId()+"] 퇴장.");
	}

}
