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
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import bean.Cht;
import bean.UserList;

public class NewHandler extends TextWebSocketHandler {

	Map<String, WebSocketSession> logins = new HashMap<String, WebSocketSession>(); /* id, session */
	Map<String, List<WebSocketSession>> chatRoom = new HashMap<String, List<WebSocketSession>>(); /*스트리머, session List */
	Map<String, Integer> totalUsers = new HashMap<String, Integer>(); /* 스트리머, 총 시청자수 */
	Map<String, Integer> accumulate = new HashMap<String, Integer>(); /* 스트리머, 누적 시청자수 */
	Gson gson = new Gson(); /*지슨*/
	JsonParser parser=new JsonParser(); /*파서*/
	UserList userList = new UserList(); /* userList Vo 디비에 저장할거임 */

	Cht cht = new Cht(); /* cht vo 디비에 저장할거임 */
	String[] midTxt=new String[2]; /*메세지 전송할때 mid, txt 담는 배열*/

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		boolean flag=false;

		/* 로그인 아이디 */
		String mid = (String) session.getAttributes().get("session_id");
		/* 단순 로그인인지 방송 입장인지 검열 */
		String censorship = session.getUri().toString().substring(session.getUri().toString().lastIndexOf("?") + 1); /* 스트리머 */

		/* 단순 로그인 */
		if (mid != null && censorship.equals("justLogin")) {logins.put(mid, session);}

