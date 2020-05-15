package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.HEDao;
import bean.MemberVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class HEController {
	HEDao dao;
	public HEController(HEDao dao){
		this.dao = dao;
	}
	@RequestMapping(value="*/member_select.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView selectM(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		List<MemberVo> list;
		list = dao.member_select();
		for(int i=0;i <list.size();i++) {
			if(list.get(i).getMem_admin()!=null && list.get(i).getMem_status()!=null) {
				
				if(list.get(i).getMem_admin().equals("0")) {
					list.get(i).setMem_admin("일반회원");
				}else {
					list.get(i).setMem_admin("관리자");
				}
				
				if(list.get(i).getMem_status().equals("0")) {
					list.get(i).setMem_status("오프라인");
				}else if(list.get(i).getMem_status().equals("1")) {
					list.get(i).setMem_status("온라인");
				}else {
					list.get(i).setMem_status("방송중");
				}
			}
		}
		
		mv.addObject("list", list);
		mv.setViewName("member/member_select"); //select라는 페이지에 넘기겠다  ->resolver가 받음-> index.jsp?inc=./board/select.jsp가 로딩됨
		return mv;
	}
	
	@RequestMapping(value="*/member_insert.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView insertM(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/member_insert"); 
		return mv;
	}
	
	@RequestMapping(value="*/member_view.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView viewM(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String mid =(String)req.getParameter("he_serial");
		MemberVo vo=dao.member_view(mid);
		System.out.println(vo.getMem_name());
		mv.addObject("vo", vo);
		mv.setViewName("member/member_view"); 
		return mv;
	}
	
	@RequestMapping(value="*/live_broadcast.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView LiveBroadcast(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
	
		mv.setViewName("twitch_main/live_broadcast"); 
		return mv;
	}
	
	@RequestMapping(value="*/streamer.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView Streamer(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
	
		
		mv.setViewName("twitch_main/streamer"); 
		return mv;
	}
	
	@RequestMapping(value="*/category_select.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView selectC(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("twitch_main/category_select"); 
		return mv;
	}
	
	@RequestMapping(value="*/category_insert.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView insertC(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
	
		mv.setViewName("twitch_main/category_insert"); 
		return mv;
	}
	
	@RequestMapping(value="*/tag_management.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView tag(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("twitch_main/tag_management"); 
		return mv;
	}
	

	@RequestMapping(value="*/profit.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView profit(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
	
		mv.setViewName("twitch_main/profit_management"); 
		return mv;
	}
	
	@RequestMapping(value="*/help.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView help(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
	
		mv.setViewName("twitch_main/help"); 
		return mv;
	}
	
	

}
