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

import bean.Whisper;

@Controller
public class Controller_uk {
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

}
