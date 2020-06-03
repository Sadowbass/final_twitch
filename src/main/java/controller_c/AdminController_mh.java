package controller_c;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bean.MH_ReviewVo;
import bean.MH_ageCountVo;
import bean.MH_cateCountVo;
import bean.MH_monthAmountVo;
import bean.MH_noticeVo;
import bean.MH_orderListVo;
import bean.MH_orderVo;
import bean.MH_rankproductVo;
import bean.MyPagePhotoUpload;
import bean.MyPageTakDao;
import bean.ProductPhotoUpload_mh;
import bean.ProductPhoto_mh;
import bean.ProductVo_mh;
import bean.StoreMybatisDao_mh;
import bean.UserInfoVo;
import bean.mh_Page;

@Controller
public class AdminController_mh {

	StoreMybatisDao_mh dao;

	// 생성자
	public AdminController_mh(StoreMybatisDao_mh dao) {
		
		System.out.println("★★★★AdminController_mh 들어옴★★★★★★★");
		this.dao = dao;
	}
	
	@RequestMapping(value="*/adminPwdModify.mh", method=RequestMethod.POST, produces="application/text; charset=utf8;")
	@ResponseBody
	public String adminPwdModify(String userId, String NewPasswordConfirm) {
		String msg="";
		UserInfoVo vo = new UserInfoVo();
		System.out.println("userId : "+userId);
		System.out.println("pwd : "+NewPasswordConfirm);
		vo.setMem_id(userId);
		vo.setMem_pwd(NewPasswordConfirm);
		
		msg = dao.adminPwdModify(vo);
		
		return msg;
		
	}
	
	
	// 관리자 기본 정보 변경
	@RequestMapping(value="*/adminModify.mh", method=RequestMethod.POST, produces="application/text; charset=utf8;")
	@ResponseBody
	public String adminModify(String userId, String birth, String email, String adminName) {
		String msg="";
		UserInfoVo vo = new UserInfoVo();
		vo.setMem_id(userId);
		vo.setMem_birth(birth);
		vo.setMem_name(adminName);
		vo.setMem_email(email);
		
		msg = dao.adminModify(vo);
		
		return msg;
		
	}
	@RequestMapping(value="*/adminPhotoModify.mh", method=RequestMethod.POST, produces="application/text; charset=utf8;")
	@ResponseBody
	public String adminPhotoModify(HttpServletRequest req, HttpServletResponse resp) {
		String msg="테스트";
		int r =0;
		
		MyPagePhotoUpload upload = new MyPagePhotoUpload(req, resp);
		UserInfoVo vo = upload.uploading();
		System.out.println("★★★★ vo.getFlag() :" + vo.getFlag());
		System.out.println("★★★★ vo.getMem_id() :" + vo.getMem_id());
		System.out.println("★★★★ vo.getPh_sysfile() :" + vo.getPh_sysfile());
		System.out.println("★★★★ vo.getPh_orifile() :" + vo.getPh_orifile());
		System.out.println("★★★★ vo.getPh_delfile() :" + vo.getPh_delfile());
	      r = dao.updateProfill(vo);
	      
	      
	      if(r == 0) {
	    	  msg = "실패";
	      }else if(r == 1) {
	    	  msg = "성공";
	      }
		
		
		
		
		
		
		return msg;
	}
	
	@RequestMapping(value="*/profile.mh", method= {RequestMethod.GET,RequestMethod.POST}, produces="application/text; charset=utf-8;")
	public String profile(Model model, String userId) {
		
		UserInfoVo vo = dao.profile(userId);
		model.addAttribute("vo",vo);
				
		return "profile";
	}
			
