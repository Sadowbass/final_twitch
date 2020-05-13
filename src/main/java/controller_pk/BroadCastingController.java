package controller_pk;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import bean.BroadCastingAirVo;
import bean.BroadCastingCateVo;
import bean.BroadCastingMybatisDao;

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
		
		
		for(int i=0; i<list.size(); i++) {
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
	
	@RequestMapping(value = "*/insertAir.bc", method = { RequestMethod.GET, RequestMethod.POST },produces = "application/text; charset=utf8")
	@ResponseBody
	public String insertAir(HttpServletRequest req, HttpServletResponse resp) {
		String msg = "";
		
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
		
		return msg;
		
	}
	
	
	
	@RequestMapping(value = "*/updateAir.bc", method = { RequestMethod.GET, RequestMethod.POST },produces = "application/text; charset=utf8")
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
	
	
}
