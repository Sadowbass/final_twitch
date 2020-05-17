package controller_c;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.ProductPhotoUpload_mh;
import bean.ProductPhoto_mh;
import bean.ProductVo_mh;
import bean.StoreMybatisDao_mh;

@Controller
public class AdminController_mh {
	
	StoreMybatisDao_mh dao;
	
	
	public AdminController_mh(StoreMybatisDao_mh dao) {
		System.out.println("★★★★AdminController_mh 들어옴★★★★★★★");
		this.dao = dao;
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
	@ResponseBody
	public void productSelect() {
		
		
	}
}
