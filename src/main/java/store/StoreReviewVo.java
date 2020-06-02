package store;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class StoreReviewVo {

    int review_id;
    String mem_id;
    int product_id;
    Double review_like;
    Date review_date;
    List<StoreReviewPhotoVo> rpList;
    int rId; // 시리얼
    String mId; // 댓글쓴 사람 아이디
    int pId; // 상품 시리얼
    String rSubject; // 리뷰 제목
    String rContent; // 리뷰 내용
    Double rLike; // 별점
    Date rDate; // 등록일

    List<StoreReviewVo> list = new ArrayList<StoreReviewVo>(); // 사진 리스트

    public StoreReviewVo() {

    }

    public StoreReviewVo(String mem_id, int product_id, String rSubject, String rContent, Double review_like) {
        this.mem_id = mem_id;
        this.product_id = product_id;
        this.rSubject = rSubject;
        this.rContent = rContent;
        this.review_like = review_like;
    }


    public List<StoreReviewVo> getList() {
        return list;
    }


    public void setList(List<StoreReviewVo> list) {
        this.list = list;
    }


    public int getrId() {
        return rId;
    }


    public List<StoreReviewPhotoVo> getRpList() {
        return rpList;
    }


    public void setRpList(List<StoreReviewPhotoVo> rpList) {
        this.rpList = rpList;
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
