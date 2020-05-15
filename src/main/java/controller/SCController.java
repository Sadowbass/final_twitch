package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import bean.DonationVo;
import bean.SCDao;
import bean.SCFriendListVo;
import bean.StreamingVo;
import com.google.gson.Gson;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.DataOutput;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class SCController {

    public SCController() {
        System.out.println("컨트롤러 생성");
    }

    @RequestMapping(value = "/main.sc", method = RequestMethod.GET)
    public ModelAndView test2(HttpServletRequest req) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main");

        return mv;
    }

    @RequestMapping(value = "/sidebar.sc", method = RequestMethod.GET)
    public ModelAndView sideBar(HttpServletRequest req) {
        ModelAndView mv = new ModelAndView();
        SCDao dao = new SCDao();
        List<StreamingVo> list = dao.nowStreaming();

        mv.addObject("list", list);
        mv.addObject("cnt", "3,333");
        mv.setViewName("sidebar");

        return mv;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ModelAndView test(HttpServletRequest req, @PathVariable String id) {
        ModelAndView mv = new ModelAndView();
        SCDao dao = new SCDao();
        StreamingVo vo = dao.streamInfo(id);
        HttpSession session = req.getSession();
        String user = (String) session.getAttribute("session_id");

        if(user != null){
            mv.addObject("session_id", user);
        }

        if (vo == null) {
            mv.setViewName("404");
        } else {
            mv.setViewName("./twitch_uk/stream_uk");
            mv.addObject("vo", vo);
        }
        return mv;
    } // end of pagemove

    @RequestMapping(value = "/{id}/donation-view", method = RequestMethod.GET)
    public ModelAndView donationViewPage(HttpServletRequest req, @PathVariable String id) {
        ModelAndView mv = new ModelAndView();
        SCDao dao = new SCDao();
        StreamingVo vo = dao.streamInfo(id);

        if (vo == null) {
            mv.setViewName("../404");
        } else {
            mv.addObject("mId", id);
            mv.setViewName("/donstreamer");
        }

        return mv;
    }

    @RequestMapping(value = "/{id}/chat-view", method = RequestMethod.GET)
    public ModelAndView chatViewPage(HttpServletRequest req, @PathVariable String id) {
        ModelAndView mv = new ModelAndView();
        SCDao dao = new SCDao();
        StreamingVo vo = dao.streamInfo(id);
        if (vo == null) {
            mv.setViewName("../404");
        } else {
            mv.addObject("mId", id);
            mv.setViewName("/chtstreamer");
        }
        return mv;
    }

    @ResponseBody
    @RequestMapping(value = "/view-donation-list.sc", method = RequestMethod.POST)
    public String dtest(HttpServletRequest req) {
        DonationVo vo = new DonationVo();
        String mId = req.getParameter("mId");
        vo = new SCDao().donationView(mId);
        Gson gson = new Gson();
        String json = gson.toJson(vo);
        return json;
    }

    @ResponseBody
    @RequestMapping(value = "searchFriends.sc", method = RequestMethod.POST)
    public String searchFriend(HttpServletRequest req){
        String result="";
        String mId = req.getParameter("value");
        SCDao dao = new SCDao();
        Gson gson = new Gson();
        result = gson.toJson(dao.findFriends(mId));

        return result;
    }

}
