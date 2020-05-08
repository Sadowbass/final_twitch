package stream_uk;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ConUk {
	@RequestMapping(value="/stream.st", method= {RequestMethod.GET, RequestMethod.POST})
	public String stream(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();

		/*mv.setViewName("stream");*/
		return "stream";

	}

}
