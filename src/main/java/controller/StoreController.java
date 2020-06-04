package controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import bean.ProductPhoto_mh;
import bean.ProductVo;
import bean.SCDao;
import bean.StoreCartDao;
import bean.StoreCartServiceif;
import bean.StoreCartServiceDao;
import bean.StoreCartVo;
import bean.StoreFaqVo;
import bean.StoreMember;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.resource.CachingResourceTransformer;

import com.google.gson.Gson;


import bean.StoreMybatisDao;
import bean.StoreOrderDetailVo;
import bean.StoreOrderVo;
import bean.StoreReviewPhotoVo;
import bean.StoreReviewVo;




@Controller
public class StoreController {
	
	@Inject
	StoreCartServiceif cartservice;
	
	ServletContext c;
	
	StoreMybatisDao dao;
	
    public StoreController(StoreMybatisDao dao, StoreCartServiceDao csdao, StoreCartDao cdao) {
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
    	ModelAndView mv = new ModelAndView();
		SCDao dao = new SCDao();
		String pId = req.getParameter("pid");

		ProductVo vo = dao.productDetail(pId);
		vo.setProduct_explain(vo.getProduct_explain().replace("\n","").replace("\r","<br/>"));
		mv.addObject("vo",vo);
		mv.setViewName("productDetail");
		dao.close();
    	return mv;
    }
	
	@RequestMapping(value="/store/reviewInsert.str", method= {RequestMethod.GET, RequestMethod.POST})
	public String reviewInsert(MultipartHttpServletRequest req) {
    	
		System.out.println("리뷰입력");
    	
    	
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
 
	    
	    //int maxSize =1024 *1024 *10;// 한번에 올릴 수 있는 파일 용량 : 10M로 제한
	    
	    String mem_id = "";
	    int product_id;
	    String rContent ="";
	    String rSubject ="";
	    Double review_like;
	         
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
	        mem_id = req.getParameter("mId");
	        // form내의 input name="pId" 인 녀석 value를 가져옴
	        product_id = Integer.parseInt(req.getParameter("pId"));
	        // form내의 input name="rContent" 인 녀석 value를 가져옴
	        rContent = req.getParameter("rContent");
	        // name="rSubject" 인 녀석 value를 가져옴
	        rSubject = req.getParameter("rSubject");
	     // name="rLike" 인 녀석 value를 가져옴
	        review_like = Double.parseDouble(req.getParameter("rLike"));
	        
	        System.out.println(product_id);
	        
	        vo = new StoreReviewVo(mem_id, product_id, rSubject, rContent, review_like);
	        
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
    	
    	
    	
    	System.out.println(req.getRequestURI());
    	return "redirect:/store/productDetail.str";
    }

	private String getExtension(String image2) {
		String mm = "jpg";
		// TODO Auto-generated method stub
		return mm ;
	}

	@ResponseBody
	@RequestMapping(value="/store/reviewSelect.str",  method={ RequestMethod.GET, RequestMethod.POST }, produces = "application/json; charset=utf-8")
	public String reviewSelect(HttpServletRequest req) {
       int p =0;
       String result = "";
       String pid = req.getParameter("product_id");
       List<StoreReviewVo> list = dao.reviewSelect(pid);
		Gson gson = new Gson();
		result = gson.toJson(list);

       return result;
    }
	
