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

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import bean.Cht;
import bean.UserList;

public class Handler extends TextWebSocketHandler{
	/*
	 * 스트리머=>mid
	 * 입장한 사람(채팅 보냄)=>oid
	 * 채팅 내용=>txt
	 */
	Map<WebSocketSession, String> everybody=new HashMap<WebSocketSession, String>(); /*모든 유저 <session,mid>*/
	Map<String, Object[]> users=new HashMap<String, Object[]>(); /*로그인한 유저 목록 <oid,[mid,session]>*/
	Map<String, Integer> accumulate=new HashMap<String, Integer>(); /*누적 시창저 숫자*/
	Gson gson=new Gson();
	UserList userList=new UserList();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String mid=session.getUri().toString().substring(session.getUri().toString().lastIndexOf("?")+1);

		/*누적 시청자 숫자*/

		if(accumulate.get(mid)==null) {
			accumulate.put(mid, 1);
		}else {
			accumulate.put(mid, accumulate.get(mid)+1);
		}

		everybody.put(session, mid); /*모든 세션 추가*/

		Object[] body=new Object[2];
		body[0]=mid;
		body[1]=session;


		String oid="손님"+(session.getId()).substring(0, 5);
		//String oid=(String)session.getAttributes().get("session_id"); /*로그인한 유저*/

		/*새로 들어온 유저에게 mid가 같은 사람 목록 보내줌 (출력해야할 로그인유저 리스트)*/
		List<String> usersList=new ArrayList<String>();
		Iterator<String> usersIterator=users.keySet().iterator();
		while(usersIterator.hasNext()) {
			String user=usersIterator.next();
			if(users.get(user)[0].equals(mid)) {
				usersList.add(user);
			}
		}
		Map<String, Object> usersAndAcc=new HashMap<String, Object>(); /*유저목록 & 누적유저수*/
		usersAndAcc.put("users",usersList);
		String jsonUsersAndAcc=gson.toJson(usersAndAcc);
		session.sendMessage(new TextMessage(jsonUsersAndAcc)); /*새로 들어온 사람에게 유저목록 & 누적유저수 보냄*/

		JsonObject addAndAcc=null;
		if(oid!=null) {
			users.put(oid, body); /*유저 목록에 로그인한 유저 추가*/

			addAndAcc=new JsonObject(); /*모든 유저에게 보낼 새로 들어온 유저 아이디 담을 제이슨 객체*/
			addAndAcc.addProperty("addUser", oid); /*모든 유저에게 보낼 새로 들어온 유저 아이디 추가*/
			addAndAcc.addProperty("accUser", accumulate.get(mid));

			/*userList에 저장*/
			userList.setMid(mid);
			userList.setOid(oid);
			userList.setStatus(1);
			UkDao dao=new UkDao();
			dao.enter(userList);
		}

		/*모든 유저들에게 새로 들어온 유저 아이디 보내줌*/
		String jsonAddUser=gson.toJson(addAndAcc);
		Iterator<WebSocketSession> sessionIterator=everybody.keySet().iterator();
		while(sessionIterator.hasNext()) {
			WebSocketSession target=sessionIterator.next();
			if(everybody.get(target).equals(mid)) {
				target.sendMessage(new TextMessage(jsonAddUser));

			}
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {


		String mid=session.getUri().toString().substring(session.getUri().toString().lastIndexOf("?")+1);

		Cht cht=gson.fromJson(message.getPayload(), Cht.class);
		cht.setCht_oid("손님"+(session.getId()).substring(0, 5)); /*로그인 기능 작동하면 여기 지워야함*/
		UkDao dao=new UkDao();
		dao.chatting(cht);

		Iterator<WebSocketSession> sessionIterator=everybody.keySet().iterator();
		while(sessionIterator.hasNext()) {
			WebSocketSession target=sessionIterator.next();
			if(everybody.get(target).equals(mid)) {
				target.sendMessage(new TextMessage(message.getPayload()));

			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String mid=session.getUri().toString().substring(session.getUri().toString().lastIndexOf("?")+1);

		everybody.remove(session);

		String oid="손님"+(session.getId()).substring(0, 5);
		//String oid=(String)session.getAttributes().get("session_id"); /*위에꺼 지우고 이거 넣어야함(유저삭제부분)*/

		JsonObject delUser=new JsonObject(); /*모든 유저에게 보낼 사제할 유저 아이디 담을 제이슨 객체*/

		if(oid!=null) {
			users.remove(oid); /*로그인한 유저 삭제*/
			delUser.addProperty("delUser", oid); /*모든 유저에게 보낼 삭제할 유저 아이디 추가*/


			userList.setMid(mid);
			userList.setOid(oid);
			userList.setStatus(0);
			UkDao dao=new UkDao(); /*유저 디비에 0으로 변경*/
			dao.exit(userList);
		}


		String jsonDelUser=gson.toJson(delUser);
		Iterator<WebSocketSession> sessionIterator=everybody.keySet().iterator();
		while(sessionIterator.hasNext()) {
			WebSocketSession target=sessionIterator.next();
			if(everybody.get(target).equals(mid)) {
				target.sendMessage(new TextMessage(jsonDelUser));
			}
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println("error_session!!!! "+session);
		System.out.println("error_exception!!!!!: "+exception);
	}

}
