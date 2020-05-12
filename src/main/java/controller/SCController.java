package controller;

import javax.servlet.http.HttpServletRequest;

import bean.SCDao;
import bean.StreamingVo;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class SCController {
	
    public SCController() { 
        System.out.println("컨트롤러 생성");
    }

    @RequestMapping(value = "/sidebar.sc", method = RequestMethod.GET)
    public ModelAndView sideBar(HttpServletRequest req){
    	ModelAndView mv = new ModelAndView();
    	System.out.println("index.sc");

    	mv.addObject("cnt","3,333");
    	mv.setViewName("sidebar");

    	return mv;
	}
    
    @RequestMapping(value="/{id}" , method=RequestMethod.GET)
    public ModelAndView test(HttpServletRequest req, @PathVariable String id) {
    	ModelAndView mv = new ModelAndView();
		SCDao dao = new SCDao();
		StreamingVo vo = dao.test(id);
		
		if(vo == null){ 
			mv.setViewName("404");
		} else {
			mv.setViewName("./twitch_uk/stream_uk");
			mv.addObject("vo", vo);
		}

		System.out.println(id);
    	System.out.println(req.getRequestURI());
    	System.out.println(req.getRequestURL());
    	
    	return mv;
    }

    @RequestMapping(value = "main.sc", method = RequestMethod.GET)
	public ModelAndView test2(HttpServletRequest req){
    	ModelAndView mv = new ModelAndView();
		mv.setViewName("main");

		return mv;
	}
}
