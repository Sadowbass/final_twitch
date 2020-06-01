package stream_uk;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bean.AccUk;

@Controller
public class Controller_uk {
    @ResponseBody
    @RequestMapping(value = "*/accUser.uk", method = RequestMethod.GET)
    public String accUser(HttpServletRequest req, AccUk accUk) {
    	System.out.println("mid:::"+accUk.getMid());
    	System.out.println("oid:::"+accUk.getOid());
    	UkDao dao=new UkDao();
    	String acc=Integer.toString(dao.accUser(accUk));
    	System.out.println("acc:::"+acc);
        return acc;
    }
}
