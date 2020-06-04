package bean;

import java.util.Date;
import java.util.List;

public class StoreCartVo {

	int cart_id; //카트 시리얼
	String mem_id;//회원아이디
	int product_id;//상품 아이디
	String product_size;//상품 사이즈
	String product_name;//상품이름
	int cart_count;//상품 개수
	int product_price; //상품 가격
	int totPrice;//총 금액
	Date cart_date;//카트 담은 날짜
	
	List<ProductPhoto_mh> photo;
	String sysfile;
	
	String mem_name;
	String mem_email;
	int mem_money;
	
	public StoreCartVo() {
		// TODO Auto-generated constructor stub
	}
	
	public StoreCartVo(String mem_id, int product_id, int cart_count) {
        this.mem_id = mem_id;
        this.product_id = product_id;
        this.cart_count = cart_count;
       
    }
	
	public StoreCartVo(int cart_id, String mem_id, int product_id,String product_size, String product_name, int cart_count, int totPrice, Date cart_date) {
        this.cart_id = cart_id;
		this.mem_id = mem_id;
        this.product_id = product_id;
        this.product_size= product_size;
        this.product_name = product_name;
        this.cart_count = cart_count;
        this.totPrice = totPrice;
        this.cart_date = cart_date;
    }
	
	
	
	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public int getMem_money() {
		return mem_money;
	}

	public void setMem_money(int mem_money) {
		this.mem_money = mem_money;
	}

	public String getSysfile() {
		return sysfile;
	}

	public void setSysfile(String sysfile) {
		this.sysfile = sysfile;
	}

	public List<ProductPhoto_mh> getPhoto() {
		return photo;
	}

	public void setPhoto(List<ProductPhoto_mh> photo) {
		this.photo = photo;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	

	public String getProduct_size() {
		return product_size;
	}

	public void setProduct_size(String product_size) {
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
