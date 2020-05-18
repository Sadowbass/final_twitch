package stream_uk;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import bean.UserList;

@Controller
public class Controller_uk {

	@ResponseBody
	@RequestMapping(value = "/enter.uk", method = { RequestMethod.GET }, produces = "application/text; charset=utf8")
	public String enter(UserList userList) {
		System.out.println("enter:::" + userList.getStreamer());
		System.out.println("enter:::" + userList.getMid());
		System.out.println("enter:::" + userList.getStatus());
		UkDao dao = new UkDao();
		dao.enter(userList);
		return "enter";
	}

	@ResponseBody
	@RequestMapping(value = "/exit.uk", method = { RequestMethod.GET }, produces = "application/text; charset=utf8")
	public String exit(UserList userList) {
		System.out.println("exit:::" + userList.getStreamer());
		System.out.println("exit:::" + userList.getMid());
		System.out.println("exit:::" + userList.getStatus());
		UkDao dao = new UkDao();
		dao.exit(userList);
		return "exit";
	}

	@ResponseBody
	@RequestMapping(value = "/users.uk", method = { RequestMethod.GET }, produces = "application/text; charset=utf8")
	public String users(HttpServletRequest req) {
		String streamer=req.getParameter("streamer");
		System.out.println("streamer::::"+streamer);
		UkDao dao = new UkDao();
		List<String> list=dao.users(streamer);
		Gson gson=new Gson();
		System.out.println("json::::"+gson.toJson(list));
		return gson.toJson(list);
	}
}
