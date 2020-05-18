package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import bean.*;
import com.google.gson.Gson;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.DataOutput;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

@RestController
public class SCController {

    public SCController() {
        System.out.println("컨트롤러 생성");
    }

    @RequestMapping(value = "/categories", method = RequestMethod.GET)
    public ModelAndView categories(HttpServletRequest req){
        ModelAndView mv = new ModelAndView();
        SCDao dao = new SCDao();
        List<CategoriesVo> list = dao.categories();

        mv.addObject("URI",0);
        mv.addObject("list",list);
        mv.setViewName("categories");

        return mv;
    }

    @RequestMapping(value = "categories/all", method = RequestMethod.GET)
    public ModelAndView liveAll(HttpServletRequest req){
        ModelAndView mv = new ModelAndView();
        SCDao dao = new SCDao();
        List<StreamingVo> list = new ArrayList<StreamingVo>();
        list = dao.allStreaming();

        mv.addObject("URI",1);
        mv.addObject("list",list);
        mv.setViewName("/categories");

        return mv;
    }

    @ResponseBody
    @RequestMapping(value = "/userinfo.sc", method = RequestMethod.POST)
    public String topPage(HttpServletRequest req){
        SCDao dao = new SCDao();
        HttpSession session = req.getSession();
        session.setAttribute("mId", "faker");
        String mId = (String) session.getAttribute("mId");
        Gson gson = new Gson();
        String result = gson.toJson(dao.userInfo(mId));

        return result;
    }

    @RequestMapping(value = "/main.sc", method = RequestMethod.GET)
    public ModelAndView mainLoad(HttpServletRequest req) {
        ModelAndView mv = new ModelAndView();

        HttpSession session = req.getSession();
        session.setAttribute("mId","faker");

        mv.setViewName("main");
        return mv;
    }

    @RequestMapping(value = "/sidebar.sc", method = RequestMethod.GET)
    public ModelAndView sideBar(HttpServletRequest req) {
        ModelAndView mv = new ModelAndView();
        SCDao dao = new SCDao();
        HttpSession session = req.getSession();
        String mId = (String) session.getAttribute("mId");
        List<StreamingVo> list = dao.nowStreaming(mId);

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

    @RequestMapping(value = "/{id}/followers", method = RequestMethod.GET)
    public ModelAndView follwers(HttpServletRequest req, @PathVariable String id){
        ModelAndView mv = new ModelAndView();
        SCDao dao = new SCDao();
        List<UserInfoVo> list = dao.followers(id);

        mv.addObject("list", list);
        mv.setViewName("/channels");
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
