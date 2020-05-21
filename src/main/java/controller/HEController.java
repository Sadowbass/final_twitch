package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.omg.CORBA.BAD_INV_ORDER;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import bean.BroadCastingCateVo;
import bean.HEDao;
import bean.MemberVo;
import bean.TagVo;
import config.HE_FileUpload;
import config.HE_FileUpload2;

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
	
	@RequestMapping(value="*/category_view.he", method= {RequestMethod.GET,RequestMethod.POST},produces = "application/json; charset=utf8")
	public @ResponseBody String viewC(BroadCastingCateVo vo) throws Exception {

		Map<String, BroadCastingCateVo> map = new HashMap<String,BroadCastingCateVo>();
		String serial = vo.getCat_serial();
		vo = dao.cate_view(serial);
		map.put("cate", vo);
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(map);
		return json;
	}
	
	@RequestMapping(value="*/category_insert.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView insertC(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
	
		mv.setViewName("twitch_main/category_insert"); 
		return mv;
	}
	
	@RequestMapping(value="*/category_insertR.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView insertR(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		HE_FileUpload2 fu = new HE_FileUpload2(req, resp);
		BroadCastingCateVo vo = fu.boardUploading();
		String msg = dao.cate_insert(vo, req);
		mv.addObject("msg", msg);
		mv.setViewName("twitch_main/category_insert"); 
		return mv;
	}
	
	@RequestMapping(value="*/category_modifyR.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView modifyC(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		HE_FileUpload2 fu = new HE_FileUpload2(req, resp);
		BroadCastingCateVo vo = fu.boardUploading();
		String msg = dao.cate_modify(vo, req);
		mv.addObject("msg", msg);
		mv.setViewName("twitch_main/category_select"); 
		return mv;
	}
	
	@RequestMapping(value="*/category_delete.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView deleteC(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		String serial = req.getParameter("cat_serial");
		String msg = dao.cate_delete(serial, req);
		mv.addObject("msg", msg);
		mv.setViewName("twitch_main/category_select"); 
		return mv;
	}
	
	@RequestMapping(value="*/tag_management.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView tag(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		List<TagVo> list = new ArrayList<TagVo>();
		list = dao.tag_select();
		
		mv.addObject("list", list);
		mv.setViewName("twitch_main/tag_management");
		return mv;
	}
	
	@RequestMapping(value="*/tag_search.he", method= {RequestMethod.GET,RequestMethod.POST},produces = "application/json; charset=utf8")
	public @ResponseBody String tagSearch(HttpServletRequest req) throws Exception {
		String findStr =req.getParameter("findTag");

		List<TagVo> list = new ArrayList<TagVo>();
		list = dao.tag_search(findStr);
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(list);
		
		return json;
	}
	
	@RequestMapping(value="*/tag_delete.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView tagDelete(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String serial = req.getParameter("tag_serial");
		String msg = dao.tag_delete(serial);
		mv.addObject("msg", msg);
		mv.setViewName("twitch_main/tag_management");
		return mv;
	}
	
	@RequestMapping(value="*/tag_insert.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView tagInsert(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String tag_name = req.getParameter("cate_tags");
		String tag[] = tag_name.split(",");
		for(int i=0; i<tag.length ; i++) {
			dao.tag_insert(tag[i]);
		}
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
