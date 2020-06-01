package bean;

import java.util.ArrayList;
import java.util.List;

public class MH_ReviewVo {
	int review_id; // 리뷰 시리얼
	String mem_id; // 리뷰쓴 사람 아이디
	int product_id; // 리뷰 작성한 상품 시리얼
	String rSubject; // 리뷰 제목
	String rContent; // 리뷰 내용
	int review_like; // 리뷰 별점
	String review_date; // 리뷰 작성일
	String product_name; //	
	
	List<MH_ReviewPhoto> photos = new ArrayList<MH_ReviewPhoto>(); // 사진 리스트
	
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getrSubject() {
		return rSubject;
	}
	public void setrSubject(String rSubject) {
		this.rSubject = rSubject;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public int getReview_like() {
		return review_like;
	}
	public void setReview_like(int review_like) {
		this.review_like = review_like;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public List<MH_ReviewPhoto> getPhotos() {
		return photos;
	}
	public void setPhotos(List<MH_ReviewPhoto> photos) {
		this.photos = photos;
	}
	
	
	
	
	
	
	
	
}