	@RequestMapping(value="/store/reviewDelete.str", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reviewDelete(HttpServletRequest req) {
    	
		ModelAndView mv = new ModelAndView();
    	
		System.out.println("delete");
    	StoreReviewVo vo = new StoreReviewVo();
    	StoreReviewPhotoVo vo2 = new StoreReviewPhotoVo();
    	
    	List<StoreReviewPhotoVo> list = new ArrayList<StoreReviewPhotoVo>();
    	
    	int review_id = Integer.parseInt(req.getParameter("review_id"));
       
		
		vo.setReview_id(review_id);
		vo2.setReview_id(review_id);
		list.add(vo2);
    	
    	String msg = dao.reviewDelete(vo,list);
    	
    	
	
    	mv.addObject("msg", msg);
		mv.setViewName("productDetail");
    	
    	return mv;
    }
	
	
	@RequestMapping(value="/store/faq.str", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView faq(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		List<StoreFaqVo> list = dao.faqSelect();
		
		String url = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort();
		System.out.println(url);
		
		mv.addObject("list", list);
		mv.setViewName("qna");
		return mv;
	}
	
	//장바구니 인서트
	
	@RequestMapping(value="/store/addToCart.str", method= {RequestMethod.GET, RequestMethod.POST})
	public String addToCart(HttpServletRequest req, HttpSession session) {
		
		
	    System.out.println("addCart 들어았다");
		//String mem_id = (String)session.getAttribute("mem_id");
		String mem_id ="sliver";
		int product_id = Integer.parseInt(req.getParameter("product_id"));
		String product_size = req.getParameter("product_size");
		int cart_count = Integer.parseInt(req.getParameter("product_q"));
		
		StoreCartVo vo = new StoreCartVo();
		
		vo.setMem_id(mem_id);
		vo.setProduct_id(product_id);
		vo.setProduct_size(product_size);
		vo.setCart_count(cart_count);
		
		int count = cartservice.countCart(mem_id, product_id);
        
		if(count==0) {
			cartservice.insert(vo);
		}else {
		    cartservice.updateCart(vo);
		}
		
		
		
		//String msg = dao.cartInsert(vo);
	
		return "redirect:/store/cartlist.str";
	}
	
	//장바구니 목록 보기
	 @RequestMapping(value="/store/cartlist.str", method= {RequestMethod.GET, RequestMethod.POST})
	    public ModelAndView cartlist(ModelAndView mv, HttpSession session) {
	 
	        // 장바구니 목록, 금액 합계, 배송료, 리스트의 사이즈(주문 아이템 갯수) 등
	        // StoreCartVo로 표현되지 않는 여러가지 정보를 담아 뷰로 넘겨야하므로 HashMap 사용
	        Map<String, Object> map = new HashMap<String, Object>();
	 
	        //String mem_id = (String) session.getAttribute("mem_id");
	        String mem_id ="sliver";
	        if (mem_id != null) {// 로그인한 상태이면
	            List<StoreCartVo> list = cartservice.listCart(mem_id);// 서비스단에서 장바구니 목록을 가져오고
	          
	            int sumMoney = cartservice.sumMoney(mem_id);// 금액 합계를 가져오고
	            int fee = sumMoney >= 100000 ? 0 : 2500;// 금액 합계에 대한 배송료를 계산하고
	            // 금액,배송비,총액,리스트사이즈,장바구니목록
	            // 각 값들을 map에 넣어준다.
	            map.put("sumMoney", sumMoney);
	            map.put("fee", fee);
	            map.put("sum", fee + sumMoney);
	            map.put("list", list);
	            map.put("count", list.size());
	 
	            mv.setViewName("viewCart"); // 장바구니리스트로 뷰 설정
	            mv.addObject("map", map);
	            // ModelAndView 객체에 map을 담고 리스트 뷰를 설정해준 뒤 포워딩.
	 
	            return mv;
	 
	        } else {
	            // 로그인하지 않은 상태이면 로그인 페이지로
	            // 아무 Object도 안줘도 되나?
	           // mv.setViewName("member/login");
	        	mv.setViewName("viewCart");
	            return mv;
	        }
	    }
	 
	 //장바구니 부분삭제
	    @RequestMapping(value="/store/cartdelete.str", method= {RequestMethod.GET, RequestMethod.POST})
	    public String cartdelete(HttpServletRequest req) {
	        int cart_id = Integer.parseInt(req.getParameter("cart_id"));
	        cartservice.delete(cart_id);
	 
	        return "redirect:/store/cartlist.str";
	    }
	 //장바구니 비우기
	    @RequestMapping(value="/store/deleteAll.str", method= {RequestMethod.GET, RequestMethod.POST})
	    public String cartdeleteAll(HttpSession session) {
	 
	        // 세션에셔 유저아이디 가져오는걸 service에서 안하고 서비스에서 하나?
	        // StoreCartServiceDao에서 진행해도 되는 처리과정
	       // String mem_id = (String) session.getAttribute("mem_id");
	    	
	    	 String mem_id ="sliver";
	        if (mem_id != null) {
	            cartservice.deleteAll(mem_id);
	        }
	 
	        return "redirect:/store/cartlist.str";
	    }
	 
	    //장바구니 수정
	    // StoreCartServiceDao의 modifyCart/delete 메서드 사용
	    @RequestMapping(value="/store/cartupdate.str", method= {RequestMethod.GET, RequestMethod.POST})
	    public String cartupdate( HttpServletRequest req, HttpSession session) {
	 
	        //String mem_id = (String) session.getAttribute("mem_id");
	    	 String mem_id ="sliver";
	    	 
	    	 String[] a = req.getParameterValues("cart_count");
	    	 
	    	 //System.out.println(a.length);
	    	 
	    	 int[] cart_count = new int[a.length];
	    	 
	    	 String[] b = req.getParameterValues("cart_id");
	    	 int[] cart_id = new int[b.length];
	    	 
	    	 String[] c = req.getParameterValues("product_id");
	    	 int[] product_id = new int[c.length];
	    	 
	        for (int i = 0; i < cart_id.length; i++) {
	              
	        	cart_count[i] = Integer.parseInt(a[i]);
	        	cart_id[i] = Integer.parseInt(b[i]);
	        	product_id[i] = Integer.parseInt(c[i]);
	        	
	        	//System.out.println(cart_count[i]);
	        	//System.out.println(cart_id[i]);
	            // cart_count가 0이면 카트아이디를 삭제
	            if (cart_count[i] == 0) {
	                cartservice.delete(cart_id[i]);
	            } else {
	                StoreCartVo vo = new StoreCartVo();
	                vo.setMem_id(mem_id);
	                vo.setProduct_id(product_id[i]);
	                vo.setCart_id(cart_id[i]);
	                vo.setCart_count(cart_count[i]);
	                cartservice.modifyCart(vo);
	            }
	        }
	 
	        return "redirect:/store/cartlist.str";
	    }
	    
		//order페이지로 넘어가기
		 @RequestMapping(value="/store/order.str", method= {RequestMethod.GET, RequestMethod.POST})
		    public ModelAndView order(ModelAndView mv, HttpSession session) {
			 
			// 장바구니 목록, 금액 합계, 배송료, 리스트의 사이즈(주문 아이템 갯수) 등
		        // StoreCartVo로 표현되지 않는 여러가지 정보를 담아 뷰로 넘겨야하므로 HashMap 사용
		        Map<String, Object> map = new HashMap<String, Object>();
		 
		        //String mem_id = (String) session.getAttribute("mem_id");
		        String mem_id ="sliver";
		        if (mem_id != null) {// 로그인한 상태이면
		            List<StoreCartVo> list = cartservice.listCart(mem_id);// 서비스단에서 장바구니 목록을 가져오고
		            List<StoreMember> list2 = cartservice.listMember(mem_id);
		          
		            int sumMoney = cartservice.sumMoney(mem_id);// 금액 합계를 가져오고
		            int fee = sumMoney >= 100000 ? 0 : 2500;// 금액 합계에 대한 배송료를 계산하고
		            // 금액,배송비,총액,리스트사이즈,장바구니목록
		            // 각 값들을 map에 넣어준다.
		            map.put("sumMoney", sumMoney);
		            map.put("fee", fee);
		            map.put("sum", fee + sumMoney);
		            map.put("list", list);
		            map.put("list2", list2);
		            map.put("count", list.size());
		 
		          
		            mv.addObject("map", map);
		            // ModelAndView 객체에 map을 담고 리스트 뷰를 설정해준 뒤 포워딩.
		 
		            mv.setViewName("checkout");
					return mv;
		 
		        } else {
		            // 로그인하지 않은 상태이면 로그인 페이지로
		            // 아무 Object도 안줘도 되나?
		           // mv.setViewName("member/login");
		        	   mv.setViewName("checkout");
						return mv;
		        }
			 
			 
			 
			 
		 }
		 
		 
		//주문하기
		 @RequestMapping(value="/store/orderComplete.str", method= {RequestMethod.GET, RequestMethod.POST,},produces = "application/json; charset=utf-8")
		    public ModelAndView orderComplete(ModelAndView mv, HttpServletRequest req, HttpSession session) {
			 
			  /*String mem_id = (String) session.getAttribute("mem_id");
			
				String get_name = req.getParameter("get_name");
				String get_phone = req.getParameter("get_phone");
				String zip_code = req.getParameter("zip_code");
				String address1 = req.getParameter("address1");
				String address2 = req.getParameter("address2");
				
				System.out.println(req.getParameter("address1"));
				System.out.println(req.getParameter("amount"));
				
				int amount = Integer.parseInt(req.getParameter("amount"));
				
				*/
		
			    String mem_id = "sliver";
				StoreOrderVo vo = new StoreOrderVo();
				StoreOrderDetailVo dVo = new StoreOrderDetailVo();
		
		       
		        //List<StoreOrderDetailVo> olist = cartservice.countC(mem_id);
		        List<StoreOrderDetailVo> olist = new ArrayList<StoreOrderDetailVo>();
		        
		        JsonParser parser=new JsonParser();
		        String str=req.getParameter("iii");
		        String str1=req.getParameter("jjj");
		        
		        System.out.println(str);
		        System.out.println(str1);
		        
		        JsonElement element=parser.parse(str);
		        
		        String get_name = element.getAsJsonObject().get("get_name").getAsString();
		        String get_phone = element.getAsJsonObject().get("get_phone").getAsString();
		        String zip_code = element.getAsJsonObject().get("zip_code").getAsString();
		        String address1 = element.getAsJsonObject().get("address1").getAsString();
		        String address2 = element.getAsJsonObject().get("address2").getAsString();
		        int amount = element.getAsJsonObject().get("amount").getAsInt();
		       // int cart_count = element.getAsJsonObject().get("count_cart").getAsInt();
		        
		        vo = new StoreOrderVo(mem_id, get_name, get_phone, zip_code, address1, address2, amount);
		        
		        
		        JsonArray array=element.getAsJsonObject().get("product_id").getAsJsonArray();
		        JsonArray array1=element.getAsJsonObject().get("cart_count").getAsJsonArray();
		        JsonArray array2=element.getAsJsonObject().get("order_size").getAsJsonArray();
		        
		        for(int i = 0; i<array.size(); i++) {
		        	System.out.println(array.get(i).getAsString());
		        	int product_id = array.get(i).getAsInt();
		        	int cart_count = array1.get(i).getAsInt();
		        	String order_size = array2.get(i).getAsString();
		        	
		        	dVo = new StoreOrderDetailVo(product_id, cart_count, order_size, mem_id);
		        	
		        	olist.add(dVo);
		        	
		        }
		        
		        
		        
		       /*
		        dVo.setCart_count(cart_count);
		        dVo.setMem_id(mem_id);
		        dVo.setProduct_id(product_id);
		        dVo.setOrder_size(order_size);
		        
		        olist.add(dVo);
		        */
		        cartservice.orderInsert(vo);
		        cartservice.orderDetails(olist);
		        cartservice.deleteAll(mem_id);
		     
		        	   mv.setViewName("mypage");
						return mv;
		        
			 
			 
			 
		 }
		 
	 
	}

	
	

