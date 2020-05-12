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
    	System.out.println("aaaa");
	 this.dao = dao;
	}

	@RequestMapping(value="*/productView.str", method= {RequestMethod.POST})
	public ModelAndView productView(HttpServletRequest req) {
    	System.out.println("제발2");
		
    	ModelAndView mv = new ModelAndView();
    	
    	System.out.println(mv);
		mv.setViewName("productDetail");
    	return mv;
    }
	
	@RequestMapping(value="/revInsertR.str", method= {RequestMethod.POST})
	public ModelAndView insertR(HttpServletRequest req, HttpServletResponse resp) {
    	
    	ModelAndView mv = new ModelAndView();
    	
    	//FileUpload
    	
    	//FileUpload fu = new FileUpload(req, resp);
    	//HttpServletRequest newReq = fu.uploading();
    	
    	//BoardVo vo = (BoardVo)newReq.getAttribute("vo");
    	//List<AttVo> attList = (List<AttVo>)newReq.getAttribute("attList");
    	
    	//String msg = dao.insert(vo, attList);
    	
    	mv.addObject("p", req.getAttribute("p"));
    	//mv.addObject("msg", msg);
		mv.setViewName("result");
    	
    	return mv;
    }
	
}
