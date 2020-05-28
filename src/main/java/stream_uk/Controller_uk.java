package stream_uk;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class Controller_uk {

/*	@ResponseBody
	@RequestMapping(value = "/enter.uk", method = { RequestMethod.GET }, produces = "application/text; charset=utf8")
	public String enter(UserList userList) {
		UkDao dao = new UkDao();
		dao.enter(userList);
		return "enter";
	}

	@ResponseBody
	@RequestMapping(value = "/exit.uk", method = { RequestMethod.GET }, produces = "application/text; charset=utf8")
	public String exit(UserList userList) {
		UkDao dao = new UkDao();
		dao.exit(userList);
		return "exit";
	}*/

	@ResponseBody
	@RequestMapping(value = "/users.uk", method = { RequestMethod.GET }, produces = "application/text; charset=utf8")
	public String users(HttpServletRequest req) {
		String streamer=req.getParameter("streamer");
		UkDao dao = new UkDao();
		List<String> list=dao.users(streamer);
		Gson gson=new Gson();
		return gson.toJson(list);
	}
}
