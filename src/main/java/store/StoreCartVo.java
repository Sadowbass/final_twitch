package store;

import java.util.Date;

public class StoreCartVo {

	int cart_id;
	String mem_id;
	int product_id;
	int cart_count;
	Date cart_date;
	
	public StoreCartVo() {
		// TODO Auto-generated constructor stub
	}
	
	public StoreCartVo(String mem_id, int product_id, int cart_count) {
        this.mem_id = mem_id;
        this.product_id = product_id;
        this.cart_count = cart_count;
       
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
	public Date getCard_date() {
		return cart_date;
	}
	public void setCard_date(Date card_date) {
		this.cart_date = card_date;
	}
	
	
	
	
}