		/* 채팅방 입장 */
		if (!censorship.equals("justLogin")) {

			/* 스트리머가 방송 시작 */
			if (mid!=null && mid.equals(censorship)) {
				/* 온에어 스트리머 json으로 변환 */
				JsonObject jsonObject2 = new JsonObject();
				jsonObject2.addProperty("onAir", mid);
				String jsonTxt2 = gson.toJson(jsonObject2);
				/* 팔로우 하는사람들에게 알람 보냄 */
				UkDao dao2 = new UkDao();
				List<String> followers = dao2.followList(mid); /* 나를 팔로우 하는 사람들 */
				/*스트리머 팔로우한 사람들에게 알림 전송*/
				for (String follower : followers) {
					if (logins.get(follower) != null) { /* 나를 팔로우 하는 사람이 (채팅방 아님)로그인해 있으면 */
						logins.get(follower).sendMessage(new TextMessage(jsonTxt2));/* 단순 로그인만 한 유저에게 보냄 */
					}
				}
				List<WebSocketSession> list=new ArrayList<WebSocketSession>(); /*채팅방 세션 리스트*/
				chatRoom.put(censorship, list); /*채팅방 시작*/
				totalUsers.put(censorship, 0); /* 총 시청자수 카운트 시작 */
				accumulate.put(censorship, 0); /* 누적 시청자수 카운트 시작 */
			}

			Iterator<String> iter=chatRoom.keySet().iterator();

			while(iter.hasNext()){
				if(censorship.equals(iter.next())){flag=true;}
			}

			/*스티리머가 방송을 시작해서 채팅방이 존재한다면*/
			if(flag) {

				/* 입장한 유저에게 보낼 로그인한 유저 목록 */
				List<WebSocketSession>list1=chatRoom.get(censorship);
				/* 채팅방 입장한 유저에게 채팅방 유저 목록 json으로 변환해서 */
				List<String> nameList=new ArrayList<String>();
				for(WebSocketSession s:list1) {
					nameList.add((String)s.getAttributes().get("session_id"));
				}
				JsonObject jsonObject = new JsonObject();
				String jsonLIst = gson.toJson(nameList);
				jsonObject.addProperty("userLIst", jsonLIst);
				String jsonTxt = gson.toJson(jsonObject);
				/* 입장한 유저에게 보냄 */
				session.sendMessage(new TextMessage(jsonTxt));
				/*입장한 유저 채팅방 유저목록에 등록*/
				list1.add(session);
				chatRoom.put(censorship, list1);


				/* 로그인한 유저가 채팅방 입장 */
				if (mid != null) {
					/* 채팅방에 입장한 유저 채팅방 유저리스트 디비에 저장 */
					userList.setMid(mid);
					userList.setOid(censorship);
					userList.setStatus(1);
					UkDao dao = new UkDao();
					dao.enter(userList);
					/* 채팅방 입장한 유저 아이디 json으로 변환 */
					JsonObject jsonObject3 = new JsonObject();
					jsonObject3.addProperty("addUser", mid);
					String jsonTxt3 = gson.toJson(jsonObject3);
					/*채팅방 사람들에게 새로 입장한 유저 아이디 뿌려줌*/
					List<WebSocketSession>list3=chatRoom.get(censorship);
					for (WebSocketSession s : list3) {
						s.sendMessage(new TextMessage(jsonTxt3)); /*채팅방에 입장한 유저 아이디 보냄*/
					}
				}

				/*누적시창자수 총 시청자수 담을 json*/
				JsonObject jsonObject4 = new JsonObject();
				/* 누적 시청자수 카운트 josn에 담음*/
				if (accumulate.get(censorship) != null) {
					accumulate.put(censorship, accumulate.get(censorship) + 1);
					jsonObject4.addProperty("accUser", accumulate.get(censorship));
				}
				/* 총 시청자수 카운트 json에 담음*/
				if (totalUsers.get(censorship) != null) {
					totalUsers.put(censorship, totalUsers.get(censorship) + 1);
					jsonObject4.addProperty("totalUsers", totalUsers.get(censorship));
				}
				/*누적, 총 시청자수 카운트 josn으로 변환*/
				String jsonTxt4 = gson.toJson(jsonObject4);
				/*채팅방 사람들에게 뿌려줌*/
				List<WebSocketSession>list4=chatRoom.get(censorship);
				for (WebSocketSession s : list4) {
					s.sendMessage(new TextMessage(jsonTxt4));
				}
			}
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		boolean flag=false;
		/* 로그인 아이디 */
		String mid = (String) session.getAttributes().get("session_id");
		/* 스트리머 */
		String censorship = session.getUri().toString().substring(session.getUri().toString().lastIndexOf("?") + 1);

		/*json형태 메세지 parse*/
		JsonElement ele=parser.parse(message.getPayload());

		/*스트리머가 방송 중이면*/
		Iterator<String> iter=chatRoom.keySet().iterator();
		while(iter.hasNext()){
			if(censorship.equals(iter.next())){flag=true;}
		}

		/*(1)단순 채팅 -> tx면*/
		if(ele.getAsJsonObject().get("txt")!=null && flag) {
			String txt=ele.getAsJsonObject().get("txt").getAsString();
			/* json으로 변환 */
			JsonObject jsonObject = new JsonObject();
			midTxt[0]= mid;
			midTxt[1]= txt;
			String json=gson.toJson(midTxt);
			jsonObject.addProperty("txt",json);
			String jsonTxt = gson.toJson(jsonObject);
			/*채팅방 모든사람에게 전송*/
			List<WebSocketSession>list1=chatRoom.get(censorship);
			for (WebSocketSession s : list1) {
				s.sendMessage(new TextMessage(jsonTxt));
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
			/*메세지로부터 타겟 얻음*/
			String plus=ele.getAsJsonObject().get("plus").getAsString();
			/* json으로 변환 */
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("plus", mid);
			String jsonTxt = gson.toJson(jsonObject);
			/*로그인중인 사람들에게 전송*/
			if(logins.get(plus)!=null)
			logins.get(plus).sendMessage(new TextMessage(jsonTxt));
		}

		/*(3)귓속말  -> whisper*/
		if(ele.getAsJsonObject().get("whisper")!=null) {
			/*메세지로부터 타겟과 내용 얻음*/
			JsonArray jsonArray=ele.getAsJsonObject().get("whisper").getAsJsonArray();
			String whisperTarget=jsonArray.get(0).getAsString();
			String whisperTxt=jsonArray.get(1).getAsString();
			/* json으로 변환 */
			JsonObject jsonObject = new JsonObject();
			midTxt[0]= mid;
			midTxt[1]= whisperTxt;
			String json=gson.toJson(midTxt);
			jsonObject.addProperty("whisper", json);
			String jsonTxt = gson.toJson(jsonObject);
			/*로그인중인 사람들에게 전송*/
			if(logins.get(whisperTarget)!=null)
			logins.get(whisperTarget).sendMessage(new TextMessage(jsonTxt));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		boolean flag=false;
		/* 로그인 아이디 */
		String mid = (String) session.getAttributes().get("session_id");
		/* 단순 로그인인지 방송 입장인지 검열 */
		String censorship = session.getUri().toString().substring(session.getUri().toString().lastIndexOf("?") + 1); /* 스트리머 */

		/* 단순 로그아웃 */
		if (mid != null && censorship.equals("justLogin")) {logins.remove(mid);}

		/* 채팅방 퇴장 */
		if (!censorship.equals("justLogin")) {
			/* 스트리머가 방송 종료 채팅방에 있던 모든사람 강제 퇴장*/
			if (mid.equals(censorship)) {
				/*스트리머 채팅방에서 제거*/
				List<WebSocketSession>list1=chatRoom.get(censorship);
				list1.remove(session);
				chatRoom.put(censorship, list1);
				/*채팅방에 있던 모든 사람에게 방종 메세지*/
				JsonObject jsonObject = new JsonObject();
				jsonObject.addProperty("offAir", censorship);
				String jsonTxt = gson.toJson(jsonObject);
				/*채팅방에 있던 모든 사람 status 0으로 바꿈*/
				List<WebSocketSession> list2=chatRoom.get(censorship);
				for(WebSocketSession s:list2) {
					String del_id=(String)s.getAttributes().get("session_id");
					userList.setMid(del_id);
					userList.setOid(censorship);
					userList.setStatus(0);
					UkDao dao = new UkDao();
					dao.exit(userList);

					s.sendMessage(new TextMessage(jsonTxt));
				}
				totalUsers.remove(censorship); /* 청시청자수 카운트에서 제거 */
				accumulate.remove(censorship); /* 누적 카운트에서 제거 */
				chatRoom.remove(censorship); /*채팅방 폭파*/
			}else {
				/*스트리머가 방송중이라 채팅방이 있으면*/
				Iterator<String> iter=chatRoom.keySet().iterator();
				while(iter.hasNext()){
					if(censorship.equals(iter.next())){flag=true;}
				}
				/*채팅방에 있던 유저가 나감*/
				if(flag) {
					/* 나간사람 채팅방에서 제거 */
					List<WebSocketSession>list=chatRoom.get(censorship);
					list.remove(session);
					chatRoom.put(censorship, list);
					/* 로그인한 유저가 채팅방에서 퇴장 */
					if (mid != null) {
						/* 채팅방에서 나간 로그인한 유저 디비 status=0로 수정 */
						userList.setMid(mid);
						userList.setOid(censorship);
						userList.setStatus(0);
						UkDao dao = new UkDao();
						dao.exit(userList);
						/* 채팅방에서 퇴장한 유저 아이디 json으로 변환 */
						JsonObject jsonObject = new JsonObject();
						jsonObject.addProperty("delUser", mid);
						String jsonTxt = gson.toJson(jsonObject);
						/*채팅방 모든 사람에게 전송*/
						List<WebSocketSession> list1=chatRoom.get(censorship);
						for (WebSocketSession s : list1) {
							s.sendMessage(new TextMessage(jsonTxt));
						}
					}
					/*총 시청자수 담을 josn*/
					JsonObject jsonObject4 = new JsonObject();
					/* 총 시청자수 카운트  json에 담음*/
					if (totalUsers.get(censorship) != null) {
						totalUsers.put(censorship, totalUsers.get(censorship) - 1);
						jsonObject4.addProperty("totalUsers", totalUsers.get(censorship));
					}
					/*총 시청자수 json으로 변환*/
					String jsonTxt4 = gson.toJson(jsonObject4);
					/*채팅방 모든 사람에게 전송*/
					List<WebSocketSession> list2=chatRoom.get(censorship);
					for (WebSocketSession s : list2) {
						s.sendMessage(new TextMessage(jsonTxt4));
					}
				}
			}
		}
	}
}