	@RequestMapping(value="*/noticeDelete.mh", method=RequestMethod.POST, produces="application/text; charset=utf8")
	@ResponseBody
	public String noticeDelete(int serial) {
		System.out.println("★★★  noticeDelete() 들어옴 ");
		String msg = "";
		
		msg = dao.noticeDelete(serial);
		
		System.out.println("★★★ msg : " + msg);
		return msg;
	}
	
	
	@RequestMapping(value="*/noticeModify.mh", method=RequestMethod.POST, produces="application/text; charset=utf8;")
	@ResponseBody
	public String noticeModify(int noticeNO, String noticeSubject, String noticeContent) {
		System.out.println("★★★  noticeModify() 들어옴 ");
		String msg="";
		
		MH_noticeVo vo = new MH_noticeVo();
		
		vo.setNo(noticeNO);
		vo.setSubject(noticeSubject);
		vo.setContent(noticeContent);
		
		msg = dao.noticeModify(vo);
		System.out.println("★★★ msg : " + msg);
		return msg;
	}
	
	@RequestMapping(value="*/noticeView.mh", method=RequestMethod.POST, produces="application/text; charset=utf8;")
	public String noticeModify(Model model, int noticeSerial) {
		System.out.println("★★★noticeSerial : " + noticeSerial);
		
		MH_noticeVo vo = dao.noticeView(noticeSerial);
		
		model.addAttribute("vo",vo);
		
		return "notice_view";
	}
	
	@RequestMapping(value="*/noticeInsertR.mh", method=RequestMethod.POST, produces="application/text; charset=utf8;")
	@ResponseBody
	public String noticeInsertR(HttpServletRequest req) {
		MH_noticeVo vo = new MH_noticeVo();
		String msg = null;
		
		String subject = req.getParameter("noticeSubject");
		String content = req.getParameter("noticeContent");
		
		System.out.println("★★★ subject : " + subject);
		System.out.println("★★★ content : " + content);
		vo.setSubject(subject);
		vo.setContent(content);
		msg = dao.noticeInsertR(vo);
		System.out.println("★★★ msg : " + msg);
		return msg;
	}
	
	@RequestMapping(value="*/noticeInsert.mh", method= RequestMethod.GET, produces = "application/text; charset=utf8;")
	public String noticeInsert() {
		
		return "noticeInsert";
	}
	
