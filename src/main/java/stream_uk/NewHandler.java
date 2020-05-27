package stream_uk;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import bean.Cht;
import bean.UserList;

public class NewHandler extends TextWebSocketHandler {

	Map<String, WebSocketSession> logins = new HashMap<String, WebSocketSession>(); /* id, session */
	List<WebSocketSession> chatRoom = new ArrayList<WebSocketSession>(); /* session, 스트리머 */
	Map<String, Integer> totalUsers = new HashMap<String, Integer>(); /* 스트리머, 총 시청자수 */
	Map<String, Integer> accumulate = new HashMap<String, Integer>(); /* 스트리머, 누적 시청자수 */
	Gson gson = new Gson();
	JsonParser parser=new JsonParser();
	UserList userList = new UserList(); /* userList Vo 디비에 저장할거임 */
	Cht cht = new Cht(); /* cht vo 디비에 저장할거임 */

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		/* 로그인 아이디 */
		String mid = (String) session.getAttributes().get("session_id");
		/* 단순 로그인인지 방송 입장인지 검열 */
		String censorship = session.getUri().toString().substring(session.getUri().toString().lastIndexOf("?") + 1); /* 스트리머 */

		/* 단순 로그인 */
		if (mid != null && censorship.equals("justLogin")) {
			logins.put(mid, session);
		}

