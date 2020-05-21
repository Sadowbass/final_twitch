package store;

import java.util.Date;
import java.util.List;

public class StoreReviewVo {
	
    int rId; // 시리얼
	String mId; // 댓글쓴 사람 아이디
	int pId; // 상품 시리얼
	String rSubject; // 리뷰 제목
	String rContent; // 리뷰 내용
	Double rLike; // 별점
	Date rDate; // 등록일
	
	
	//List<StoreReviewVo> list;
	
	
	public StoreReviewVo(String mId, int pId, String rSubject, String rContent, Double rLike) {
		this.mId = mId;
		this.pId = pId;
		this.rSubject = rSubject;
		this.rContent = rContent;
	
		this.rLike = rLike;
	}
	
	
	
	public int getrId() {
		return rId;
	}



	public void setrId(int rId) {
		this.rId = rId;
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
