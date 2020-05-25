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

import bean.Cht;
import bean.UserList;

public class Handler extends TextWebSocketHandler {
    /*
     * 스트리머=>mid
     * 입장한 사람(채팅 보냄)=>oid
     * 채팅 내용=>txt
     */
    Map<WebSocketSession, String> everybody = new HashMap<WebSocketSession, String>(); /*모든 유저 <session,mid>*/
    Map<String, Object[]> users = new HashMap<String, Object[]>(); /*로그인한 유저 목록 <oid,[mid,session]>*/
    Map<String, Integer> accumulate = new HashMap<String, Integer>(); /*누적 시창저 숫자*/
    Gson gson = new Gson();
    Cht cht = new Cht();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        List<String> usersList = new ArrayList<String>(); /*스트리머가 같은 새로 들어온 유저에게 보낼 기존 유저목록*/
        Map<String, Object> usersListToNewUsers = new HashMap<String, Object>(); /*{usesrs : 유저목록} 새로운 유저에게 보낼맵 */
        Map<String, Object> addAndAccToEverybody = new HashMap<String, Object>(); /*{addUser : oid}, {accUser : accumulate.get(mid)} 모든 유저에게 보낼 새로 들어온 유저 아이디 &누적 시청자수 담은 맵*/
        int totalUserCnt = 0; /*스트리머가 같은 새로 들어온 유저에게 보낼 모든 시청자 수*/

        String mid = session.getUri().toString().substring(session.getUri().toString().lastIndexOf("?") + 1); /*스트리머*/
        String oid = "손님" + (session.getId()).substring(0, 5);
        //String oid=(String)session.getAttributes().get("session_id"); /*로그인 기능 작동하면 위에꺼 지우고 이거(로그인한 유저) 넣어야함*/


        /*새로 들어온 유저에게 mid가 같은 모든 시청자 수 보내줌 (totalUserCnt)*/
        Iterator<WebSocketSession> totalUserCntsSet = everybody.keySet().iterator();
        while (totalUserCntsSet.hasNext()) {
            WebSocketSession totalSession = totalUserCntsSet.next();
            if (everybody.get(totalSession).equals(mid)) {
                totalUserCnt++;
            }
        }


        everybody.put(session, mid); /*모든 세션 추가*/

        /*누적 시청자 숫자*/
        if (accumulate.get(mid) == null) {
            accumulate.put(mid, 1);
        } else {
            accumulate.put(mid, accumulate.get(mid) + 1);
        }
        addAndAccToEverybody.put("accUser", accumulate.get(mid)); /*맵에 누적 시창저 담음*/

        /*로그인한 유저 맵에 들어갈 배열*/
        Object[] body = new Object[2];
        body[0] = mid;
        body[1] = session;

//		/*새로 들어온 유저에게 mid가 같은 모든 시청자 수 보내줌 (totalUserCnt)*/
//		Iterator<WebSocketSession> totalUserCntsSet=everybody.keySet().iterator();
//		while(totalUserCntsSet.hasNext()) {
//			WebSocketSession totalSession= totalUserCntsSet.next();
//			if(everybody.get(totalSession).equals(mid)) {
//				totalUserCnt++;
//			}
//		}

        /*새로 들어온 유저에게 mid가 같은 사람 users목록 보내줌 (출력해야할 로그인유저 리스트)*/
        Iterator<String> usersIterator = users.keySet().iterator();
        while (usersIterator.hasNext()) {
            String user = usersIterator.next();
            if (users.get(user)[0].equals(mid)) {
                usersList.add(user);
            }
        }

        /*로그인 한 유저면*/
        if (oid != null) {
            users.put(oid, body); /*유저 목록에 로그인한 유저 추가*/

            addAndAccToEverybody.put("addUser", oid); /*스트리머가 같은 모든 유저에게 보낼 새로 들어온 유저 아이디 추가*/
            addAndAccToEverybody.put("addTotalSession", 1); /*스트리머가 같은 모든 유저에게 보낼 새로 들어온 유저 아이디 추가*/

            /*userList에 저장*/
            UkDao dao = new UkDao();
        }

