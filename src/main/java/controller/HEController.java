package controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;

import org.omg.CORBA.BAD_INV_ORDER;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import bean.BroadCastingCateVo;
import bean.GCategoryVo;
import bean.HEDao;
import bean.ListComparator;
import bean.MemberVo;
import bean.OnAirVo;
import bean.Page;
import bean.StatisticVo;
import bean.StreamerVo;
import bean.StreamingVo;
import bean.TagVo;
import bean.UserProductVo;
import config.HE_FileUpload;
import config.HE_FileUpload2;
import oracle.jdbc.replay.ReplayableConnection.StatisticsReportType;
import stream_uk.Handler;
import stream_uk.UkDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

@Controller
public class HEController {
	HEDao dao;
	public HEController(HEDao dao){
		this.dao = dao;
	}
	
	@RequestMapping(value="*/home.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView home(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		List<String> list = new ArrayList<String>();
		list = dao.now_live();
		
		/*Map<String, Integer> map=new HashMap<String, Integer>();
	    Gson gson=new Gson();*/
	    List<OnAirVo> list2 =dao.onAir();
	    
	    for(int i=0; i<list2.size(); i++) {
	         String streamer=list2.get(i).getAir_mid();
	         if(Handler.getChatRoom().get(streamer) != null) {
	        	 int cnt=Handler.getChatRoom().get(streamer).size();//방송인원 가져옴 
	        	 list2.get(i).setCnt(cnt);
	         }else {
	        	 list2.get(i).setCnt(0);
	         }
	    }
	    
	    Collections.sort(list2, new ListComparator());//시청자 순으로 정렬
	    
	    List<OnAirVo> list3 = dao.onAir_cate(); //카테고리별 시청자수 정보
	    
	    for(int i=0; i<list3.size(); i++) {
	    	String gname = list3.get(i).getAir_gname();//방송중인 카테고리 하나씩 가져옴 
	    	int cnt = 0;
	    	for(int j=0; j<list2.size(); j++) {
	    		String streamer=list2.get(i).getAir_mid();//방송중인 스트리머 아이디 하나씩 가져옴
	    		String gname2 = list2.get(i).getAir_gname(); //방송중인 스트리머가 하는 게임 하나씩 가져옴
	    		if(gname.equals(gname2)) {
	    			cnt += list2.get(i).getCnt(); //시청자수 가져와서 같은 카테고리면 합한다
	    		}
	    	}
	    	list3.get(i).setCnt(cnt);//카테고리별 총 시청자수 
	    }
	    
	    Collections.sort(list3, new ListComparator()); //총시청자 별로 정렬
	    
	    List<UserProductVo> list4 = dao.day_hit();
	    
	    mv.addObject("hit", list4);//오늘의 인기 상품 
	    mv.addObject("cate", list3);//시청자 많은 카테고리
	    mv.addObject("onair", list2);//시청자 많은 방송 
		mv.addObject("now", list);
		req.getSession().setAttribute("start", "ok");
		mv.setViewName("/admin/index"); 
		return mv;
		
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
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/member/member_select"); //select라는 페이지에 넘기겠다  ->resolver가 받음-> index.jsp?inc=./board/select.jsp가 로딩됨
		return mv;
	}
	
