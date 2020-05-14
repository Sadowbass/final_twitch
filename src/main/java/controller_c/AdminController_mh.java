package controller_c;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController_mh {
	
	public AdminController_mh() {
		System.out.println("★★★★AdminController_mh 들어옴★★★★★★★");
	}
	
	@RequestMapping(value="*/productInsert.mh", method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public int productInsert(HttpServletRequest req, HttpServletResponse resp) {
		int result=0;
		System.out.println("★★★★productInsert 메소드 들어옴★★★★★★★");
		
		
		return result;
	}
	
}
