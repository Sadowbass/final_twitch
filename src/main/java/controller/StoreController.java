package controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;


import bean.StoreMybatisDao;

import store.StoreReviewPhotoVo;
import store.StoreReviewVo;




@Controller
public class StoreController {
	
	ServletContext c;
	
	StoreMybatisDao dao;
	
    public StoreController(StoreMybatisDao dao) {
    	System.out.println("storedao입성");
	 this.dao = dao;
	}
    
	@RequestMapping(value="/store/productList.str",  method={ RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productSelect() {
    	System.out.println("들어왔다 컨트롤러........................1");
       	ModelAndView mv = new ModelAndView();
     	try {
	    	
			mv.setViewName("productList");
	    	System.out.println(mv + ".......................1");

		}catch(Exception ex) {
			ex.printStackTrace();
		}
    	return mv;
    }


    @RequestMapping(value="/store/productDetail.str", method={ RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productView(HttpServletRequest req) {
    	System.out.println("pd.....");
		
    	ModelAndView mv = new ModelAndView();
    	
    	//System.out.println(mv);
		mv.setViewName("productDetail");
		
	 	System.out.println(req.getRequestURI());
		
    	return mv;
    }
	
	@RequestMapping(value="/store/reviewInsert.str", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reviewInsert(MultipartHttpServletRequest req) {
    	
		System.out.println("리뷰입력");
    	ModelAndView mv = new ModelAndView();
    	
    	//FileUpload
    	//ServletContext c;
    	// c.getRealPath("상대경로") 를 통해 파일을 저장할 절대 경로를 구해온다.
	    // 운영체제 및 프로젝트가 위치할 환경에 따라 경로가 다르기 때문에 아래처럼 구해오는게 좋음
    	
	    String uploadPath = req.getSession().getServletContext().getRealPath("/store/reviewimages/");
	     //String uploadPath = "C:\\Users\\silve\\eclipse-workspace\\final_twitch\\WebContent\\store\\reviewimages";
	    System.out.println(uploadPath);
	    
	    File dir = new File(uploadPath);
        if (!dir.isDirectory()) {
            dir.mkdirs();
        }

	    /*
		 * uploadFile : 경로 maxSize : 크기 제한 설정 encoding: 인코딩 타입 설정 new
		 * DefaultFileRenamePolicy(); 동일한 이름일 경우 자동으로 (1),(2) 붙게 해줌
		 */ 
	    
	    //int maxSize =1024 *1024 *10;// 한번에 올릴 수 있는 파일 용량 : 10M로 제한
	    
	    String mId = "";
	    int pId;
	    String rContent ="";
	    String rSubject ="";
	    Double rLike;
	         
	    String image1 ="";// 중복처리된 이름
	    String image2 ="";// 중복 처리전 실제 원본 이름
	    long fileSize =0;// 파일 사이즈
	   // String fileType ="";// 파일 타입
	    //String encoding = "utf-8";
	  
    
	    StoreMybatisDao dao = new StoreMybatisDao();
	    StoreReviewVo vo;
	    StoreReviewPhotoVo rpVo;
	    List<StoreReviewPhotoVo> list = new ArrayList<StoreReviewPhotoVo>();
		     
	    try{
	    	    	
	        // form내의 input name="mId" 인 녀석 value를 가져옴
	        mId = req.getParameter("mId");
	        // form내의 input name="pId" 인 녀석 value를 가져옴
	        pId = Integer.parseInt(req.getParameter("pId"));
	        // form내의 input name="rContent" 인 녀석 value를 가져옴
	        rContent = req.getParameter("rContent");
	        // name="rSubject" 인 녀석 value를 가져옴
	        rSubject = req.getParameter("rSubject");
	     // name="rLike" 인 녀석 value를 가져옴
	        rLike = Double.parseDouble(req.getParameter("rLike"));
	        
	        System.out.println(pId);
	        
	        vo = new StoreReviewVo(mId, pId, rSubject, rContent, rLike);
	        
	        // 전송한 전체 파일이름들을 가져옴
	        List<MultipartFile> mf = req.getFiles("reviewFile");

	        if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
	             
	        } else {
	            for (int i = 0; i < mf.size(); i++) {
	                // 파일 중복명 처리
	               String nnName = UUID.randomUUID().toString();
	                // 본래 파일명
	                image2 = mf.get(i).getOriginalFilename();
	                 //중복처리된 이름
	                image1 = nnName + "." + getExtension(image2);

	                fileSize = mf.get(i).getSize(); // 파일 사이즈
	                
	                String savePath = uploadPath + image1; // 저장 될 파일 경로
	 
	                mf.get(i).transferTo(new File(savePath)); // 파일 저장
	                
	                rpVo = new StoreReviewPhotoVo(image1, image2);
	 
	                list.add(rpVo);
	            }

	        	 String msg = dao.insertReview(vo, list);
	        }
	    }catch(Exception e){
	        e.printStackTrace();
	    }
    	
    	mv.setViewName("productDetail");
    	
    	System.out.println(req.getRequestURI());
    	return mv;
    }
	
	
	
	private String getExtension(String image2) {
		String mm = "jpg";
		// TODO Auto-generated method stub
		return mm ;
	}

	@ResponseBody
	@RequestMapping(value="/store/reviewSelect.str",  method={ RequestMethod.GET, RequestMethod.POST }, produces="application/json; charset=utf-8")
	public String reviewSelect(HttpServletRequest req) {
		
        
        String result = "";
     
        Gson gson = new Gson();
      
        List<StoreReviewVo> list = dao.reviewSelect();
        result = gson.toJson(list);
        
        
        System.out.println("reviewselectsdsdasa");
        
        
		
    	return result;
    }
	
	@RequestMapping(value="/store/reviewDelete.str", method= {RequestMethod.POST})
	public ModelAndView reviewDelete(HttpServletRequest req) {
    	
		ModelAndView mv = new ModelAndView();
    	
    	StoreReviewVo vo = new StoreReviewVo();
    	StoreReviewPhotoVo vo2 = new StoreReviewPhotoVo();
    	
    	List<StoreReviewPhotoVo> list = new ArrayList<StoreReviewPhotoVo>();
    	
    	int review_id = Integer.parseInt(req.getParameter("review_id"));
    
		
		vo.setReview_id(review_id);
		vo2.setReview_id(review_id);
		list.add(vo2);
    	
    	String msg = dao.reviewDelete(vo,list);
    	
	
    	mv.addObject("msg", msg);
		mv.setViewName("productList");
    	
    	return mv;
    }
	
	

	
	
}
