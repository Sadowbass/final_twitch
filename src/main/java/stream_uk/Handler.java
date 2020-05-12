package stream_uk;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class Handler extends TextWebSocketHandler{

	private Map<String,WebSocketSession> sessions=new HashMap<String, WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("session:::"+session);
		System.out.println("세션아이디["+session.getId()+"] 입장.");
		sessions.put(session.getId(), session);
		session.sendMessage(new TextMessage(session.getId()+"님 입장하였습니다."));
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session.getId()+"이 메세지전송."+message.getPayload());

		System.out.println(session.getAttributes());

		Iterator<String> sessionIds=sessions.keySet().iterator();

		String sessionId="";

		while(sessionIds.hasNext()){
			sessionId=sessionIds.next();
			sessions.get(sessionId).sendMessage(new TextMessage(session.getId()+": "+message.getPayload()));
		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("close"+session);
		System.out.println("close"+status);
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println("error"+session);
		System.out.println("error"+exception);
	}

}
