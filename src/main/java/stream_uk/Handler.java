package stream_uk;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import bean.ViewerCnt;

public class Handler extends TextWebSocketHandler {

	Map<String, WebSocketSession> logins = new HashMap<String, WebSocketSession>(); /* id, session */
	Map<String, List<WebSocketSession>> chatRoom = new HashMap<String, List<WebSocketSession>>(); /* 스트리머, session List */
	Map<String, Set<String>> accumulate=new HashMap<String, Set<String>>();/*스트리머, 누적 시청자*/

	Gson gson = new Gson(); /*지슨*/
	JsonParser parser=new JsonParser(); /*파서*/

	Cht cht = new Cht(); /* cht vo 디비에 저장할거임 */
	UserList userList = new UserList(); /* userList Vo 디비에 저장할거임 */
	ViewerCnt viewerCnt=new ViewerCnt(); /*하은 부탁*/

	String[] midTxt=new String[2]; /*메세지 전송할때 mid, txt 담는 배열*/

	/*스트리머 방송중이면 true 아니면 false*/
	public String onOrOff(String streamer) {
		UkDao onAirDao=new UkDao();
		String onAirStreamer=onAirDao.onAir(streamer);
		System.out.println("onAirStreamer::"+onAirStreamer);
		return onAirStreamer;
	}


	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String mid = (String)session.getAttributes().get("session_id");/* 로그인 아이디 */
		String httpSession=(String)session.getAttributes().get("HTTP.SESSION.ID");
		String streamer = session.getUri().toString().substring(session.getUri().toString().lastIndexOf("?") + 1); /* 스트리머 */
		boolean reduplication=false; /*true면 입장, false면 입장거부(중복)*/

//		/*2.2.1 중복 입장 확인*/
//		List<WebSocketSession> reduplicationList=chatRoom.get(streamer);
//		String compare="";
//		boolean twice=false;
//		for(WebSocketSession s:reduplicationList) {
//			if(mid!=null) {
//				compare=(String)s.getAttributes().get("session_id");
//				if(mid.equals(compare))twice=true; /*true중복입장*/
//			}else if(httpSession!=null){
//				compare=(String)s.getAttributes().get("HTTP.SESSION.ID");
//				if(httpSession.equals(compare))twice=true; /*true중복입장*/
//			}
//
//			if(twice) {/*중복 입장임*/
//				JsonObject jsonObject = new JsonObject();
//				jsonObject.addProperty("reduplication", "이미 채팅방에 접속해 있습니다.");
//				String jsonTxt = gson.toJson(jsonObject);
//				session.sendMessage(new TextMessage(jsonTxt)); /* 중복 입장 알림 메세지 전송 */
//				reduplication=false; /*입장 거부*/
//				break;
//			}
//		}

//		if(reduplication) { /*중복 아니면*/

