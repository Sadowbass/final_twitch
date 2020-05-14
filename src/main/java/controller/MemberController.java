package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import login.MemberDao_m;
import login.MemberVo_m;



@Controller
public class MemberController {

	MemberDao_m dao;
	
	public MemberController(MemberDao_m dao) {
		this.dao = dao;
	}
//회원가입
@RequestMapping(value="/insert.lm", method= {RequestMethod.POST})
	public ModelAndView insert(HttpServletRequest req, HttpServletResponse resp ) {
	ModelAndView mv = new ModelAndView();
	String msg = null;
	MemberVo_m vo = new MemberVo_m();
	
	
	vo.setMem_Id((String)req.getParameter("suidm"));
	vo.setMem_pwd((String)req.getParameter("supwdm"));
	vo.setMem_birth((String)req.getParameter("subirthm"));
	vo.setMem_email((String)req.getParameter("suemailm"));
	vo.setMem_profile((String)req.getParameter("suprofilem"));
	
	vo.getMem_Id();
	vo.getMem_email();
	vo.getMem_birth();
	vo.getMem_pwd();
	vo.getMem_profile();
	
	msg = dao.insert(vo);
	mv.addObject("msg", msg);
	mv.setViewName("login");
	return mv;
}
@RequestMapping(value="/login.lm", method= {RequestMethod.POST}, produces="application/text;charset=utf-8")
@ResponseBody
public String login(HttpServletRequest req) {
	
	String msg = "환영~~";
	MemberVo_m vo = new MemberVo_m();
	String mem_Id = req.getParameter("mId");
	String mem_pwd = req.getParameter("pwd");
	
	vo.setMem_Id(mem_Id);
	vo.setMem_pwd(mem_pwd);
	boolean loginResult = dao.login(vo);
	if( loginResult ) {
		HttpSession session = req.getSession();
		session.setAttribute("session_id", mem_Id);
	}else {
		msg = "아이디나 암호 다시 확인 !!! ";
	}

	return msg;
}	
}
