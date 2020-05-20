package store;

import java.util.Date;

public class StoreReviewPhotoVo {
	
	int review_pid;
	int review_id;
    String image1;
    String image2;
    Date rp_date;
    
    public StoreReviewPhotoVo() {
    	
    }
    
    public StoreReviewPhotoVo(String image1, String image2 ) {
    	this.image1 = image1;
    	this.image2 = image2;
    }
    
	
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}


	public int getReview_pid() {
		return review_pid;
	}


	public void setReview_pid(int review_pid) {
		this.review_pid = review_pid;
	}


	public int getReview_id() {
		return review_id;
	}


	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}


	public Date getRp_date() {
		return rp_date;
	}


	public void setRp_date(Date rp_date) {
		this.rp_date = rp_date;
	}
	
	
    

}
