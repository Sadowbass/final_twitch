package controller;

import java.util.ArrayList;
import java.util.List;

import org.omg.CORBA.BAD_INV_ORDER;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.BroadCastingCateVo;
import bean.HEDao;
import bean.MemberVo;
import config.HE_FileUpload;

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
	
	@RequestMapping(value="*/member_result.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView insertResult(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		HE_FileUpload fu = new HE_FileUpload(req, resp);
		HttpServletRequest req2 = fu.boardUploading();
		
		MemberVo vo = (MemberVo)req2.getAttribute("vo");
		
		String msg = dao.member_insert(vo, req2);
		mv.addObject("msg", msg);
		mv.setViewName("member/result"); 
		return mv;
	}
	
	@RequestMapping(value="*/member_modify.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView modifyM(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		MemberVo vo =  null;
		String mid =(String)req.getParameter("member_id");
		vo=dao.member_view(mid);
		
		mv.addObject("vo", vo);
		mv.setViewName("member/member_modify"); 
		return mv;
	}
	
	@RequestMapping(value="*/member_view.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView viewM(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		MemberVo vo =  null;
		String mid =(String)req.getParameter("he_serial");
		vo=dao.member_view(mid);
		
		if(vo != null) {
			if(vo.getMem_admin()!=null && vo.getMem_status()!=null) {
				
				if(vo.getMem_admin().equals("0")) {
					vo.setMem_admin("일반회원");
				}else {
					vo.setMem_admin("관리자");
				}
				
				if(vo.getMem_status().equals("0")) {
					vo.setMem_status("오프라인");
				}else if(vo.getMem_status().equals("1")) {
					vo.setMem_status("온라인");
				}else {
					vo.setMem_status("방송중");
				}
			}
		}
		
		
		mv.addObject("vo", vo);
		mv.setViewName("member/member_view"); 
		return mv;
	}
	
	@RequestMapping(value="*/modify_result.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView modifyResult(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		HE_FileUpload fu = new HE_FileUpload(req, resp);
		HttpServletRequest req2 = fu.boardUploading();
		
		MemberVo vo = (MemberVo)req2.getAttribute("vo");
		
		String msg = dao.member_modify(vo, req2);
		mv.addObject("msg", msg);
		mv.setViewName("member/result"); 
		return mv;
	}
	
	@RequestMapping(value="*/delete_result.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView deleteResult(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		String mid = (String)req.getParameter("member_id");
		String msg = dao.member_delete(mid,req);
		mv.addObject("msg", msg);
		mv.setViewName("member/result"); 
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
		List<BroadCastingCateVo> list;
		list = dao.cate_select();

		mv.addObject("list", list);

		mv.setViewName("twitch_main/category_select"); 
		return mv;
	}
	
	@RequestMapping(value="*/category_view.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView viewC(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		BroadCastingCateVo vo;
		String serial = req.getParameter("he_serial");
		vo = dao.cate_view(serial);

		mv.addObject("cate", vo);
		System.out.println(vo.getCat_gname());
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
