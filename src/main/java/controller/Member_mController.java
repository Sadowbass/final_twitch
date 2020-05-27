package controller;

import java.util.List;
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
import login.Member_mPhoto;
import login.Member_mPhotoUpload;





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
@RequestMapping(value="/member_m/email.lm", method = {RequestMethod.POST}, produces="application/text;charset=utf-8")
public ModelAndView sendEmailAction (HttpServletRequest req, HttpServletResponse resp) throws Exception{System.out.println("23414");
	
	ModelAndView mv = new ModelAndView();
	
	String mem_email = req.getParameter("mem_email");
	System.out.println(mem_email);
	
	String msg = dao.email(mem_email);
	
	
	mv.addObject("msg", msg);
	mv.setViewName("result");
	return mv;
}



@RequestMapping(value="/login.lm", method= {RequestMethod.POST}, produces="application/text;charset=utf-8")

public ModelAndView login(HttpServletRequest req) { 
	
	ModelAndView mv = new ModelAndView();
	String msg = "";
	MemberVo_m vo = new MemberVo_m();
	MemberVo_m vo2 = null;
	String mem_Id = req.getParameter("logidm");
	String mem_pwd = req.getParameter("logpwdm");
	vo.setMem_Id(mem_Id);
	vo.setMem_pwd(mem_pwd);


	vo2 = dao.login(vo);
	if( vo2 != null ) {
		HttpSession session = req.getSession();
		session.setAttribute("session_id", mem_Id);
		msg="로그인 성공";
	}else {
		msg = "아이디나 비밀번호를 다시 확인 해주세요. ";
	}
	mv.addObject("vo", vo2);
	mv.addObject("msg", msg);
	mv.setViewName("top");

	return mv;
}	

@RequestMapping(value="/logout.lm", method= {RequestMethod.POST},produces="application/text;charset=utf-8")

public ModelAndView logout(HttpServletRequest req) {
	ModelAndView mv = new ModelAndView();
	String msg ="로그아웃되었습니다.";

	
	HttpSession session = req.getSession();
	//session.removeAttribute("session_id");
	session.invalidate();
	mv.addObject("msg", msg);
	mv.setViewName("top");
	return mv;
}	

@RequestMapping(value="/profilem.lm", method = {RequestMethod.POST}, produces="application/text;charset=utf-8")
public ModelAndView profilem (HttpServletRequest req, HttpServletResponse resp){
	ModelAndView mv = new ModelAndView();
	String findStr = req.getParameter("idm");

	
	
	MemberVo_m vo = null;
	System.out.println("asdasd   "+findStr);
	
	 vo = dao.profilem(findStr);
	
	
	mv.addObject("vo", vo);
	mv.setViewName("/mypage/pages");
	return mv;
}
@RequestMapping(value="/updata.lm", method= {RequestMethod.POST})
public ModelAndView modifyR(HttpServletRequest req, HttpServletResponse resp) {
	ModelAndView mv = new ModelAndView();
	MemberVo_m vo = null;
	List<Member_mPhoto> attList = null;
	List<Member_mPhoto> delList = null;

	
	Member_mPhotoUpload fu = new Member_mPhotoUpload(req, resp);
	fu.uploading();
	
	vo = (MemberVo_m)req.getAttribute("vo");
	attList = (List<Member_mPhoto>)req.getAttribute("attList");
	delList = (List<Member_mPhoto>)req.getAttribute("delList");
	
	String msg = dao.modify(vo, attList, delList);
	
	mv.addObject("msg", msg);
	mv.addObject("p", req.getAttribute("p"));
	mv.setViewName("result");
	return mv;
}

}
