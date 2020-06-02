package stream_uk;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Controller_uk {
	@ResponseBody
	@RequestMapping(value = "*/reSocket.uk", method = RequestMethod.GET)
	public String reSocket(HttpServletRequest req) {
		String str=null;
		String mid=req.getParameter("mid");
		System.out.println("reSocket! mid:::"+mid);

		UkDao dao=new UkDao();
		String result=dao.reSocket(mid);
		System.out.println("result::::"+result);
		if(result!=null) {
			str="reS";
		}

		return str;
	}
}