		/* 채팅방 입장 */
		if (!censorship.equals("justLogin")) {

			/* 입장한 유저에게 보낼 로그인한 유저 목록 */
			List<String> inChatRoomList = new ArrayList<String>();
			for (WebSocketSession c : chatRoom) {
				if (c.getAttributes().get("session_id") != null) {
					inChatRoomList.add((String) c.getAttributes().get("session_id"));
				}
			}


			/* 채팅방 입장한 유저에게 채팅방 유저 목록 json으로 변환해서 */
			JsonObject jsonObject = new JsonObject();
			String jsonLIst = gson.toJson(inChatRoomList);
			jsonObject.addProperty("userLIst", jsonLIst);

			/* 입장한 유저에게 보냄 */
			String jsonTxt = gson.toJson(jsonObject);
			session.sendMessage(new TextMessage(jsonTxt));

			chatRoom.add(session); /* 세션에 저장 */

			/* 로그인한 유저가 채팅방 입장 */
			if (mid != null) {
				/* 채팅방에 입장한 유저 채팅방 유저리스트 디비에 저장 */
				userList.setMid(mid);
				userList.setOid(censorship);
				userList.setStatus(1);
				UkDao dao = new UkDao();
				dao.enter(userList);

				/* 스트리머가 방송 시작 */
				if (mid.equals(censorship)) {
					/* 온에어 스트리머 json으로 변환 */
					JsonObject jsonObject2 = new JsonObject();
					jsonObject2.addProperty("onAir", mid);
					String jsonTxt2 = gson.toJson(jsonObject2);

					/* 팔로우 하는사람들에게 알람 보냄 */
					UkDao dao2 = new UkDao();
					List<String> followers = dao2.followList(mid); /* 나를 팔로우 하는 사람들 */

					for (String follower : followers) {
						if (logins.get(follower) != null) { /* 나를 팔로우 하는 사람이 (채팅방 아님)로그인해 있으면 */
							/* 단순 로그인만 한 유저에게 보냄 */
							logins.get(follower).sendMessage(new TextMessage(jsonTxt2));
						}
					}
					totalUsers.put(censorship, 0); /* 총 시청자수 카운트 시작 */
					accumulate.put(censorship, 0); /* 누적 시청자수 카운트 시작 */
				}

				/* 채팅방 입장한 유저 아이디 json으로 변환 */
				JsonObject jsonObject3 = new JsonObject();
				jsonObject3.addProperty("addUser", mid);
				String jsonTxt3 = gson.toJson(jsonObject3);

				for (WebSocketSession s : chatRoom) {
					/* 스트리머가 같으면 */
					if (censorship.equals(s.getUri().toString().substring(s.getUri().toString().lastIndexOf("?") + 1))) {
						s.sendMessage(new TextMessage(jsonTxt3)); /*채팅방에 입장한 유저 아이디 보냄*/
					}
				}

			}



			JsonObject jsonObject4 = new JsonObject();
			/* 누적 시청자수 카운트 */
			if (accumulate.get(censorship) != null) {
				accumulate.put(censorship, accumulate.get(censorship) + 1);
				jsonObject4.addProperty("accUser", accumulate.get(censorship));
			}
			/* 총 시청자수 카운트 */
			if (totalUsers.get(censorship) != null) {
				totalUsers.put(censorship, totalUsers.get(censorship) + 1);
				jsonObject4.addProperty("totalUsers", totalUsers.get(censorship));
			}

			String jsonTxt4 = gson.toJson(jsonObject4);

			for (WebSocketSession s : chatRoom) {
				/* 스트리머가 같으면 보냄 */
				if (censorship.equals(s.getUri().toString().substring(s.getUri().toString().lastIndexOf("?") + 1))) {
					s.sendMessage(new TextMessage(jsonTxt4));
				}
			}
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		/* 로그인 아이디 */
		String mid = (String) session.getAttributes().get("session_id");
		/* 스트리머 */
		String censorship = session.getUri().toString().substring(session.getUri().toString().lastIndexOf("?") + 1);

		/*json형태 메세지 parse*/
		JsonElement ele=parser.parse(message.getPayload());

		/*(1)단순 채팅 -> txt*/
		if(ele.getAsJsonObject().get("txt")!=null) {
			String txt=ele.getAsJsonObject().get("txt").getAsString();

			/* json으로 변환 */
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("txt", mid+": "+txt);
			String jsonTxt = gson.toJson(jsonObject);

			/*전송*/
			for (WebSocketSession s : chatRoom) {
				/* 스트리머가 같으면 */
				if (censorship.equals(s.getUri().toString().substring(s.getUri().toString().lastIndexOf("?") + 1))) {
					s.sendMessage(new TextMessage(jsonTxt));
				}
			}

			/* 보낸이, 스트리머, 채팅 내용 디비에 저장 */
			cht.setCht_mid(mid);
			cht.setCht_oid(censorship);
			cht.setCht_txt(txt);
			UkDao dao = new UkDao();
			dao.chatting(cht);
		}

		/*(2)친구 추가 -> plus*/
		if(ele.getAsJsonObject().get("plus")!=null) {
			String plus=ele.getAsJsonObject().get("plus").getAsString();

			/* json으로 변환 */
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("plus", mid+"님이 친구신청을 하였습니다. ");
			String jsonTxt = gson.toJson(jsonObject);

			/*전송*/
			logins.get(plus).sendMessage(new TextMessage(jsonTxt));
		}

		/*(3)귓속말 -> whisper*/
		if(ele.getAsJsonObject().get("whisper")!=null) {
			JsonArray jsonArray=ele.getAsJsonObject().get("whisper").getAsJsonArray();
			String whisperTarget=jsonArray.get(0).getAsString();
			String whisperTxt=jsonArray.get(1).getAsString();

			/* json으로 변환 */
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("whisper", mid+": "+whisperTxt);
			String jsonTxt = gson.toJson(jsonObject);

			/*전송*/
			logins.get(whisperTarget).sendMessage(new TextMessage(jsonTxt));
		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		/* 로그인 아이디 */
		String mid = (String) session.getAttributes().get("session_id");
		/* 단순 로그인인지 방송 입장인지 검열 */
		String censorship = session.getUri().toString()
				.substring(session.getUri().toString().lastIndexOf("?") + 1); /* 스트리머 */

		/* 단순 로그아웃 */
		if (mid != null && censorship.equals("justLogin")) {
			logins.remove(mid);
		}

		/* 채팅방 퇴장 */
		if (!censorship.equals("justLogin")) {

			/* 나간사람 세션에서 제거 */
			chatRoom.remove(session);

			/* 로그인한 유저가 채팅방에서 퇴장 */
			if (mid != null) {
				/* 채팅방에서 나간 로그인한 유저 디비 status=0로 수정 */
				userList.setMid(mid);
				userList.setOid(censorship);
				userList.setStatus(0);
				UkDao dao = new UkDao();
				dao.exit(userList);

				/* 스트리머가 방송 종료 */
				if (mid == censorship) {
					totalUsers.remove(censorship); /* 청시청자수 카운트에서 제거 */
					accumulate.remove(censorship); /* 누적 카운트에서 제거 */
				}
				/* 채팅방에서 퇴장한 유저 아이디 json으로 변환 */
				JsonObject jsonObject = new JsonObject();
				jsonObject.addProperty("delUser", mid);
				String jsonTxt = gson.toJson(jsonObject);

				for (WebSocketSession s : chatRoom) {
					/* 스트리머가 같으면 */
					if (censorship.equals(s.getUri().toString().substring(s.getUri().toString().lastIndexOf("?") + 1))) {
						s.sendMessage(new TextMessage(jsonTxt));
					}
				}
			}
			JsonObject jsonObject4 = new JsonObject();
			/* 총 시청자수 카운트  */
			if (totalUsers.get(censorship) != null) {
				totalUsers.put(censorship, totalUsers.get(censorship) - 1);
				jsonObject4.addProperty("totalUsers", totalUsers.get(censorship));
			}
			String jsonTxt4 = gson.toJson(jsonObject4);
			for (WebSocketSession s : chatRoom) {
				/* 스트리머가 같으면 보냄 */
				if (censorship.equals(s.getUri().toString().substring(s.getUri().toString().lastIndexOf("?") + 1))) {
					s.sendMessage(new TextMessage(jsonTxt4));
				}
			}
		}
	}

}
