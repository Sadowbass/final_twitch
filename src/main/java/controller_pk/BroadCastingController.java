package controller_pk;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

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
		System.out.println(gson.toJson(list));
		return gson.toJson(list);
	}

	
	@RequestMapping(value = "*/selectCate.bc", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String selectCate() {
		System.out.println("컨트롤러 찾음");
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
	
}