	@RequestMapping(value="*/member_insert.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView insertM(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/member/member_insert"); 
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
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/member/result"); 
		return mv;
	}
	
	@RequestMapping(value="*/member_modify.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView modifyM(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		MemberVo vo =  null;
		String mid =(String)req.getParameter("member_id");
		vo=dao.member_view(mid);
		
		mv.addObject("vo", vo);
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/member/member_modify"); 
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
		
		List<StatisticVo> list = new ArrayList<StatisticVo>();
		list = dao.mileage(vo.getMem_id());
		List<StatisticVo> list2 = new ArrayList<StatisticVo>();
		list2 = dao.mileage_use(vo.getMem_id());
		
		for(int i=0;i <list2.size();i++) {
			if(list2.get(i).getType()!=null) {
				
				if(list2.get(i).getType().equals("3")) {
					list2.get(i).setType("구독");
				}else {
					list2.get(i).setType("도네이션");
				}
				
			}
		}
		
		List<String> list3 = new ArrayList<String>();
		list3 = dao.Watching(mid);
		
		String tot_time = dao.Watching_tot(mid);
		
		List<String> list4 = new ArrayList<String>();
		list4 = dao.last_pay(mid);
		
		String tot_pay = dao.last_pay_tot(mid);
		
		List<UserProductVo> sc = new ArrayList<UserProductVo>();
		sc=dao.store_cate(mid);
		List<UserProductVo> sb = new ArrayList<UserProductVo>();
		sb = dao.store_buylist(mid);
		
		
		
		mv.addObject("store_buylist", sb);
		mv.addObject("store_cate", sc);
		mv.addObject("tot_pay", tot_pay);
		mv.addObject("last_pay", list4);
		mv.addObject("tot_time", tot_time);
		mv.addObject("watch", list3);
		mv.addObject("pay_use", list2);
		mv.addObject("payment", list);
		mv.addObject("vo", vo);
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/member/member_view"); 
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
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/member/result"); 
		return mv;
	}
	
	@RequestMapping(value="*/delete_result.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView deleteResult(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		String mid = (String)req.getParameter("member_id");
		String msg = dao.member_delete(mid,req);
		mv.addObject("msg", msg);
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/member/result"); 
		return mv;
	}
	
	@RequestMapping(value="*/live_broadcast.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView LiveBroadcast(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		List<StreamingVo> list =  new ArrayList<StreamingVo>();
		list = dao.onair();
		mv.addObject("list", list);
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/twitch_main/live_broadcast"); 
		return mv;
	}
	
	@RequestMapping(value="*/streamer.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView Streamer(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		List<StreamerVo> list = new ArrayList<StreamerVo>();
		list =dao.streamer_select();
		for(int i=0;i <list.size();i++) {
			if(list.get(i).getMem_status()!=null ) {
				
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
	
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/twitch_main/streamer"); 
		return mv;
	}
	
	@RequestMapping(value="*/streamer_view.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView viewS(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String mid =(String)req.getParameter("he_serial");
		StreamerVo vo = new StreamerVo();
		vo = dao.streamer_view(mid);
		
		if(vo != null) {
			if( vo.getMem_status()!=null) {
				if(vo.getMem_status().equals("0")) {
					vo.setMem_status("오프라인");
				}else if(vo.getMem_status().equals("1")) {
					vo.setMem_status("온라인");
				}else {
					vo.setMem_status("방송중");
				}
			}
		}
		List<List<String>> list = new ArrayList<List<String>>();
		list = dao.weekly_broad_time(mid);
		List<String> board_time = new ArrayList<String>();
		for(int i=0; i<list.size();i++) {
			List<String> od = new ArrayList<String>();
			od = list.get(i);
			double time=0;
			for(int j=0; j<od.size();j++) {
				String array[] = od.get(j).split(":");
				int hour =Integer.parseInt(array[0]);
				double min = Double.parseDouble((array[1]))/60.0;
				double temptime = hour+min;
				time += temptime;
			}
			String t = time+"";
			board_time.add(t);
		}
		
		list = dao.monthly_broad_time(mid);
		List<String> board_time2 = new ArrayList<String>();
		for(int i=0; i<list.size();i++) {
			List<String> bt = new ArrayList<String>();
			bt =list.get(i);
			double time=0;
			for(int j=0; j<bt.size();j++) {
				String array[] = bt.get(j).split(":");
				int hour =Integer.parseInt(array[0]);
				double min = Double.parseDouble((array[1]))/60.0;
				double temptime = hour+min;
				time += temptime;
			}
			String t = time+"";
			board_time2.add(t);
		}
		
		list = dao.year_broad_time(mid);
		List<String> board_time3 = new ArrayList<String>();
		for(int i=0; i<list.size();i++) {
			List<String> bt = new ArrayList<String>();
			bt =list.get(i);
			double time=0;
			for(int j=0; j<bt.size();j++) {
				String array[] = bt.get(j).split(":");
				int hour =Integer.parseInt(array[0]);
				double min = Double.parseDouble((array[1]))/60.0;
				double temptime = hour+min;
				time += temptime;
			}
			String t = time+"";
			board_time3.add(t);
		}
		
		
		List<String> cnt = new ArrayList<String>();
		cnt = dao.weekly_follow(mid);
		List<String> tot_cnt = new ArrayList<String>();
		tot_cnt = dao.weekly_follow_tot(mid);
		List<String> cnt2 = new ArrayList<String>();
		cnt2 = dao.weekly_sub(mid);
		List<String> tot_cnt2 = new ArrayList<String>();
		tot_cnt2 = dao.weekly_sub_tot(mid);
		List<String> m_cnt = new ArrayList<String>();
		m_cnt = dao.monthly_follow(mid);
		List<String> m_cnt2 = new ArrayList<String>();
		m_cnt2 = dao.monthly_sub(mid);
		List<String> tot_m_cnt = new ArrayList<String>();
		tot_m_cnt = dao.monthly_follow_tot(mid);
		List<String> tot_m_cnt2 = new ArrayList<String>();
		tot_m_cnt2 = dao.monthly_sub_tot(mid);
		List<String> y_cnt = new ArrayList<String>();
		y_cnt = dao.year_follow(mid);
		List<String> y_cnt2 = new ArrayList<String>();
		y_cnt2 = dao.year_sub(mid);
		List<String> tot_y_cnt = new ArrayList<String>();
		tot_y_cnt = dao.year_follow_tot(mid);
		List<String> tot_y_cnt2 = new ArrayList<String>();
		tot_y_cnt2 = dao.year_sub_tot(mid);
		List<String> don = new ArrayList<String>();
		don=dao.weekly_don(mid);
		List<String> m_don = new ArrayList<String>();
		m_don = dao.monthly_don(mid);
		List<String> y_don = new ArrayList<String>();
		y_don = dao.year_don(mid);
		List<String> sub = new ArrayList<String>();
		sub =dao.weekly_subpofit(mid);
		List<String> m_sub = new ArrayList<String>();
		m_sub = dao.monthly_subprofit(mid);
		List<String> y_sub = new ArrayList<String>();
		y_sub = dao.year_subprofit(mid);
		
		int isban = dao.isban(mid);//방송금지인지 확인
		
		List<GCategoryVo> g_cate = new ArrayList<GCategoryVo>();
		g_cate = dao.gcategory(mid);
		List<GCategoryVo> g_cate_m = new ArrayList<GCategoryVo>();
		g_cate_m = dao.gcategory_m(mid);
		List<GCategoryVo> g_cate_y = new ArrayList<GCategoryVo>();
		g_cate_y = dao.gcategory_y(mid);
		
		mv.addObject("gm", g_cate_m);
		mv.addObject("gy", g_cate_y);
		mv.addObject("g_cate", g_cate);
		mv.addObject("isban", isban);
		mv.addObject("don", don);
		mv.addObject("m_don", m_don);
		mv.addObject("y_don", y_don);
		mv.addObject("sub", sub);
		mv.addObject("m_sub", m_sub);
		mv.addObject("y_sub", y_sub);
		mv.addObject("t_y_cnt", tot_y_cnt);
		mv.addObject("t_y_cnt2", tot_y_cnt2);
		mv.addObject("y_cnt", y_cnt);
		mv.addObject("y_cnt2",y_cnt2);
		mv.addObject("t_m_cnt", tot_m_cnt);
		mv.addObject("t_m_cnt2", tot_m_cnt2);
		mv.addObject("m_cnt", m_cnt);
		mv.addObject("m_cnt2", m_cnt2);
		mv.addObject("tot_cnt", tot_cnt);
		mv.addObject("tot_cnt2", tot_cnt2);
		mv.addObject("cnt2", cnt2);
		mv.addObject("cnt", cnt);
		mv.addObject("bt3", board_time3);
		mv.addObject("bt2", board_time2);
		mv.addObject("bt",board_time);
		mv.addObject("vo", vo);
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/twitch_main/streamer_detail"); 
		return mv;
	}
	
	@RequestMapping(value="*/broadstop.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView broadstop(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String mid= req.getParameter("he_serial");
		dao.broadban(mid);
		
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/twitch_main/streamer_detail"); 
		return mv;
	}
	

	@RequestMapping(value="*/broadok.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView broadok(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String mid= req.getParameter("he_serial");
		dao.broadok(mid);//방송정지 테이블에서 정보 삭제
		
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/twitch_main/streamer_detail"); 
		return mv;
	}
	
	
	@RequestMapping(value="*/category_select.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView selectC(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		List<BroadCastingCateVo> list;
		list = dao.cate_select();

		mv.addObject("list", list);

		mv.setViewName("/admin/index.jsp?inc=./admin_pages/twitch_main/category_select"); 
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
	
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/twitch_main/category_insert"); 
		return mv;
	}
	
	@RequestMapping(value="*/category_insertR.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView insertR(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		HE_FileUpload2 fu = new HE_FileUpload2(req, resp);
		BroadCastingCateVo vo = fu.boardUploading();
		String msg = dao.cate_insert(vo, req);
		mv.addObject("msg", msg);
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/twitch_main/category_insert"); 
		return mv;
	}
	
	
	
	@RequestMapping(value="*/category_modifyR.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView modifyC(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		HE_FileUpload2 fu = new HE_FileUpload2(req, resp);
		BroadCastingCateVo vo = fu.boardUploading();
		String msg = dao.cate_modify(vo, req);
		mv.addObject("msg", msg);
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/twitch_main/category_select"); 
		return mv;
	}
	
	@RequestMapping(value="*/category_delete.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView deleteC(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		String serial = req.getParameter("cat_serial");
		String msg = dao.cate_delete(serial, req);
		mv.addObject("msg", msg);
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/twitch_main/category_select"); 
		return mv;
	}
	
	@RequestMapping(value="*/tag_management.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView tag(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		List<TagVo> list = new ArrayList<TagVo>();
		list = dao.tag_select();
		
		mv.addObject("list", list);
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/twitch_main/tag_management");
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
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/twitch_main/tag_management");
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
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/twitch_main/tag_management");
		return mv;
	}
	

	@RequestMapping(value="*/profit.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView profit(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		List<StreamerVo> d_tot = new ArrayList<StreamerVo>();
		Page page = new Page();
		if(req.getParameter("page")==null) {
			page.setNowPage(1);
		}else {
			int p = Integer.parseInt(req.getParameter("page"));
			page.setNowPage(p);
		}
		d_tot = dao.d_profit();
		page.setTotListSize(d_tot.size());
		page.pageCompute();
		List<StreamerVo> d_list = new ArrayList<StreamerVo>();
		d_list = dao.d_profit2(page); //도네수익 랭킹
		Page page2 = new Page();
		if(req.getParameter("page2")==null) {
			page2.setNowPage(1);
		}else {
			int p = Integer.parseInt(req.getParameter("page2"));
			page2.setNowPage(p);
		}
		List<StreamerVo> s_list = new ArrayList<StreamerVo>();
		s_list = dao.s_profit(page2);//구독 수익 랭킹 
		
		List<StatisticVo> done_list = new ArrayList<StatisticVo>();
		done_list = dao.done_profit();
		
		List<StatisticVo> sub_list = new ArrayList<StatisticVo>();
		sub_list = dao.sub_profit();
		
		List<StatisticVo> pay_list = new ArrayList<StatisticVo>();
		pay_list = dao.payment();
		
		mv.addObject("p", page);
		mv.addObject("d_list", d_list);
		mv.addObject("pay", pay_list);
		mv.addObject("sub_list", sub_list);
		mv.addObject("done_list", done_list);
		mv.addObject("s_list", s_list);
		mv.addObject("p2", page2);
		mv.addObject("p", page);
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/twitch_main/profit_management"); 
		return mv;
	}
	
	
	@RequestMapping(value="*/help.he", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView help(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
	
		mv.setViewName("/admin/index.jsp?inc=./admin_pages/twitch_main/help"); 
		return mv;
	}
	
	

}
