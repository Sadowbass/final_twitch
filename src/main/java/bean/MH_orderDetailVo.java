package bean;

public class MH_orderDetailVo {
	int orderDetails_serial;
	String order_serial;
	String product_id;
	int cart_count;

	
	public int getOrderDetails_serial() {
		return orderDetails_serial;
	}
	public void setOrderDetails_serial(int orderDetails_serial) {
		this.orderDetails_serial = orderDetails_serial;
	}
	public String getOrder_serial() {
		return order_serial;
	}
	public void setOrder_serial(String order_serial) {
		this.order_serial = order_serial;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public int getCart_count() {
		return cart_count;
	}
	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}
}
