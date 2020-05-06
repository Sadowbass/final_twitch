package controller_c;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StreamerController_c {
	
	public StreamerController_c() {
		System.out.println("★★★★★★");
		
	}

	@RequestMapping(value="*/streamer.tgd", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView select() {
		ModelAndView mv = new ModelAndView();
		System.out.println("wqdqwwq");
		
		mv.setViewName("streamer");
		return mv;
	}
}
