package store;

import java.util.Date;
import java.util.List;

public class StoreReviewVo {
	
    int review_id;
	String mem_id;
	int product_id;
	String rSubject;
	String rContent;
	Double review_like;
	Date review_date;
	

	//List<StoreReviewVo> list;


	@Override
	public String toString() {
		String msg = "리뷰아이디 : " + this.review_id + " 멤버 아이디 : " + this.mem_id;
		return msg;
	}

	public StoreReviewVo() {
	}

	public StoreReviewVo(String mem_id, int product_id, String rSubject, String rContent, Double review_like) {
		this.mem_id = mem_id;
		this.product_id = product_id;
		this.rSubject = rSubject;
		this.rContent = rContent;
		this.review_like = review_like;
	}

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

	public Double getReview_like() {
		return review_like;
	}

	public void setReview_like(Double review_like) {
		this.review_like = review_like;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	
}
