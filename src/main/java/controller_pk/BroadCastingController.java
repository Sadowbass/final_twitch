package controller_pk;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import bean.BroadCastingAirVo;
import bean.BroadCastingCateVo;
import bean.BroadCastingDonationVo;
import bean.BroadCastingMybatisDao;
import bean.FollowListVo;
import bean.HEDao;
import bean.MyPagePhotoUpload;
import bean.MyPageTakDao;
import bean.PaymentVo;
import bean.RouletteVo;
import bean.SCDao;
import bean.StreamerVo;
import bean.UserInfoVo;
import bean.VideoTimeCut;
import bean.friendVo;
import bean.timeCal;

@Controller
public class BroadCastingController {

   BroadCastingMybatisDao dao;

   public BroadCastingController(BroadCastingMybatisDao dao) {
      this.dao = dao;
   }

   @RequestMapping(value = "*/selectTag.bc", method = { RequestMethod.GET, RequestMethod.POST })
   @ResponseBody
   public String selectTag() {
      List<String> list = dao.selectTag();
      Gson gson = new Gson();

      return gson.toJson(list);
   }

   @RequestMapping(value = "*/selectCate.bc", method = { RequestMethod.GET, RequestMethod.POST })
   @ResponseBody
   public String selectCate() {

      List<BroadCastingCateVo> list = dao.selectCate();
      String result = "";
      Gson gson = new Gson();
      JsonObject jsonObject = null;
      JsonArray jsonArray = new JsonArray();

      for (int i = 0; i < list.size(); i++) {
         jsonObject = new JsonObject();
         jsonObject.addProperty("cat_gname", list.get(i).getCat_gname());
         jsonObject.addProperty("cat_genre", list.get(i).getCat_genre());
         jsonObject.addProperty("cat_orifile", list.get(i).getCat_orifile());
         jsonObject.addProperty("cat_sysfile", list.get(i).getCat_sysfile());
         jsonArray.add(jsonObject);

      }

      result = gson.toJson(jsonArray);
      return result;

   }

   @RequestMapping(value = "/selectCate.bc", method = { RequestMethod.GET, RequestMethod.POST })
   @ResponseBody
   public String selectCate2() {

      List<BroadCastingCateVo> list = dao.selectCate();
      String result = "";
      Gson gson = new Gson();
      JsonObject jsonObject = null;
      JsonArray jsonArray = new JsonArray();

      for (int i = 0; i < list.size(); i++) {
         jsonObject = new JsonObject();
         jsonObject.addProperty("cat_gname", list.get(i).getCat_gname());
         jsonObject.addProperty("cat_genre", list.get(i).getCat_genre());
         jsonObject.addProperty("cat_orifile", list.get(i).getCat_orifile());
         jsonObject.addProperty("cat_sysfile", list.get(i).getCat_sysfile());
         jsonArray.add(jsonObject);

      }

      result = gson.toJson(jsonArray);
      return result;

   }

