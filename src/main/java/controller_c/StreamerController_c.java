package controller_c;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/tgd_c")
public class StreamerController_c {
	
	public StreamerController_c() {
		System.out.println("★★★★★★");
		
	}

	@RequestMapping(value="/streamer.tgd", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView streamer() {
		ModelAndView mv = new ModelAndView();
		System.out.println("wqdqwwq");
		
		mv.setViewName("streamer");
		return mv;
	}
	
	@RequestMapping(value="/streamerMain.tgd", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView streamerMain() {
		ModelAndView mv = new ModelAndView();
		System.out.println("streamerMain");
		
		mv.setViewName("streamerMain");
		return mv;
	}
	
	@RequestMapping(value="/boardView.tgd", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView boardView() {
		ModelAndView mv = new ModelAndView();
		System.out.println("boardView");
		
		mv.setViewName("board");
		return mv;
	}
}
