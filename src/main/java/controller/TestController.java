package controller;

import bean.ProductVo;
import bean.SCDao;
import com.google.gson.Gson;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class TestController {

    @RequestMapping(value = "/store/test.sc", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public ModelAndView listControl() {
        ModelAndView mv = new ModelAndView();
        SCDao dao = new SCDao();
        List<ProductVo> list = dao.productListControl();
        Gson gson = new Gson();

        ProductVo vo = new ProductVo();
        List<ProductVo> result = new ArrayList<ProductVo>();

        for (ProductVo temp : list) {
            if (vo.getProduct_id() == null) {
                vo = temp;
                vo.getSysfileList().add(temp.getSysfile());
            } else if (!vo.getProduct_id().equals(temp.getProduct_id())) {
                result.add(vo);
                vo = temp;
                vo.getSysfileList().add(temp.getSysfile());
            } else {
                vo.getSysfileList().add(temp.getSysfile());
            }
        }

        mv.addObject("result", result);
        mv.setViewName("mainPage");

        return mv;
    }
}
