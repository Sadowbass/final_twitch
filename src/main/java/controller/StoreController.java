package controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.StoreMybatisDao;
import store.StoreReviewVo;




@Controller
public class StoreController {
	
	ServletContext c;
	
	StoreMybatisDao dao;
	
    public StoreController(StoreMybatisDao dao) {
    	System.out.println("storedao입성");
	 this.dao = dao;
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
	public ModelAndView reviewInsert(HttpServletRequest req, HttpServletResponse resp) {
    	
		System.out.println("리뷰입력");
    	ModelAndView mv = new ModelAndView();
    	
    	//FileUpload
    	//ServletContext c;
    	// c.getRealPath("상대경로") 를 통해 파일을 저장할 절대 경로를 구해온다.
	    // 운영체제 및 프로젝트가 위치할 환경에 따라 경로가 다르기 때문에 아래처럼 구해오는게 좋음
    	
	    String uploadPath = req.getSession().getServletContext().getRealPath("/store/reviewimages");
	     //String uploadPath = "C:\\Users\\silve\\eclipse-workspace\\final_twitch\\WebContent\\store\\reviewimages";
	    System.out.println(uploadPath);
	    
	    /*
		 * uploadFile : 경로 maxSize : 크기 제한 설정 encoding: 인코딩 타입 설정 new
		 * DefaultFileRenamePolicy(); 동일한 이름일 경우 자동으로 (1),(2) 붙게 해줌
		 */ 
	    
	    
	    int maxSize =1024 *1024 *10;// 한번에 올릴 수 있는 파일 용량 : 10M로 제한
	    
	    String mId = "";
	    int pId;
	    String rContent ="";
	    String rSubject ="";
	    Double rLike;
	    
	     
	    String image1 ="";// 중복처리된 이름
	    String image2 ="";// 중복 처리전 실제 원본 이름
	    long fileSize =0;// 파일 사이즈
	    String fileType ="";// 파일 타입
	    String encoding = "utf-8";
	     
	    MultipartRequest multi =null;
	    
	    StoreMybatisDao dao = new StoreMybatisDao();
	    StoreReviewVo vo;
	    List<StoreReviewVo> list = new ArrayList<StoreReviewVo>();
	
	     
	    try{
	    	
	    	
	        // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
	        multi =new MultipartRequest(req,uploadPath,maxSize,encoding,new DefaultFileRenamePolicy());
	        
	        // form내의 input name="mId" 인 녀석 value를 가져옴
	        mId = multi.getParameter("mId");
	        // form내의 input name="pId" 인 녀석 value를 가져옴
	        pId = Integer.parseInt(multi.getParameter("pId"));
	        // form내의 input name="rContent" 인 녀석 value를 가져옴
	        rContent = multi.getParameter("rContent");
	        // name="rSubject" 인 녀석 value를 가져옴
	        rSubject = multi.getParameter("rSubject");
	     // name="rLike" 인 녀석 value를 가져옴
	        rLike = Double.parseDouble(multi.getParameter("rLike"));
	        
	        System.out.println(mId);
	        
	        // 전송한 전체 파일이름들을 가져옴
	        Enumeration files = multi.getFileNames();
	        
	        
	        
	        while(files.hasMoreElements()){
	            // form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
	            String file1 = (String)files.nextElement();// 파일 input에 지정한 이름을 가져옴
	            // 그에 해당하는 실재 파일 이름을 가져옴
	           image2 = multi.getOriginalFileName(file1);
	            // 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
	            // 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
	            image1 = multi.getFilesystemName(file1);
	            // 파일 타입 정보를 가져옴
	            fileType = multi.getContentType(file1);
	            // input file name에 해당하는 실재 파일을 가져옴
	            File file = multi.getFile(file1);
	            // 그 파일 객체의 크기를 알아냄
	            fileSize = file.length();
	            
	            vo = new StoreReviewVo(mId, pId, rSubject, rContent, image1, image2, rLike);
	            list.add(vo);
	            
	       
	            
	            
	            String msg = dao.insertReview(list);
	        }
	    }catch(Exception e){
	        e.printStackTrace();
	    }
    	
    	

    	mv.setViewName("productDetail");
    	
    	System.out.println(req.getRequestURI());
    	return mv;
    }
	
	@RequestMapping(value="/store/productList.str",  method={ RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productSlecet() {
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

	
}
