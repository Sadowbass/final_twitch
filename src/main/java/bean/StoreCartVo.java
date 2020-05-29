package bean;

import java.util.Date;

public class StoreCartVo {

	int cart_id; //카트 시리얼
	String mem_id;//회원아이디
	int product_id;//상품 아이디
	int product_size;//상품 사이즈
	String product_name;//상품이름
	int cart_count;//상품 개수
	int totPrice;//총 금액
	Date cart_date;//카트 담은 날짜
	
	public StoreCartVo() {
		// TODO Auto-generated constructor stub
	}
	
	public StoreCartVo(String mem_id, int product_id, int cart_count) {
        this.mem_id = mem_id;
        this.product_id = product_id;
        this.cart_count = cart_count;
       
    }
	
	public StoreCartVo(int cart_id, String mem_id, int product_id,int product_size, String product_name, int cart_count, int totPrice, Date cart_date) {
        this.cart_id = cart_id;
		this.mem_id = mem_id;
        this.product_id = product_id;
        this.product_size= product_size;
        this.product_name = product_name;
        this.cart_count = cart_count;
        this.totPrice = totPrice;
        this.cart_date = cart_date;
    }
	
	
	
	public int getProduct_size() {
		return product_size;
	}

	public void setProduct_size(int product_size) {
		this.product_size = product_size;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getTotPrice() {
		return totPrice;
	}

	public void setTotPrice(int totPrice) {
		this.totPrice = totPrice;
	}

	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
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
	public int getCart_count() {
		return cart_count;
	}
	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}

	public Date getCart_date() {
		return cart_date;
	}

	public void setCart_date(Date cart_date) {
		this.cart_date = cart_date;
	}
	
	
	
	
	
}