		if (streamer.equals("justLogin")) {/* 1. 단순 로그인 */
			if(mid != null) {logins.put(mid, session);}
		}else if(streamer.equals("air")) {/* 2. 방송 onAir */
			System.out.println("onOrOff 호출 1번");
			if(onOrOff(mid)!=null) {

				System.out.println("1111111111111");
				if(chatRoom.get(mid)==null) {/*2.1.1 스트리머 첫 입장*/
					JsonObject jsonObject2 = new JsonObject();/* 온에어 스트리머 json으로 변환 */
					jsonObject2.addProperty("onAir", mid);
					String jsonTxt2 = gson.toJson(jsonObject2);
					UkDao dao2 = new UkDao(); /* 팔로우 하는사람들에게 알람 보냄 */
					List<String> followers = dao2.followList(mid); /* 나를 팔로우 하는 사람들 */
					for (String follower : followers) {/*스트리머 팔로우한 사람들에게 알림 전송*/
						if (logins.get(follower) != null) { /* 나를 팔로우 하는 사람이 (채팅방 아님)로그인해 있으면 */
							logins.get(follower).sendMessage(new TextMessage(jsonTxt2));/* 단순 로그인만 한 유저에게 보냄 */
						}
					}
					List<WebSocketSession> list=new ArrayList<WebSocketSession>(); /*채팅방 세션 리스트*/
					chatRoom.put(mid, list); /*채팅방 시작*/
					Set<String> accUser=new HashSet<String>(); /*누적 시청자수셋*/
					accUser.add(mid); /*누적 시청자에 스트리머 더하기*/
					accumulate.put(mid, accUser);/*누적 시청자수 카운트 시작*/

					userList.setMid(mid);
					userList.setOid(mid);
					userList.setStatus(1);
					UkDao dao = new UkDao();
					dao.enter(userList); /* 방송 시작한 스트리머 디비에 저장 */
				}
				/*2.1.2  스트리머 chatRoom에 추가*/
				chatRoom.get(mid).add(session);

				/*2.1.3 스트리머에게 유저목록, 누적 시청자, 총 시청자 송출*/
				List<WebSocketSession>list=chatRoom.get(mid);/* 스트리머에게 보낼 로그인한 유저 목록 */
				List<String> nameList=new ArrayList<String>();
				for(WebSocketSession s:list) {
					if(s.getAttributes().get("session_id")!=null) {nameList.add((String)s.getAttributes().get("session_id"));}
				}
				JsonObject jsonObject = new JsonObject();
				String jsonLIst = gson.toJson(nameList);
				jsonObject.addProperty("userLIst", jsonLIst);
				String jsonTxt = gson.toJson(jsonObject); /* 채팅방 유저 목록 json으로 변환해서 */
				session.sendMessage(new TextMessage(jsonTxt));/*스트리머에게  보냄 */

				JsonObject jsonObject4 = new JsonObject();/*누적 및 총 시청자수 담을 json*/
				jsonObject4.addProperty("accUser", accumulate.get(mid).size()); /* 누적 시청자 카운트 json에 담음*/
				jsonObject4.addProperty("totalUsers", chatRoom.get(mid).size()); /*총시청자수 카운트 json에 담음*/
				String jsonTxt4 = gson.toJson(jsonObject4); /*누적 및 총 시청자수 카운트 josn으로 변환*/
				session.sendMessage(new TextMessage(jsonTxt4)); /* 재접속 스트리머에게 전*/
			}

		}else {/*3. 시청자 입장 */

			if(onOrOff(streamer)!=null) {/*방송중이면*/
				System.out.println("시청자 입장");

				/*3.1 입장한 시청자에게 유저 목록 전송*/
				List<WebSocketSession>list=chatRoom.get(streamer);/* 입장한 유저에게 보낼 로그인한 유저 목록 */
				List<String> nameList=new ArrayList<String>();
				for(WebSocketSession s:list) nameList.add((String)s.getAttributes().get("session_id"));
				JsonObject jsonObject = new JsonObject();
				String jsonLIst = gson.toJson(nameList);
				jsonObject.addProperty("userLIst", jsonLIst);
				String jsonTxt = gson.toJson(jsonObject); /* 유저 목록 json으로 변환해서 */
				session.sendMessage(new TextMessage(jsonTxt)); /* 입장한 유저에게 보냄 */
				list.add(session); /*입장한 유저 채팅방 유저목록에 등록*/

				/*3.2 로그인 유저*/
				if(mid!=null) { /*로그인 유저*/
					userList.setMid(mid);
					userList.setOid(streamer);
					userList.setStatus(1);
					UkDao dao = new UkDao();
					dao.enter(userList); /* 채팅방에 입장한 유저 채팅방 유저리스트 디비에 저장 */

					JsonObject jsonObject2 = new JsonObject();
					jsonObject2.addProperty("addUser", mid);
					String jsonTxt2 = gson.toJson(jsonObject2);/* 채팅방 입장한 유저 아이디 json으로 변환 */

					List<WebSocketSession>list2=chatRoom.get(streamer);
					for (WebSocketSession s2 : list2) s2.sendMessage(new TextMessage(jsonTxt2));/*채팅방 사람들에게 로그인 아이디 뿌려줌*/
				}

				/*3.3 누적 및 총 시청자 전송*/
				if(mid!=null) {/*로그인 시청자면 누적 카운트에 아이디 저장*/
					accumulate.get(streamer).add(mid);
				}else { /*비로그인 시청자면 누적 카운트에 httpSession저장*/
					accumulate.get(streamer).add(httpSession);
				}

				JsonObject jsonObject4 = new JsonObject(); /*누적 및 총 시청자수 담을 json*/
				jsonObject4.addProperty("accUser", accumulate.get(streamer).size());  /* 누적 시청자 카운트 json에 담음*/

				jsonObject4.addProperty("totalUsers", chatRoom.get(streamer).size());/*총시청자수 카운트 json에 담음*/
				String jsonTxt4 = gson.toJson(jsonObject4);/*누적 및 총 시청자수 카운트 josn으로 변환*/

				List<WebSocketSession>list4=chatRoom.get(streamer);
				for (WebSocketSession s : list4) { s.sendMessage(new TextMessage(jsonTxt4)); }/*채팅방 사람들에게 뿌려줌*/

			}
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session+"::"+message.getPayload());

