package controller_c;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.tools.DocumentationTool.Location;

import org.apache.ibatis.javassist.expr.Instanceof;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.ProductPhotoUpload_mh;
import bean.ProductPhoto_mh;
import bean.ProductVo_mh;
import bean.StoreMybatisDao_mh;
import bean.mh_Page;
import oracle.ucp.jdbc.oracle.rlb.OracleDatabaseInstanceInfoList.INSTANCE_CATEGORY_FOR_DATA_AFFINITY;

@Controller
public class AdminController_mh {
	
	StoreMybatisDao_mh dao;
	
	// 생성자
	public AdminController_mh(StoreMybatisDao_mh dao) {
		System.out.println("★★★★AdminController_mh 들어옴★★★★★★★");
		this.dao = dao;
	}
	
	@RequestMapping(value="*/reviewSelect.mh", produces="application/text; charset-utf8")
	public String reviewSelect(Model model, String findStr, String nowPage) {
		System.out.println("★★★controller->reviewSelect()★★★");
		
		mh_Page p = new mh_Page();
		p.setFindStr(findStr);
		
		if(nowPage == null) {
			p.setNowPage(1);
		}else {
			p.setNowPage(Integer.parseInt(nowPage));
		}
		
		
		return "review";
	}
	
	@RequestMapping(value="*/productDelete.mh", method=RequestMethod.POST, produces="application/text; charset-utf-8")
	@ResponseBody
	public void productDelete(String product_id) {
		System.out.println("★★★controller->productDelete()★★★");
		
		
		String msg = dao.delete(product_id);
		
		System.out.println(msg);
		
		
	}
	
	@RequestMapping(value="*/productInsert.mh", method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String productInsert(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("★★★★productInsert 메소드 들어옴★★★★★★★");
		String msg=null;
		
		ProductVo_mh vo = new ProductVo_mh();
		ProductPhotoUpload_mh fu= new ProductPhotoUpload_mh(req, resp);
		fu.uploading();
		
		vo = (ProductVo_mh)req.getAttribute("vo");
		List<ProductPhoto_mh> attList = (List<ProductPhoto_mh>)req.getAttribute("attList");
		
		System.out.println(vo.getProduct_name());
		System.out.println(vo.getProduct_cate());
		System.out.println(vo.getProduct_count());
		System.out.println(vo.getProduct_explain());
		System.out.println(vo.getProduct_price());
		System.out.println(vo.getProduct_size());
		
		msg=dao.insert(vo,attList);		
		return msg;
	}
	
	@RequestMapping(value="*/product_select.mh", method= {RequestMethod.GET,RequestMethod.POST}, produces="application/text; charset=utf8")
	public String productSelect(Model model,String product_search,String nowPage) {
		System.out.println("컨트롤러 -> product_select.mh 실행");		
		
		mh_Page p = new mh_Page();
		p.setFindStr(product_search);
		if(nowPage == null) {
			p.setNowPage(1);
		}else {
			p.setNowPage(Integer.parseInt(nowPage));
		}
		System.out.println("★★★★★" + p.getNowPage());
		System.out.println("★★★★★" + p.getFindStr());
		List<ProductVo_mh> list =  dao.select(p);
		/*List<Integer> productStateCount = dao.productStateCount();*/
		
		/*model.addAttribute("productStateCount",productStateCount);*/
		model.addAttribute("p",p);
		model.addAttribute("list",list);
		
		return "product_select";
	}
	
	
	@RequestMapping(value="*/product_view.mh", method=RequestMethod.POST, produces="application/text; charset-utf8")
	public String product_view(Model model, int productSerial, int nowPage, String product_search) {
		
		ProductVo_mh vo = null;
		mh_Page p = new mh_Page();
		
		vo = dao.productView(productSerial);
		
		p.setFindStr(product_search);
		p.setNowPage(nowPage);
		
		model.addAttribute("vo",vo);
		model.addAttribute("p",p);
		
		return "product_view";
	}
	
	@RequestMapping(value="*/productModify.mh", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String productModify(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("★★★controller -> productModify() 들어옴★★★");
		String msg=null;
		
		ProductVo_mh vo = new ProductVo_mh();
		ProductPhotoUpload_mh fu= new ProductPhotoUpload_mh(req, resp);
		fu.uploading();
		
		vo = (ProductVo_mh)req.getAttribute("vo");
		List<ProductPhoto_mh> attList = (List<ProductPhoto_mh>)req.getAttribute("attList");
		
		System.out.println(vo.getProduct_id());
		System.out.println(vo.getProduct_name());
		System.out.println(vo.getProduct_cate());
		System.out.println(vo.getProduct_count());
		System.out.println(vo.getProduct_explain());
		System.out.println(vo.getProduct_price());
		System.out.println(vo.getProduct_size());
		
		msg=dao.modify(vo,attList);		
		System.out.println("컨트롤러에서 msg : "+msg);
		return msg;
	}
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value="*/test.mh", method= {RequestMethod.GET, RequestMethod.POST},produces="application/text; charset=utf8")
	public String test() {
		
		System.out.println("test");
		return "test";
	}
	
	
}
