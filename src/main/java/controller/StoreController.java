package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.StoreMybatisDao;



@Controller
public class StoreController {
	
	StoreMybatisDao dao;
	
    public StoreController(StoreMybatisDao dao) {
    	System.out.println("storedao입성");
	 this.dao = dao;
	}

	@RequestMapping(value="productView.str", method= {RequestMethod.POST})
	public ModelAndView productView() {
    	System.out.println("제발2");
		
    	ModelAndView mv = new ModelAndView();
    	
    	System.out.println(mv);
		mv.setViewName("productDetail");
		
		System.out.println("제발3");
    	
    	return mv;
    }
	

	
}
