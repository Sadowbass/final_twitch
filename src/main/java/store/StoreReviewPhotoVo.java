package store;

import java.util.Date;

public class StoreReviewPhotoVo {
	
	int rPid;
	int rId;
    String image1;
    String image2;
    Date rpDate;
    
    public StoreReviewPhotoVo(String image1, String image2 ) {
    	this.image1 = image1;
    	this.image2 = image2;
    }
    
	public int getrPid() {
		return rPid;
	}
	public void setrPid(int rPid) {
		this.rPid = rPid;
	}
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
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
	public Date getRpDate() {
		return rpDate;
	}
	public void setRpDate(Date rpDate) {
		this.rpDate = rpDate;
	}
    
    

}
