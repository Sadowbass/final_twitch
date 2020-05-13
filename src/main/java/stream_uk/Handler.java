package stream_uk;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class Handler extends TextWebSocketHandler{

		Map<String, WebSocketSession> users=new HashMap<String, WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		System.out.println(session.getAttributes().get("mid")+"님(이) 입장하였습니다.");

		Iterator<String> oid=users.keySet().iterator();
		while(oid.hasNext()) {
			String userId=oid.next();
			users.get(userId).sendMessage(new TextMessage(userId+"님(이) 입장하였습니다."));
		}

		users.put((String)session.getAttributes().get("mid"), session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		System.out.println(session.getAttributes().get("mid")+": "+message.getPayload());

		Iterator<String> oid=users.keySet().iterator();
		while(oid.hasNext()) {
			String userId=oid.next();
			users.get(userId).sendMessage(new TextMessage(userId+": "+message.getPayload()));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		System.out.println(session.getAttributes().get("mid")+"님(이) 퇴장하였습니다.");

		Iterator<String> oid=users.keySet().iterator();
		while(oid.hasNext()) {
			String userId=oid.next();
			users.get(userId).sendMessage(new TextMessage(userId+"님(이) 퇴장하였습니다."));
		}

		users.remove((String)session.getAttributes().get("mid"), session);
	}


	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println("error_session: "+session);
		System.out.println("error_exception!!: "+exception);
	}

}
