package stream_uk;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class Handler extends TextWebSocketHandler{

		Map<String, List<Object>> users=new HashMap<String, List<Object>>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String streamer=session.getUri().toString().substring(session.getUri().toString().lastIndexOf("?")+1);
		List<Object> list=new ArrayList<Object>();
		list.add(streamer);
		list.add(session);
		Iterator<String> oids=users.keySet().iterator();
		while(oids.hasNext()) {
			String oid=oids.next();
			String Messenger=((String)session.getAttributes().get("mid")!=null)? (String)session.getAttributes().get("mid") : session.getId();
			if(users.get(oid).get(0).equals(streamer)) {
				WebSocketSession um= (WebSocketSession) users.get(oid).get(1);
				um.sendMessage(new TextMessage(Messenger+"님(이) 입장하였습니다."));
			}
		}
		if((String)session.getAttributes().get("mid")==null) {
			users.put(session.getId(), list);
		}else {
			users.put((String)session.getAttributes().get("mid"), list);
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String streamer=session.getUri().toString().substring(session.getUri().toString().lastIndexOf("?")+1);
		List<Object> list=new ArrayList<Object>();
		list.add(streamer);
		list.add(session);
		Iterator<String> oids=users.keySet().iterator();
		while(oids.hasNext()) {
			String oid=oids.next();
			String Messenger=((String)session.getAttributes().get("mid")!=null)? (String)session.getAttributes().get("mid") : session.getId();
			if(users.get(oid).get(0).equals(streamer)) {
				WebSocketSession um= (WebSocketSession) users.get(oid).get(1);
				um.sendMessage(new TextMessage("<span class='sender'>"+Messenger+"</span>"+"<span class='messages'> : "+message.getPayload()+"</span>"));
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		if((String)session.getAttributes().get("mid")==null) {
			users.remove(session.getId());
		}else {
			users.remove((String)session.getAttributes().get("mid"));
		}
		String streamer=session.getUri().toString().substring(session.getUri().toString().lastIndexOf("?")+1);
		Iterator<String> oids=users.keySet().iterator();
		while(oids.hasNext()) {
			String oid=oids.next();
			String Messenger=((String)session.getAttributes().get("mid")!=null)? (String)session.getAttributes().get("mid") : session.getId();
			if(users.get(oid).get(0).equals(streamer)) {
				WebSocketSession um= (WebSocketSession) users.get(oid).get(1);
				um.sendMessage(new TextMessage(Messenger+"님(이) 퇴장하였습니다."));
			}
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println("error_session!!!! "+session);
		System.out.println("error_exception!!!!!: "+exception);
	}

}