        /*스트리머가 같은 모든 유저들에게 새로 들어온 유저 아이디 보내줌*/
        String jsonAddAndAccToEverybody = gson.toJson(addAndAccToEverybody);
        Iterator<WebSocketSession> sessionIterator = everybody.keySet().iterator();
        while (sessionIterator.hasNext()) {
            WebSocketSession target = sessionIterator.next();
            if (everybody.get(target).equals(mid)) { /*스트리머가 같은지 확인*/
                target.sendMessage(new TextMessage(jsonAddAndAccToEverybody));
            }
        }
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

        Map<String, String> txtToEverybody = new HashMap<String, String>(); /*{cht_oid, oid}, {cht_txt, message.getPayload()}스트리머가 같은 모두에게 보낼 보낸사람과 텍스트*/

        String mid = session.getUri().toString().substring(session.getUri().toString().lastIndexOf("?") + 1); /*스트리머*/
        String oid = ("손님" + (session.getId()).substring(0, 5));
        //String oid=(String)session.getAttributes().get("session_id"); /*로그인 기능 작동하면 위에꺼 지우고 이거(로그인한 유저) 넣어야함*/

        /*보낸사람과 텍스트를 map구조에 담음*/
        txtToEverybody.put("cht_oid", oid);
        txtToEverybody.put("cht_txt", message.getPayload());
        String JsonTxtToEverybody = gson.toJson(txtToEverybody);

        /*스트리머, 보낸이, 채팅 내용 디비에 저장*/
        cht.setCht_mid(mid);
        cht.setCht_oid(oid);
        cht.setCht_txt(message.getPayload());
        UkDao dao = new UkDao();
        dao.chatting(cht);

        /*스트리머가 같은 모든사람에게 보낸사람과 텍스트를 담은 map을 보냄*/
        Iterator<WebSocketSession> sessionIterator = everybody.keySet().iterator();
        while (sessionIterator.hasNext()) {
            WebSocketSession target = sessionIterator.next();
            if (everybody.get(target).equals(mid)) { /*스트리머가 같은지 확인*/
                target.sendMessage(new TextMessage(JsonTxtToEverybody));
            }
        }

    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        Map<String, Object> delUserToEverybody = new HashMap<String, Object>(); /*{delUser : oid} 모든 유저에게 보낼 나가서 삭제할 유저 아이디*/

        String mid = session.getUri().toString().substring(session.getUri().toString().lastIndexOf("?") + 1);
        String oid = "손님" + (session.getId()).substring(0, 5);
        //String oid=(String)session.getAttributes().get("session_id"); /*로그인 기능 작동하면 위에꺼 지우고 이거(로그인한 유저) 넣어야함*/

        everybody.remove(session); /*모든 세션에서 나간 세션 삭제*/

        /*로그인 한 유저면*/
        if (oid != null) {
            users.remove(oid); /*로그인한 유저 삭제*/
            delUserToEverybody.put("delUser", oid); /*스트리머가 같은 모두에게 보낼 삭제할 유저 아이디 추가*/

            /*나간 로그인한 유저 디비 status=0로 수정*/

            /*스트리머가 같은 모두에게 나간 유저 전송*/
            String jsonDelUserToEverybody = gson.toJson(delUserToEverybody);
            Iterator<WebSocketSession> sessionIterator = everybody.keySet().iterator();
            while (sessionIterator.hasNext()) {
                WebSocketSession target = sessionIterator.next();
                if (everybody.get(target).equals(mid)) { /*스트리머가 같은지 확인*/
                    target.sendMessage(new TextMessage(jsonDelUserToEverybody));
                }
            }
        }

    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        System.out.println("error_session!!!! " + session);
        System.out.println("error_exception!!!!!: " + exception);
    }

}
