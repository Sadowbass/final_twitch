package controller;

import bean.ProductVo;
import bean.SCDao;
import com.google.gson.Gson;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class SCStoreController {

    /*메인페이지 로드*/
    @RequestMapping(value = "/store/mainPage.sc", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
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
                vo.setProduct_explain(vo.getProduct_explain().replace("\n", "").replace("\r","<br/>").replaceAll("'", "`"));
                vo.setProduct_name((vo.getProduct_name().replaceAll("'","`")));
                vo.getSysfileList().add(temp.getSysfile());
            } else if (!vo.getProduct_id().equals(temp.getProduct_id())) {
                result.add(vo);
                vo = temp;
                vo.setProduct_explain(vo.getProduct_explain().replace("\n", "").replace("\r","<br/>").replaceAll("'", "`"));
                vo.setProduct_name((vo.getProduct_name().replaceAll("'","`")));
                vo.getSysfileList().add(temp.getSysfile());
            } else {
                vo.getSysfileList().add(temp.getSysfile());
            }
        }
        if(vo != null){
            result.add(vo);
        }
        mv.addObject("result", result);
        mv.setViewName("mainPage");

        return mv;
    }

    /*상품 리스트*/
    @RequestMapping(value = "/store/productList.sc")
    public ModelAndView listPage(HttpServletRequest req){
        ModelAndView mv = new ModelAndView();
        SCDao dao = new SCDao();
        String cate = req.getParameter("cate");
        List<ProductVo> list = dao.productListControl(cate);
        Gson gson = new Gson();

        ProductVo vo = new ProductVo();
        List<ProductVo> result = new ArrayList<ProductVo>();

        for (ProductVo temp : list) {
            if (vo.getProduct_id() == null) {
                vo = temp;
                vo.setProduct_explain(vo.getProduct_explain().replace("\n", "").replace("\r","<br/>").replaceAll("'", "`"));
                vo.setProduct_name((vo.getProduct_name().replaceAll("'","`")));
                vo.getSysfileList().add(temp.getSysfile());
            } else if (!vo.getProduct_id().equals(temp.getProduct_id())) {
                result.add(vo);
                vo = temp;
                vo.setProduct_explain(vo.getProduct_explain().replace("\n", "").replace("\r","<br/>").replaceAll("'", "`"));
                vo.setProduct_name((vo.getProduct_name().replaceAll("'","`")));
                vo.getSysfileList().add(temp.getSysfile());
            } else {
                vo.getSysfileList().add(temp.getSysfile());
            }
        }
        if(vo.getSysfileList().size() > 0){
            result.add(vo);
        }
        mv.addObject("result", result);
        mv.setViewName("productList");

        return mv;
    }
}