		String mid = (String) session.getAttributes().get("session_id"); /* 로그인 아이디 */
		String streamer = session.getUri().toString().substring(session.getUri().toString().lastIndexOf("?") + 1); /* 스트리머 */

		JsonElement ele=parser.parse(message.getPayload());/*json형태 메세지 parse*/

		/*(1) 채팅 -> txt면*/
		if(ele.getAsJsonObject().get("txt")!=null) {
			String txt="";
			String target=""; /*스트리머*/

			if(streamer.equals("air")) {
				target=mid; /*스트리머가 전송*/
			}else {
				target=streamer; /*시청자가 전송*/
			}

			if(onOrOff(target)!=null) {
				txt=ele.getAsJsonObject().get("txt").getAsString();
				JsonObject jsonObject = new JsonObject();
				midTxt[0]= mid;
				midTxt[1]= txt;
				System.out.println(mid+":::"+txt);
				String json=gson.toJson(midTxt);
				jsonObject.addProperty("txt",json);
				String jsonTxt = gson.toJson(jsonObject);/* json으로 변환 */

				List<WebSocketSession>list=chatRoom.get(target);
				for (WebSocketSession s : list) {s.sendMessage(new TextMessage(jsonTxt));} /*채팅방 모든사람에게 전송*/

				cht.setCht_mid(mid); cht.setCht_oid(target); cht.setCht_txt(txt);
				UkDao dao = new UkDao(); dao.chatting(cht);/* 보낸이, 스트리머, 채팅 내용 디비에 저장 */
			}
		}

		/*(2)친구 추가 -> plus*/
		if(ele.getAsJsonObject().get("plus")!=null) {

			String plus=ele.getAsJsonObject().get("plus").getAsString();/*메세지로부터 친구추가 타겟 얻음*/

			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("plus", mid);
			String jsonTxt = gson.toJson(jsonObject);	/* json으로 변환 */

			if(logins.get(plus)!=null) {logins.get(plus).sendMessage(new TextMessage(jsonTxt));}/*친구추가 상대에게 전송*/
		}

