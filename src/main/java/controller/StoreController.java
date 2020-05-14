package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.StoreMybatisDao;




@Controller
public class StoreController {
	
	StoreMybatisDao dao;
	
    public StoreController(StoreMybatisDao dao) {
    	System.out.println("storedao입성");
	 this.dao = dao;
	}

    @RequestMapping(value="/store/productDetail.str", method={ RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productView(HttpServletRequest req) {
    	System.out.println("pd.....");
		
    	ModelAndView mv = new ModelAndView();
    	
    	//System.out.println(mv);
		mv.setViewName("productDetail");
		
	 	System.out.println(req.getRequestURI());
		
    	return mv;
    }
	
	@RequestMapping(value="reviewInsert.str", method= {RequestMethod.POST})
	public ModelAndView reviewInsert(HttpServletRequest req, HttpServletResponse resp) {
    	
    	ModelAndView mv = new ModelAndView();
    	
    	//FileUpload
    	

    	
    	return mv;
    }
	
	@RequestMapping(value="/store/productList.str",  method={ RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productSlecet() {
    	System.out.println("들어왔다 컨트롤러........................1");
       	ModelAndView mv = new ModelAndView();
     	try {
	    	
			mv.setViewName("productList");
	    	System.out.println(mv + ".......................1");

		}catch(Exception ex) {
			ex.printStackTrace();
		}
    	return mv;
    }

	
}
