/*package stream_uk;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/cht")
public class WebSocketUk {
	@OnOpen
	public void handleOpen(Session session){
		System.out.println("opne-session::"+session.getId());
		System.out.println("opne-config::"+config);
	}

	@OnMessage
	public String handleMessage(String message, Session session) {
		System.out.println("message : " + message);
		System.out.println("message-session::"+session);
		System.out.println("message-config::"+config);
		return message;
	}

	@OnClose
	public void handleClose(Session session) {
		System.out.println("close-session::"+session);
		System.out.println("close-config::"+config);
	}

	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
}
*/


/*package stream_uk;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/cht")
public class WebSocketUk {
	@OnOpen
	public void open(Session session) {
		System.out.println(session);
	}
	@OnClose
	public void close(Session session) {
		System.out.println(session);
	}
	@OnError
	public void error(Throwable t) {
		t.printStackTrace();
	}
	@OnMessage
	public void message(Session session, String message) {
		System.out.println(session);
		System.out.println(message);
	}
}*/
/*@ServerEndpoint(value="/ws", configurator=HttpSessionConfigurator.class)
public class WebSocketUk {
	@OnOpen
	public void open(Session session, EndpointConfig config) {
		System.out.println(session);
		System.out.println(config);
	}
	@OnClose
	public void close(Session session, EndpointConfig config) {
		System.out.println(session);
		System.out.println(config);
	}
	@OnError
	public void error(Throwable t) {
		t.printStackTrace();
	}
	@OnMessage
	public void message(Session session, String message) {
		System.out.println(session);
		System.out.println(message);
	}
}*/