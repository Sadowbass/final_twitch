package stream_uk;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import bean.Ignore;
import bean.Whisper;

@Controller
public class Controller_uk {
	/*스트리머 페이지 방송중이면 소켓 재접속*/
	@ResponseBody
	@RequestMapping(value = "*/reSocket.uk", method = RequestMethod.GET)
	public String reSocket(HttpServletRequest req) {
		String str=null;
		String mid=req.getParameter("mid");

		UkDao dao=new UkDao();
		String result=dao.onAir(mid);
		if(result!=null) {
			str="reS";
		}

		return str;
	}

	/*귓속말 조회*/
	@ResponseBody
	@RequestMapping(value = "/whisperSel.uk", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String whisperSel(Whisper whisper) {

		UkDao dao=new UkDao();
		Gson gson=new Gson();
		List<Map<String, String>> list=new ArrayList<Map<String,String>>();
		List<Whisper> result=dao.whisperSel(whisper);
		for(Whisper w:result) {
			Map<String, String> map=new HashMap<String, String>();
			map.put(w.getWriter(), w.getTxt());
			list.add(map);
		}
		String jsonStr=gson.toJson(list);
		return jsonStr;
	}

	/*시청자가 채팅금지 저장*/
	@ResponseBody
	@RequestMapping(value = "/ignoreIn.uk", method = RequestMethod.GET)
	public void ignoreInUser(Ignore ignore) {
		UkDao dao=new UkDao();
		dao.ignoreIn(ignore);
	}

	/*스트리머가 채팅금지 저장*/
	@ResponseBody
	@RequestMapping(value = "*/ignoreIn.uk", method = RequestMethod.GET)
	public void ignoreInStreamer(Ignore ignore) {
		UkDao dao=new UkDao();
		dao.ignoreIn(ignore);
	}

	/*시청자가 채팅금지 조회*/
	@ResponseBody
	@RequestMapping(value = "/ignoreSel.uk", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String ignoreSelUser(HttpServletRequest req) {
		String mid=req.getParameter("mid");
		UkDao dao=new UkDao();
		List<Ignore> list=dao.ignoreSel(mid);
		Gson gson=new Gson();
		String josnStr=gson.toJson(list);
		return josnStr;
	}

	/*스트리머가 채팅금지 조회*/
	@ResponseBody
	@RequestMapping(value = "*/ignoreSel.uk", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String ignoreSelStreamer(HttpServletRequest req) {
		String mid=req.getParameter("mid");
		UkDao dao=new UkDao();
		List<Ignore> list=dao.ignoreSel(mid);
		Gson gson=new Gson();
		String josnStr=gson.toJson(list);
		return josnStr;
	}


}
