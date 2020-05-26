package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import bean.*;
import com.google.gson.Gson;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.DataOutput;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Stream;

@RestController
public class SCController {
    SCDao dao;

    public SCController() {
        System.out.println("컨트롤러 생성");
    }

    public SCController(SCDao dao) {
        this.dao = dao;
    }

    /* 카테고리 첫 페이지 띄웠을때 */
    @RequestMapping(value = "/categories", method = RequestMethod.GET)
    public ModelAndView categories(HttpServletRequest req) {
        ModelAndView mv = new ModelAndView();
        String findStr = "";
        if (req.getParameter("findTag") != null) {
            findStr = req.getParameter("findTag");
        }
        List<CategoriesVo> list = dao.categories(findStr);

        mv.addObject("URI", 0);
        mv.addObject("list", list);
        mv.addObject("findChannel", findStr);
        mv.setViewName("categories");

        return mv;
    }

    /* 카테고리 스크롤링으로 추가 정보 요청할때 */
    @ResponseBody
    @RequestMapping(value = "/categoryPaging.sc", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    public String categoryPaging(HttpServletRequest req) {
        Gson gson = new Gson();
        String rno = req.getParameter("rno");
        String findStr = "";
        if (req.getParameter("findTag") != null) {
            findStr = req.getParameter("findTag");
        }
        List<CategoriesVo> list = dao.categories(rno, findStr);
        String result = gson.toJson(list);
        return result;
    }

    /* 생방송중인 리스트 불러오기 */
    @RequestMapping(value = "categories/all", method = RequestMethod.GET)
    public ModelAndView liveAll(HttpServletRequest req) {
        ModelAndView mv = new ModelAndView();
        List<StreamingVo> list = new ArrayList<StreamingVo>();
        String findStr = "";
        if (req.getParameter("findTag") != null) {
            findStr = req.getParameter("findTag");
        }
        list = dao.allStreaming(findStr);

        mv.addObject("URI", 1);
        mv.addObject("list", list);
        mv.addObject("findChannel", findStr);
        mv.setViewName("/categories");

        return mv;
    }

    /* 스트리밍 페이징 */
    @ResponseBody
    @RequestMapping(value = "/streamingPaging.sc", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    public String streamingPaging(HttpServletRequest req, HttpServletResponse resp) {
        Gson gson = new Gson();
        String rno = req.getParameter("rno");
        String findStr = "";
        if (req.getParameter("findTag") != null) {
            findStr = req.getParameter("findTag");
        }
        List<StreamingVo> list = dao.allStreaming(rno, findStr);
        String result = gson.toJson(list);

        return result;
    }

    /* 비디오 다시보기 페이지 첫 로딩 */
    @RequestMapping(value = "/{id}/video", method = RequestMethod.GET)
    public ModelAndView videoPage(HttpServletRequest req, @PathVariable String id) {
        ModelAndView mv = new ModelAndView();
        List<BeforeVo> list = dao.lateVideo(id);

        mv.addObject("list", list);
        mv.setViewName("/history-page");
        return mv;
    }

    /* 비디오 다시보기 페이징 */
    @ResponseBody
    @RequestMapping(value = "/{id}/videoPaging.sc", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    public String videoPaging(HttpServletRequest req, @PathVariable String id) {
        String srno = req.getParameter("rno");
        int rno = Integer.parseInt(srno);
        List<BeforeVo> list = dao.videoPaging(id, rno);

        Gson gson = new Gson();

        return gson.toJson(list);
    }

    /* 로그인한 회원 정보 */
    @ResponseBody
    @RequestMapping(value = "/userinfo.sc", method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView topPage(HttpServletRequest req) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = req.getSession();
        String mId = (String) session.getAttribute("session_id");

        if (mId != null) {
            UserInfoVo vo = dao.userInfo(mId);
            mv.addObject("loginInfo", vo);
        }

        mv.setViewName("top");
        return mv;
    }

    /* 메인페이지 로드 */
    @RequestMapping(value = "/main.sc", method = RequestMethod.GET)
    public ModelAndView mainLoad(HttpServletRequest req) {
        ModelAndView mv = new ModelAndView();

        HttpSession session = req.getSession();

        mv.setViewName("main");
        return mv;
    }

    /* 사이드메뉴 */
    @RequestMapping(value = "/sidebar.sc", method = RequestMethod.GET)
    public ModelAndView sideBar(HttpServletRequest req) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = req.getSession();
        String mId = (String) session.getAttribute("session_id");
        List<StreamingVo> list = new ArrayList<StreamingVo>();

        if (mId != null) {
            list = dao.nowStreaming(mId);
        } else {
            list = dao.nowStreaming();
        }

        mv.addObject("list", list);
        mv.addObject("cnt", "3,333");
        mv.setViewName("sidebar");

        return mv;
    }

    /* 특정유저의 페이지 접속 */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ModelAndView test(HttpServletRequest req, @PathVariable String id) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = req.getSession();
        String user = (String) session.getAttribute("session_id");
        if (user != null) {
            mv.addObject("session_id", user);
            boolean check = dao.followCheck(id, user);
            if (id.equals(user)) {
                check = true;
            }
            mv.addObject("follow", check);
        }
        boolean check = dao.checkUser(id);
        if (check == false) {
            mv.setViewName("404");
        } else {
            StreamingVo vo = dao.streamInfo(id);
            if (vo == null) {
                /*방송중이 아니면 유저의 비디오페이지로 이동*/
                String redirect = "http://192.168.0.77/"+id+"/video";
                return new ModelAndView("redirect:"+redirect);
            } else {
                /*방송중이면 방송페이지로 이동*/
                mv.setViewName("./twitch_uk/stream_uk");
                mv.addObject("vo", vo);
            }
        }
        return mv;
    } // end of pagemove

    /* 도네이션 창 로드 */
    @RequestMapping(value = "/{id}/donation-view", method = RequestMethod.GET)
    public ModelAndView donationViewPage(HttpServletRequest req, @PathVariable String id) {
        ModelAndView mv = new ModelAndView();
        StreamingVo vo = dao.streamInfo(id);

        if (vo == null) {
            mv.setViewName("../404");
        } else {
            mv.addObject("mId", id);
            mv.setViewName("/donstreamer");
        }

        return mv;
    }

    /* 채팅방 표시 */
    @RequestMapping(value = "/{id}/chat-view", method = RequestMethod.GET)
    public ModelAndView chatViewPage(HttpServletRequest req, @PathVariable String id) {
        ModelAndView mv = new ModelAndView();
        StreamingVo vo = dao.streamInfo(id);
        if (vo == null) {
            mv.setViewName("../404");
        } else {
            mv.addObject("mId", id);
            mv.setViewName("/chtstreamer");
        }
        return mv;
    }

    /* 팔로워 정보 */
    @RequestMapping(value = "/{id}/followers", method = RequestMethod.GET)
    public ModelAndView follwers(HttpServletRequest req, @PathVariable String id) {
        ModelAndView mv = new ModelAndView();
        List<UserInfoVo> list = dao.followers(id);
        int r = dao.followCount(id);

        mv.addObject("cnt",r);
        mv.addObject("list", list);
        mv.setViewName("/channels");
        return mv;
    }

    /* 도네이션 출력 */
    @ResponseBody
    @RequestMapping(value = "/view-donation-list.sc", method = RequestMethod.POST)
    public String dtest(HttpServletRequest req) {
        DonationVo vo = new DonationVo();
        String mId = req.getParameter("mId");
        vo = dao.donationView(mId);
        Gson gson = new Gson();
        String json = gson.toJson(vo);
        return json;
    }

    /* 친구검색 */
    @ResponseBody
    @RequestMapping(value = "searchFriends.sc", method = RequestMethod.POST)
    public String searchFriend(HttpServletRequest req) {
        String result = "";
        String mId = req.getParameter("value");
        Gson gson = new Gson();
        result = gson.toJson(dao.findFriends(mId));

        return result;
    }

    /* 회원정보 확인 겸 로그인처리 */
    @ResponseBody
    @RequestMapping(value = "idcheck.sc")
    public String idCheck(HttpServletRequest req) {
        String flag = "false";
        String id = req.getParameter("id");
        String pwd = req.getParameter("pwd");

        Map<String, String> map = new HashMap<String, String>();
        map.put("id", id);
        map.put("pwd", pwd);
        UserInfoVo vo = dao.idcheck(map);
        if (vo != null) {
            flag = "true";
            req.getSession().setAttribute("session_id", vo.getMem_id());
        }
        return flag;
    }

    /* 로그아웃 */
    @RequestMapping(value = "logout.sc", method = RequestMethod.GET)
    public void logout(HttpServletRequest req) {
        req.getSession().removeAttribute("session_id");
    }

    /* 아이디 중복체크 */
    @ResponseBody
    @RequestMapping(value = "dupIdCheck.sc", method = RequestMethod.POST, produces = "application/json; charset=utf-8;")
    public String dupIdChecker(HttpServletRequest req) {
        int i = dao.dupIdCheck(req.getParameter("mId"));
        Gson gson = new Gson();
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("result", i);
        return gson.toJson(map);
    }

    /*팔로우 추가*/
    @RequestMapping(value = "/{id}/follow", method = RequestMethod.POST)
    public void addFollow(HttpServletRequest req, @PathVariable String id){
        String sid = req.getParameter("sid");
        int result = dao.addFollow(sid, id);
    }

    /*팔로우 삭제*/
    @RequestMapping(value = "/{id}/follow", method = RequestMethod.DELETE)
    public void deleteFollow(HttpServletRequest req, @PathVariable String id){
        String sid = req.getParameter("sid");
        int result = dao.deleteFollow(sid, id);
    }

    /*구독 체크 및 정보 전달*/
    @ResponseBody
    @RequestMapping(value = "subCheck.sc", method = RequestMethod.POST)
    public String subCheck(HttpServletRequest req){
        String result = "";
        Gson gson = new Gson();
        Map<String, Object> map = new HashMap<String, Object>();
        String sid = req.getParameter("sid");
        String uid = req.getParameter("uid");
        map.put("sid", sid);
        map.put("uid", uid);

        int r = dao.subCheck(map);
        System.out.println(r);
        if(r > 31 ){
            int money = dao.moneyCheck(map);
            map.put("money", money);
            result = gson.toJson(map);
        } else {
            result = "already";
        }

        return result;
    }

    /*구독 등록*/
    @ResponseBody
    @RequestMapping(value = "commitSub.sc", method = RequestMethod.POST)
    public String commitSub(HttpServletRequest req){
        String result = "";
        Map<String, Object> map = new HashMap<String, Object>();
        String sid = req.getParameter("sid");
        String uid = req.getParameter("uid");
        map.put("sid", sid);
        map.put("uid", uid);
        map.put("type", 3);
        int r = dao.commitSub(map);
        dao.donationInsert(map);

        return result;
    }
}
