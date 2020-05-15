package store;

import java.util.Date;
import java.util.List;

public class StoreReviewVo {
	
	int rSerial;
	String mId;
	int pId;
	String rSubject;
	String rContent;
	String image1;
	String image2;
	Double rLike;
	Date rDate;
	
	//List<StoreReviewVo> list;
	
	
	public StoreReviewVo(String mId, int pId, String rSubject, String rContent, String image1, String image2,
			Double rLike) {
		this.mId = mId;
		this.pId = pId;
		this.rSubject = rSubject;
		this.rContent = rContent;
		this.image1 = image1;
		this.image2 = image2;
		this.rLike = rLike;
	}
	public int getrSerial() {
		return rSerial;
	}
	public void setrSerial(int rSerial) {
		this.rSerial = rSerial;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
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
	
	public Double getrLike() {
		return rLike;
	}
	public void setrLike(Double rLike) {
		this.rLike = rLike;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	
	
	

}
