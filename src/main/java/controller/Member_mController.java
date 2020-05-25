package controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import login.MemberDao_m;
import login.MemberVo_m;




@Controller
public class Member_mController {

	MemberDao_m dao;
	
	public Member_mController(MemberDao_m dao) {
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
	mv.setViewName("result");
	return mv;
}


//아이디 비밀번호 찾기 이메일 보내기
@RequestMapping(value="/member/email.lm", method = {RequestMethod.POST}, produces="application/text;charset=utf-8")
public ModelAndView sendEmailAction (HttpServletRequest req, HttpServletResponse resp) throws Exception{
	
	ModelAndView mv = new ModelAndView();
	
	String mem_email = req.getParameter("mem_email");
	
	String msg = dao.email(mem_email);
	
	
	mv.addObject("msg", msg);
	mv.setViewName("result");
	return mv;
}



@RequestMapping(value="/login.lm", method= {RequestMethod.POST}, produces="application/text;charset=utf-8")
@ResponseBody
public String login(HttpServletRequest req) {
	String msg = "";
	MemberVo_m vo = new MemberVo_m();
	String mem_Id = req.getParameter("logidm");
	String mem_pwd = req.getParameter("logpwdm");
	
	vo.setMem_Id(mem_Id);
	vo.setMem_pwd(mem_pwd);


	boolean loginResult = dao.login(vo);
	if( loginResult ) {
		HttpSession session = req.getSession();
		session.setAttribute("session_id", mem_Id);
	}else {
		msg = "아이디나 비밀번호를 다시 확인 해주세요. ";
	}

	return msg;
}	

@RequestMapping(value="/logout.lm", method= {RequestMethod.POST},produces="application/text;charset=utf-8")
@ResponseBody
public String logout(HttpServletRequest req) {
	
	String msg ="로그아웃되었습니다.";

	HttpSession session = req.getSession();
	session.removeAttribute("session_id");
	return msg;
}	

@RequestMapping(value="/mypage/pwdm.lm", method = {RequestMethod.POST}, produces="application/text;charset=utf-8")
public ModelAndView pwdm (HttpServletRequest req, HttpServletResponse resp){
	MemberVo_m vo = null;
	ModelAndView mv = new ModelAndView();
	String mem_Id = req.getParameter("mem_Id");
	 vo = dao.pwdm(mem_Id);
	
	
	mv.addObject("vo", vo);
	mv.setViewName("profile");
	return mv;
}


	

}