   @RequestMapping(value = "*/insertAir.bc", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView insertAir(HttpServletRequest req, HttpServletResponse resp) {
      String msg = "";
      ModelAndView mv = new ModelAndView();
      String mId = req.getParameter("mId"); // 스트리머 아이디
      String title = req.getParameter("broadCastingTitle"); // 제목
      String content = req.getParameter("broadCastingContent"); // 내용
      String sKey = req.getParameter("streamKey"); // 스트림 키
      String tags = req.getParameter("tags"); // 태그 들
      String gameName = req.getParameter("gameName"); // 게임 이름


      BroadCastingAirVo vo = new BroadCastingAirVo();

      vo.setAir_mid(mId);
      vo.setAir_subject(title);
      vo.setAir_content(content);
      vo.setMem_skey(sKey);
      vo.setAir_tnames(tags);
      vo.setAir_gname(gameName);

      msg = dao.startAir(vo);
      if (msg.equals("성공")) {
         mv.setViewName("video_tak");
      } else if (msg.equals("실패")) {
         mv.setViewName("video_tak2");
      }
      mv.addObject("sKey", sKey);
      mv.addObject("msg", msg);

      return mv;

   }

   @RequestMapping(value = "*/updateAir.bc", method = { RequestMethod.GET,
         RequestMethod.POST }, produces = "application/text; charset=utf8")
   @ResponseBody
   public String updateAir(HttpServletRequest req, HttpServletResponse resp) {
      String msg = "";
      String mId = req.getParameter("mId"); // 스트리머 아이디
      String title = req.getParameter("broadCastingTitle"); // 제목
      String content = req.getParameter("broadCastingContent"); // 내용
      String tags = req.getParameter("tags"); // 태그 들
      String gameName = req.getParameter("gameName"); // 게임 이름

      BroadCastingAirVo vo = new BroadCastingAirVo();

      vo.setAir_mid(mId);
      vo.setAir_subject(title);
      vo.setAir_content(content);
      vo.setAir_tnames(tags);
      vo.setAir_gname(gameName);

      msg = dao.updateAir(vo);
      return msg;

   }

   @RequestMapping(value = "*/deleteAir.bc", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView deleteAir(HttpServletRequest req, HttpServletResponse resp) {
      ModelAndView mv = new ModelAndView();
      String msg = "";
      String mId = req.getParameter("mId"); // 스트리머 아이디
      String sKey = req.getParameter("streamKey"); // 스트림 키
      String gameName = req.getParameter("gameName");
       System.out.println(gameName+"321");

       msg = dao.deleteAir(mId, sKey, gameName);

      if (msg.equals("중지성공")) {
         mv.setViewName("video_tak");
      } else if (msg.equals("중지실패")) {
         mv.setViewName("video_tak2");
      }
      mv.addObject("sKey", sKey);
      mv.addObject("msg", msg);
      return mv;

   }

   @RequestMapping(value = "*/selectDonation.bc", method = { RequestMethod.GET,
         RequestMethod.POST }, produces = "application/text; charset=utf8")
   @ResponseBody
   public String selectDonation(HttpServletRequest req, HttpServletResponse resp) {
      String result = "";
      String mId = req.getParameter("mId"); // 스트리머 아이디
      List<BroadCastingDonationVo> list = dao.selectDonation(mId);

      Gson gson = new Gson();
      JsonObject jsonObject = null;
      JsonArray jsonArray = new JsonArray();

      if (list.size() > 0) {
         for (int i = 0; i < list.size(); i++) {
            jsonObject = new JsonObject();
            jsonObject.addProperty("don_serial", list.get(i).getDon_serial());
            jsonObject.addProperty("don_mid", list.get(i).getDon_mid());
            jsonObject.addProperty("don_oid", list.get(i).getDon_oid());
            jsonObject.addProperty("don_price", list.get(i).getDon_price());
            jsonObject.addProperty("don_rdate", list.get(i).getDon_rdate());
            jsonObject.addProperty("don_push", list.get(i).getDon_push());
            jsonObject.addProperty("don_content", list.get(i).getDon_content());
            jsonObject.addProperty("url", list.get(i).getUrl());
            jsonObject.addProperty("type", list.get(i).getType());
            jsonArray.add(jsonObject);

         }
         result = gson.toJson(jsonArray);
      }

      return result;

   }
   	   @RequestMapping(value = "*/selectFollow.bc", method = { RequestMethod.GET,
	         RequestMethod.POST }, produces = "application/text; charset=utf8")
	   @ResponseBody
	   public String selectFollow(HttpServletRequest req, HttpServletResponse resp) {
	      String mId = req.getParameter("mId"); // 스트리머 아이디
	      int result = dao.selectFollow(mId);

	      Gson gson = new Gson();
	      JsonObject jsonObject = new JsonObject();
	      jsonObject.addProperty("result", result);
	      String json = gson.toJson(jsonObject);

	      return json;

	   }



   	   @RequestMapping(value = "*/selectFollowList.bc", method = { RequestMethod.GET,
  	         RequestMethod.POST }, produces = "application/text; charset=utf8")
  	   public ModelAndView selectFollowList(HttpServletRequest req, HttpServletResponse resp) {
  	      String mId = req.getParameter("mId"); // 스트리머 아이디
  	      ModelAndView mv = new ModelAndView();
  	      List<FollowListVo> list = dao.selectFollowList(mId);
  	      mv.addObject("list",list);
  	      mv.setViewName("followView");

  	      return mv;

  	   }




   @RequestMapping(value = "*/sendDonation.bc", method = { RequestMethod.GET,
         RequestMethod.POST }, produces = "application/text; charset=utf8")
   @ResponseBody
   public String sendDonation(HttpServletRequest req, HttpServletResponse resp) {
      String result = "";
      String serial = req.getParameter("serial"); // 스트리머 아이디
      result = dao.sendDonation(Integer.parseInt(serial));

      return result;

   }

   @RequestMapping(value = "*/selectRoulette.bc", method = { RequestMethod.GET,
         RequestMethod.POST }, produces = "application/text; charset=utf8")
   @ResponseBody
   public String selectRoulette(HttpServletRequest req, HttpServletResponse resp) {
      String result = "조회실패";
      String mId = req.getParameter("mId"); // 스트리머 아이디
      RouletteVo vo = dao.selectRoulette(mId);
      Gson gson = new Gson();
      JsonObject jsonObject = null;
      JsonArray jsonArray = new JsonArray();

      if (vo != null) {
         jsonObject = new JsonObject();
         jsonObject.addProperty("rul_serial", vo.getRul_serial());
         jsonObject.addProperty("rul_mid", vo.getRul_mId());
         jsonObject.addProperty("rul_data", vo.getRul_data());
         jsonObject.addProperty("rul_result", "성공");

         jsonArray.add(jsonObject);

         result = gson.toJson(jsonArray);
      } else {
         jsonObject = new JsonObject();
         jsonObject.addProperty("rul_result", "실패");
         jsonArray.add(jsonObject);
         result = gson.toJson(jsonArray);
      }
      return result;
   }

   @RequestMapping(value = "*/saveRoulette.bc", method = { RequestMethod.GET,
         RequestMethod.POST }, produces = "application/text; charset=utf8")
   @ResponseBody
   public String saveRoulette(HttpServletRequest req, HttpServletResponse resp) {
      String result = "";
      String mId = req.getParameter("mId");
      String rul1 = req.getParameter("rul1");
      String rul2 = req.getParameter("rul2");
      String rul3 = req.getParameter("rul3");
      String rul4 = req.getParameter("rul4");
      String rul5 = req.getParameter("rul5");
      String flagRul = req.getParameter("flagRul");
      String data = rul1 + "," + rul2 + "," + rul3 + "," + rul4 + "," + rul5;
      List<String> list = new ArrayList<String>();
      StringTokenizer tokens = new StringTokenizer(data, ",");
      while (tokens.hasMoreElements()) {
         list.add(tokens.nextToken().trim());

      }

      String rouletteData = list.toString();
      String newRouletteData = rouletteData.substring(1, rouletteData.length() - 1);
      result = dao.saveRoulette(mId, newRouletteData, flagRul);

      return result;

   }

   @RequestMapping(value = "*/deleteRoulette.bc", method = { RequestMethod.GET,
         RequestMethod.POST }, produces = "application/text; charset=utf8")
   @ResponseBody
   public String deleteRoulette(HttpServletRequest req, HttpServletResponse resp) {
      String result = "";
      String mId = req.getParameter("mId");
      result = dao.deleteRoulette(mId);
      return result;

   }

   @RequestMapping(value = "*/imageCut.bc", method = { RequestMethod.GET,
         RequestMethod.POST }, produces = "application/text; charset=utf8")
   @ResponseBody
   public String imageCut(HttpServletRequest req, HttpServletResponse resp) {
      String result = "";
      String mId = req.getParameter("mId");
      String sKey = req.getParameter("sKey");
      String time = req.getParameter("duration1");
      timeCal tc = new timeCal();
      String timeResult = tc.getHHMMSS(Integer.parseInt(time));
      VideoTimeCut cut = new VideoTimeCut();
      cut.thumbnail(sKey, timeResult);
      result = dao.imageCut(mId, sKey);

      return result;

   }


   	   @RequestMapping(value = "*/initUser.bc", method = { RequestMethod.GET,
	         RequestMethod.POST }, produces = "application/text; charset=utf8")
	   @ResponseBody
	   public String initUser(HttpServletRequest req, HttpServletResponse resp) {
	      String result = "";
	      String mId = req.getParameter("mId");
	      UserInfoVo vo = dao.initUser(mId);
	      Gson gson = new Gson();
	      result = gson.toJson(vo);
	      System.out.println(result);

	      return result;

	   }



   @RequestMapping(value = "*/selectAir.bc", method = { RequestMethod.GET,
	         RequestMethod.POST }, produces = "application/text; charset=utf8")
	   @ResponseBody
	   public String selectAir(HttpServletRequest req, HttpServletResponse resp) {
	      String result = "";
	      Gson gson = new Gson();
	      JsonObject jsonObject = null;
	      JsonArray jsonArray = new JsonArray();
	      String mId = req.getParameter("mId");
	      BroadCastingAirVo vo = dao.selectAir(mId);
	      if(vo == null) {
	          jsonObject = new JsonObject();
	          jsonObject.addProperty("result", "실패");
	          result = gson.toJson(jsonArray);
	      }else {
	          jsonObject = new JsonObject();
	          jsonObject.addProperty("air_subject", vo.getAir_subject());
	          jsonObject.addProperty("air_content", vo.getAir_content());
	          jsonObject.addProperty("air_gname", vo.getAir_gname());
	          jsonObject.addProperty("air_tnames", vo.getAir_tnames());
	          jsonObject.addProperty("mem_skey", vo.getMem_skey());
	          jsonObject.addProperty("cat_sysfile", vo.getCat_sysfile());
	          jsonObject.addProperty("cat_genre", vo.getCat_genre());
	          jsonObject.addProperty("air_starttime", vo.getAir_starttime());
	          jsonObject.addProperty("result", "성공");

	          jsonArray.add(jsonObject);

	          result = gson.toJson(jsonArray);
	      }

	      return result;

	   }



   @RequestMapping(value = "*/initAir.bc", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView initAir(HttpServletRequest req, HttpServletResponse resp) {
      String msg = "init성공";
      ModelAndView mv = new ModelAndView();
      String sKey = req.getParameter("sKey"); // 스트리머 아이디

      mv.setViewName("video_tak");

      mv.addObject("sKey", sKey);
      mv.addObject("msg", msg);

      return mv;

   }
   @RequestMapping(value = "*/broadCastingTime.bc", method = { RequestMethod.GET,
	         RequestMethod.POST }, produces = "application/text; charset=utf8")
	   @ResponseBody
	   public String broadCastingTime(HttpServletRequest req, HttpServletResponse resp) {
	      String result = "";
	      long time = System.currentTimeMillis();
	      SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss");
	      result = sdf.format(new Date(time));

	      return result;

	   }
   
   // 마이페이지 --------------------------------------------------------------------------------------------------


   @RequestMapping(value = "/userInit.bc", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView userInit(HttpServletRequest req, HttpServletResponse resp) {
      ModelAndView mv = new ModelAndView();
      String mId = req.getParameter("mId"); // 회원 아이디
      MyPageTakDao dao = new MyPageTakDao();
      UserInfoVo vo = dao.userInit(mId);
      
      mv.addObject("vo", vo);
      mv.setViewName("./mypage/userPageMenu1");

      return mv;

   }
   
   
   @RequestMapping(value = "/paymentInit.bc", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView paymentInit(HttpServletRequest req, HttpServletResponse resp) {
      ModelAndView mv = new ModelAndView();
      String mId = req.getParameter("mId"); // 회원 아이디
      List<PaymentVo> list = null;
      MyPageTakDao dao = new MyPageTakDao();
      list = dao.paymentInit(mId);
      
      List<StreamerVo> list2 = new ArrayList<StreamerVo>();
      list2 =this.dao.user_payment(mId);
     
      mv.addObject("payment",list2);//결제 금액 차트 정보
      mv.addObject("list", list);
      mv.setViewName("./mypage/userPageMenu4");

      return mv;

   }
   
   @RequestMapping(value = "/donationInit.bc", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView donationInit(HttpServletRequest req, HttpServletResponse resp) {
      ModelAndView mv = new ModelAndView();
      String mId = req.getParameter("mId"); // 회원 아이디
      List<BroadCastingDonationVo> list = null;
      MyPageTakDao dao = new MyPageTakDao();
      list = dao.donationInit(mId);
      
      List<StreamerVo> list2 = new ArrayList<StreamerVo>();
      list2 =this.dao.send_dontion(mId);
     
      mv.addObject("send_list",list2);//보낸 도네 차트 정보
      mv.addObject("list", list);
      mv.setViewName("./mypage/userPageMenu2");

      return mv;

   }
   
   @RequestMapping(value = "/donation2Init.bc", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView donation2Init(HttpServletRequest req, HttpServletResponse resp) {
      ModelAndView mv = new ModelAndView();
      String mId = req.getParameter("mId"); // 회원 아이디
      List<BroadCastingDonationVo> list = null;
      MyPageTakDao dao = new MyPageTakDao();
      list = dao.donation2Init(mId);
      
      List<StreamerVo> list3 = new ArrayList<StreamerVo>();
      list3 = this.dao.receive_dontion(mId);
      
      mv.addObject("receive_list", list3);//받은 도네 차트 정보 
      
      mv.addObject("list", list);
      mv.setViewName("./mypage/userPageMenu3");

      return mv;

   }
   
   
   
   
   	   @RequestMapping(value = "/insertCoin.bc", method = { RequestMethod.GET,
	         RequestMethod.POST }, produces = "application/text; charset=utf8")
	   @ResponseBody
	   public String insertCoin(HttpServletRequest req, HttpServletResponse resp) {
	      String result = "";
	      String mId = req.getParameter("mId");
	      int money = Integer.parseInt(req.getParameter("money"));
	      MyPageTakDao dao = new MyPageTakDao();
	      result = dao.insertCoin(mId, money);
	      
	      return result;

	   }
   	   
   	   
   	   @RequestMapping(value = "/followDelete.bc", method = { RequestMethod.GET,
  	         RequestMethod.POST }, produces = "application/text; charset=utf8")
  	   @ResponseBody
  	   public String followDelete(HttpServletRequest req, HttpServletResponse resp) {
  	      String result = "";
  	      String mId = req.getParameter("mId");
  	      String oId = req.getParameter("oId");
  	      
  	      MyPageTakDao dao = new MyPageTakDao();
  	      
  	      result = dao.followDelete(mId,oId);

  	      return result;

  	   }
   	   
   	   @RequestMapping(value = "/friendDelete.bc", method = { RequestMethod.GET,
    	         RequestMethod.POST }, produces = "application/text; charset=utf8")
    	   @ResponseBody
    	   public String friendDelete(HttpServletRequest req, HttpServletResponse resp) {
    	      String result = "";
    	      String mId = req.getParameter("mId");
    	      String oId = req.getParameter("oId");
    	      
    	      MyPageTakDao dao = new MyPageTakDao();
    	      
    	      result = dao.friendDelete(mId,oId);

    	      return result;

    	   }
   	   
   	   @RequestMapping(value = "/selectFriends.bc", method = { RequestMethod.GET,
    	         RequestMethod.POST }, produces = "application/json; charset=utf8")
    	   @ResponseBody
    	   public String selectFriends(HttpServletRequest req, HttpServletResponse resp) {
           Gson gson = new Gson();
           List<friendVo> list = new ArrayList<friendVo>();
           MyPageTakDao dao = new MyPageTakDao();
           String mId = req.getParameter("mId");
           int rno = 0;
           if (req.getParameter("rno")!=null) {
               rno = Integer.parseInt(req.getParameter("rno"));
           }

           if(req.getParameter("rno") == null){
               list = dao.selectFriends(mId);
           } else {
               list = dao.selectFriends(mId, rno);
           }

           return gson.toJson(list);

    	   }
   	   
   	   
   	   @RequestMapping(value = "/pwdCheck.bc", method = { RequestMethod.GET,
  	         RequestMethod.POST }, produces = "application/text; charset=utf8")
  	   @ResponseBody
  	   public String pwdCheck(HttpServletRequest req, HttpServletResponse resp) {
  	      String result = "";
  	      int r = 0;
  	      String mId = req.getParameter("mId");
  	      String pwd = req.getParameter("pwd");
  	      MyPageTakDao dao = new MyPageTakDao();
  	      r = dao.pwdCheck(mId, pwd);
  	      if(r == 0) {
  	    	  result = "실패";
  	      }else if(r == 1) {
  	    	result = "성공";
  	      }
  	    
  	      
  	      return result;

  	   }
   	   
   	   
   	   @RequestMapping(value = "/nameCheck.bc", method = { RequestMethod.GET,
    	         RequestMethod.POST }, produces = "application/text; charset=utf8")
    	   @ResponseBody
    	   public String nameCheck(HttpServletRequest req, HttpServletResponse resp) {
    	      String result = "";
    	      int r = 0;
    	      String name = req.getParameter("name");
    	      String mId = req.getParameter("mId");
    	      MyPageTakDao dao = new MyPageTakDao();
    	      r = dao.nameCheck(name,mId);
    	      if(r == 0) {
    	    	  result = "성공";
    	      }else if(r > 0) {
    	    	result = "실패";
    	      }
    	    
    	      return result;

    	   }
   	   
   	   @RequestMapping(value = "/updatePwd.bc", method = { RequestMethod.GET,
    	         RequestMethod.POST }, produces = "application/text; charset=utf8")
    	   @ResponseBody
    	   public String updatePwd(HttpServletRequest req, HttpServletResponse resp) {
    	      String result = "";
    	      int r = 0;
    	      String mId = req.getParameter("mId");
    	      String pwd = req.getParameter("pwd");
    	      MyPageTakDao dao = new MyPageTakDao();
    	      r = dao.updatePwd(mId, pwd);
    	      if(r == 0) {
    	    	  result = "실패";
    	      }else if(r == 1) {
    	    	result = "성공";
    	      }
    	    
    	      return result;

    	   }
   	   
   	   @RequestMapping(value = "/updateProfill.bc", method = { RequestMethod.GET,
  	         RequestMethod.POST }, produces = "application/text; charset=utf8")
  	   @ResponseBody
  	   public String updateProfill(HttpServletRequest req, HttpServletResponse resp) {
  	      String result = "";
  	      int r = 0;
  	      
  	      MyPageTakDao dao = new MyPageTakDao();
  	      MyPagePhotoUpload upload = new MyPagePhotoUpload(req, resp);
  	      UserInfoVo vo = upload.uploading();
  	      r = dao.updateProfill(vo);
  	      
  	      
  	      if(r == 0) {
  	    	  result = "실패";
  	      }else if(r == 1) {
  	    	result = "성공";
  	      }
  	    
  	      return result;

  	   }
   

}