	@RequestMapping(value = "*/notice.mh", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/text; charset-utf8;")
	public String notice(Model model, String nowPage, String findNotice) {
		mh_Page p = new mh_Page();
		
		p.setFindStr(findNotice);
		
		if(nowPage == null) {
			p.setNowPage(1);
		}else {
			p.setNowPage(Integer.parseInt(nowPage));
		}
		
		List<MH_noticeVo> noticeList = dao.noticeSelect(p);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("p", p);
		
		return "notice";
	}
	
	
	//통계 관리
	@RequestMapping(value = "*/shop_statistic.mh", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/text; charset=utf8")
	public String shop_statistic(Model model) {
		System.out.println("★★★서블릿 -> shop_statistic() 들어옴");

		List<MH_monthAmountVo> monthAmountList = dao.monthAmount();
		List<MH_rankproductVo> rankproductList = dao.rankproduct();
		List<MH_ageCountVo> ageCountList = dao.ageCount();
		List<MH_cateCountVo> cateCountList = dao.cateCount();

		model.addAttribute("monthAmountList", monthAmountList);
		model.addAttribute("rankproductList", rankproductList);
		model.addAttribute("ageCountList", ageCountList);
		model.addAttribute("cateCountList", cateCountList);

		return "shop_statistic";
	}

	@RequestMapping(value = "*/orderViewDelete.mh", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public void orderViewDelete(int order_serial) {
		System.out.println("★★★ order_serial : " + order_serial);

		String msg = dao.orderDelete(order_serial);

		System.out.println("msg : " + msg);

	}

	@RequestMapping(value = "*/orderView.mh", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String orderView(Model model, String orderSelect_mem_id, String orderSelect_orderSerial,
			int orderSelect_nowPage, String order_search_mh) {
		System.out.println("★★★★★orderView");

		MH_orderVo vo = new MH_orderVo();
		mh_Page p = new mh_Page();

		vo.setMem_id(orderSelect_mem_id);
		vo.setOrder_serial(orderSelect_orderSerial);

		p.setFindStr(order_search_mh);
		p.setNowPage(orderSelect_nowPage);

		System.out.println("★★★mem_id : " + orderSelect_mem_id);
		System.out.println("★★★serial : " + orderSelect_orderSerial);
		List<MH_orderListVo> list = dao.orderDetail(vo);

		model.addAttribute("list", list);
		model.addAttribute("p", p);

		return "order_view";
	}

	// 주문 조회
	@RequestMapping(value = "*/orderSelect.mh", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/text; charset=utf8")
	public String orderSelect(Model model, String orderSelect_nowPage, String order_search_mh) {
		mh_Page p = new mh_Page();

		System.out.println("★★★페이지 : " + orderSelect_nowPage);
		System.out.println("★★★검색어 : " + order_search_mh);
		if (orderSelect_nowPage == null) {
			p.setNowPage(1);
		} else {
			p.setNowPage(Integer.parseInt(orderSelect_nowPage));
		}
		p.setFindStr(order_search_mh);

		List<MH_orderVo> list = dao.orderSelect(p);

		model.addAttribute("list", list);
		model.addAttribute("p", p);
		System.out.println("★★★ end");
		return "order_select";
	}

	@RequestMapping(value = "*/reviewDelete.mh", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public void reviewDelete(int review_id) {
		System.out.println("★★★controller->reviewDelete()★★★");

		String msg = dao.reviewDelete(review_id);

		System.out.println(msg);
	}

	@RequestMapping(value = "*/reviewView.mh", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String reviewView(Model model, int review_serial, int nowPage, String reviewFindStr) {
		System.out.println("★★★★★reviewView");

		mh_Page p = new mh_Page();
		p.setFindStr(reviewFindStr);
		p.setNowPage(nowPage);
		MH_ReviewVo vo = dao.reviewDetail(review_serial);

		model.addAttribute("vo", vo);
		model.addAttribute("p", p);
		model.addAttribute("nowPage", nowPage);

		return "review_detail";
	}

	@RequestMapping(value = "*/reviewSelect.mh", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "application/text; charset=utf8")
	public String reviewSelect(Model model, String reviewFindStr, String nowPage) {
		System.out.println("★★★controller->reviewSelect()★★★");

		mh_Page p = new mh_Page();
		p.setFindStr(reviewFindStr);

		if (nowPage == null) {
			p.setNowPage(1);
		} else {
			p.setNowPage(Integer.parseInt(nowPage));
		}
		System.out.println("현재 페이지 : " + p.getNowPage());

		List<MH_ReviewVo> list = dao.reviewSelect(p);

		model.addAttribute("list", list);
		model.addAttribute("p", p);

		return "review";
	}

	@RequestMapping(value = "*/productDelete.mh", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public void productDelete(String product_id) {
		System.out.println("★★★controller->productDelete()★★★");

		String msg = dao.delete(product_id);

		System.out.println(msg);

	}

	@RequestMapping(value = "*/productInsert.mh", method = {RequestMethod.GET,RequestMethod.POST}, produces = "application/text; charset=utf8")
	@ResponseBody
	public String productInsert(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("★★★★productInsert 메소드 들어옴★★★★★★★");
		String msg = null;

		ProductVo_mh vo = new ProductVo_mh();
		ProductPhotoUpload_mh fu = new ProductPhotoUpload_mh(req, resp);
		fu.uploading();

		vo = (ProductVo_mh) req.getAttribute("vo");
		List<ProductPhoto_mh> attList = (List<ProductPhoto_mh>) req.getAttribute("attList");

		System.out.println(vo.getProduct_name());
		System.out.println(vo.getProduct_cate());
		System.out.println(vo.getProduct_count());
		System.out.println(vo.getProduct_explain());
		System.out.println(vo.getProduct_price());
		System.out.println(vo.getProduct_size());
		System.out.println("사진 리스트 사이즈 : " + attList.size());

		msg = dao.insert(vo, attList);
		return msg;
	}

	// 상품조회
	@RequestMapping(value = "*/product_select.mh", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/text; charset=utf8")
	public String productSelect(Model model, String product_search, String nowPage) {
		System.out.println("컨트롤러 -> product_select.mh 실행");

		mh_Page p = new mh_Page();
		p.setFindStr(product_search);
		if (nowPage == null) {
			p.setNowPage(1);
		} else {
			p.setNowPage(Integer.parseInt(nowPage));
		}
		System.out.println("★★★★★" + p.getNowPage());
		System.out.println("★★★★★" + p.getFindStr());
		List<ProductVo_mh> list = dao.select(p);
		/* List<Integer> productStateCount = dao.productStateCount(); */

		/* model.addAttribute("productStateCount",productStateCount); */
		model.addAttribute("p", p);
		model.addAttribute("list", list);

		return "product_select";
	}

	@RequestMapping(value = "*/product_view.mh", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String product_view(Model model, int productSerial, int nowPage, String product_search) {

		ProductVo_mh vo = null;
		mh_Page p = new mh_Page();

		vo = dao.productView(productSerial);

		p.setFindStr(product_search);
		p.setNowPage(nowPage);

		model.addAttribute("vo", vo);
		model.addAttribute("p", p);

		return "product_view";
	}
	
	@RequestMapping(value = "*/pModify.mh", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String pModify(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("★★★controller -> pModify() 들어옴★★★");
		String msg = null;

		ProductVo_mh vo = new ProductVo_mh();
		
		vo.setProduct_id(Integer.parseInt(req.getParameter("product_id")));
		vo.setProduct_name(req.getParameter("productName"));
		vo.setProduct_explain(req.getParameter("explain"));
		vo.setProduct_price(Integer.parseInt(req.getParameter("productPrice")));
		vo.setProduct_cate(req.getParameter("category"));
		vo.setProduct_count(Integer.parseInt(req.getParameter("productCount")));
		vo.setProduct_size(req.getParameter("productSize"));
		
		msg= dao.pModify(vo);
		
		
		// ProductPhotoUpload_mh fu = new ProductPhotoUpload_mh(req, resp);
		// fu.uploading();

		// vo = (ProductVo_mh) req.getAttribute("vo");
		// List<ProductPhoto_mh> attList = (List<ProductPhoto_mh>) req.getAttribute("attList");

		

		//msg = dao.modify(vo, attList);
		System.out.println("컨트롤러에서 msg : " + msg);
		return msg;
	}

	@RequestMapping(value = "*/productModify.mh", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String productModify(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("★★★controller -> productModify() 들어옴★★★");
		String msg = null;

		ProductVo_mh vo = new ProductVo_mh();
		ProductPhotoUpload_mh fu = new ProductPhotoUpload_mh(req, resp);
		fu.uploading();

		vo = (ProductVo_mh) req.getAttribute("vo");
		List<ProductPhoto_mh> attList = (List<ProductPhoto_mh>) req.getAttribute("attList");

		System.out.println(vo.getProduct_id());
		System.out.println(vo.getProduct_name());
		System.out.println(vo.getProduct_cate());
		System.out.println(vo.getProduct_count());
		System.out.println(vo.getProduct_explain());
		System.out.println(vo.getProduct_price());
		System.out.println(vo.getProduct_size());

		msg = dao.modify(vo, attList);
		System.out.println("컨트롤러에서 msg : " + msg);
		return msg;
	}

	@ResponseBody
	@RequestMapping(value = "*/test.mh", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/text; charset=utf8")
	public String test() {

		System.out.println("test");
		return "test";
	}

}