		/*(3)귓속말  -> whisper*/
		if(ele.getAsJsonObject().get("whisper")!=null) {
			JsonArray jsonArray=ele.getAsJsonObject().get("whisper").getAsJsonArray();/*메세지로부터 타겟과 내용 얻음*/
			String whisperTarget=jsonArray.get(0).getAsString();
			String whisperTxt=jsonArray.get(1).getAsString();

			JsonObject jsonObject = new JsonObject();
			midTxt[0]= mid;
			midTxt[1]= whisperTxt;
			String json=gson.toJson(midTxt);
			jsonObject.addProperty("whisper", json);
			String jsonTxt = gson.toJson(jsonObject);	/* json으로 변환 */
			if(logins.get(whisperTarget)!=null) {logins.get(whisperTarget).sendMessage(new TextMessage(jsonTxt));}/*로그인중인 사람들에게 전송*/
		}
		/*(4) 하은 부탁*/
		if(ele.getAsJsonObject().get("heCntRun")!=null) {
			viewerCnt.setMid(mid);
			if(chatRoom.get(mid)!=null) {
				viewerCnt.setViewer(chatRoom.get(mid).size());
				UkDao heDao=new UkDao();
				heDao.viewerCnt(viewerCnt);
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {


		String mid = (String) session.getAttributes().get("session_id"); /* 로그인 아이디 */
		String streamer = session.getUri().toString().substring(session.getUri().toString().lastIndexOf("?") + 1); /* 스트리머 */



		if (streamer.equals("justLogin")) { /* 1.단순 로그아웃 */
			if(mid != null) {logins.remove(mid);}
		}else if(streamer.equals("air")) { /* 2.스트리머 로그아웃 */
			if(onOrOff(mid)!=null) {/*onAir*/
				System.out.println("가짜방종 ");
				List<WebSocketSession>list=chatRoom.get(mid);
				for(WebSocketSession sss:list) {
					System.out.println("11@@"+sss.getAttributes().get("session_id"));
				}
				list.remove(session);
				for(WebSocketSession sss:list) {
					System.out.println("22@@"+sss.getAttributes().get("session_id"));
				}
				System.out.println("제거완료");
			}else { /*찐종료*/
				JsonObject jsonObject = new JsonObject();
				jsonObject.addProperty("offAir", mid);
				String jsonTxt = gson.toJson(jsonObject); /*방종 메세지*/

				List<WebSocketSession> list=chatRoom.get(mid);
				for(WebSocketSession s:list) {
					if(s.getAttributes().get("session_id")!=null) { /*로그인 유저만*/
						String del_id=(String)s.getAttributes().get("session_id");
						userList.setMid(del_id);
						userList.setOid(mid);
						userList.setStatus(0);
						UkDao dao = new UkDao();
						dao.exit(userList); /*방종한 스트리머 satus 0으로*/
					}
					if(!mid.equals(s.getAttributes().get("session_id")) && s!=session) {
						s.sendMessage(new TextMessage(jsonTxt));/*스트리머를 제외한 모든 시청자에게 방송 종료 알림*/
					}
				}
				accumulate.remove(mid);/*누적 시청자수 카운터에서 제거*/
				chatRoom.remove(mid); /*채팅방 폭파*/
				System.out.println("33@@"+chatRoom.get(mid));
				System.out.println("스티리머가 방종 찐찐찐 방종");
			}
		}else { /*3.시청자 로그아웃*/
			if(onOrOff(streamer)!=null && chatRoom.get(streamer)!=null) { /*스트리머가 방송중이면*/

				/* 3.1 채팅방에 있던 유저가 나감*/
				List<WebSocketSession>list=chatRoom.get(streamer);
				list.remove(session); /*나간사람 채팅방에서 제거*/

				/* 3.1.1 로그인한 유저가 채팅방에서 퇴장*/
				if (mid != null) {

					userList.setMid(mid);
					userList.setOid(streamer);
					userList.setStatus(0);
					UkDao dao = new UkDao();
					dao.exit(userList); /* 채팅방에서 나간 유저 디비 status=0로 수정 */

					JsonObject jsonObject = new JsonObject();
					jsonObject.addProperty("delUser", mid);
					String jsonTxt = gson.toJson(jsonObject); /* 채팅방에서 퇴장한 유저 아이디 json으로 변환 */

					List<WebSocketSession> list1=chatRoom.get(streamer);
					for (WebSocketSession s : list1) { s.sendMessage(new TextMessage(jsonTxt)); } /*채팅방 모든 사람에게 전송*/
				}
				/*3.1.2 총시청자수 전송*/
				JsonObject jsonObject2 = new JsonObject();/*총 시청자수 담을 josn*/
				jsonObject2.addProperty("totalUsers", chatRoom.get(streamer).size()); /* 총 시청자수 카운트  json에 담음*/
				String jsonTxt2 = gson.toJson(jsonObject2); /*총 시청자수 json으로 변환*/

				List<WebSocketSession> list2=chatRoom.get(streamer);
				for (WebSocketSession s2 : list2) { s2.sendMessage(new TextMessage(jsonTxt2)); }/*채팅방 모든 사람에게 전송*/
			}
		}
	}
}
