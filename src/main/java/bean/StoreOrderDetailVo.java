package bean;

public class StoreOrderDetailVo {

	/*
	ORDERDETAILS_SERIAL	NUMBER
	ORDER_SERIAL	VARCHAR2(50 BYTE)
	PRODUCT_ID	NUMBER
	CART_COUNT	NUMBER
	MEM_ID	VARCHAR2(100 BYTE)
	ORDER_SIZE	NUMBER
	*/
	
	int orderdetails_serial;
	String order_serial;
	int product_id;
	int cart_count;
	String mem_id;
	String order_size;
	
	public int getOrderdetails_serial() {
		return orderdetails_serial;
	}
	public void setOrderdetails_serial(int orderdetails_serial) {
		this.orderdetails_serial = orderdetails_serial;
	}
	public String getOrder_serial() {
		return order_serial;
	}
	public void setOrder_serial(String order_serial) {
		this.order_serial = order_serial;
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
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getOrder_size() {
		return order_size;
	}
	public void setOrder_size(String order_size) {
		this.order_size = order_size;
	}
	
	
	
	
}
