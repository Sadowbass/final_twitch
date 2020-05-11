package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SCController {
	
    public SCController() { 
        System.out.println("컨트롤러 생성");
    }
    
    @RequestMapping(value="*.sc" , method=RequestMethod.GET)
    public ModelAndView test(HttpServletRequest req) {
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("video-page");
    	System.out.println("123");
    	System.out.println(req.getRequestURI());
    	System.out.println(req.getRequestURL());
    	
    	return mv;
    }
}
