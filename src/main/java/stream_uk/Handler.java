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

		if((String)session.getAttributes().get("mid")==null) {
			System.out.println("seesion.id:::::"+session.getId()+"님(이) 입장하였습니다.");
		}else {
			System.out.println("mid:::::"+session.getAttributes().get("mid")+"님(이) 입장하였습니다.");
		}

		Iterator<String> oid=users.keySet().iterator();
		while(oid.hasNext()) {
			String userId=oid.next();
			String Messenger=((String)session.getAttributes().get("mid")!=null)? (String)session.getAttributes().get("mid") : session.getId();
			users.get(userId).sendMessage(new TextMessage(Messenger+"님(이) 입장하였습니다."));
		}
		if((String)session.getAttributes().get("mid")==null) {
			users.put(session.getId(), session);
		}else {
			users.put((String)session.getAttributes().get("mid"), session);
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		if((String)session.getAttributes().get("mid")==null) {
			System.out.println(session.getId()+"::: "+message.getPayload());
		}else {
			System.out.println(session.getAttributes().get("mid")+"::: "+message.getPayload());
		}

		Iterator<String> oid=users.keySet().iterator();
		while(oid.hasNext()) {
			String userId=oid.next();
			String Messenger=((String)session.getAttributes().get("mid")!=null)? (String)session.getAttributes().get("mid") : session.getId();
			users.get(userId).sendMessage(new TextMessage(Messenger+": "+message.getPayload()));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		if((String)session.getAttributes().get("mid")==null) {
			System.out.println("seesion.id:::::"+session.getId()+"님(이) 퇴장하였습니다.");
		}else {
			System.out.println("mid:::::"+session.getAttributes().get("mid")+"님(이) 퇴장하였습니다.");
		}


		if((String)session.getAttributes().get("mid")==null) {
			users.remove(session.getId(), session);
		}else {
			users.remove((String)session.getAttributes().get("mid"), session);
		}

		Iterator<String> oid=users.keySet().iterator();
		while(oid.hasNext()) {
			String userId=oid.next();
			String Messenger=((String)session.getAttributes().get("mid")!=null)? (String)session.getAttributes().get("mid") : session.getId();
			users.get(userId).sendMessage(new TextMessage(Messenger+"님(이) 퇴장하였습니다."));
		}


	}


	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println("error_session: "+session);
		System.out.println("error_exception!!: "+exception);
	}

}
