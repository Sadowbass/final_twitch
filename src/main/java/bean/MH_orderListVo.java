package bean;

public class MH_orderListVo {
	
	String order_serial;
	String mem_id;
	String get_name;
	String get_phone;
	String zip_code;
	String address1;
	String address2;
	int amount;
	String order_date;
	String order_state;
	
	int orderDetails_serial;
	String product_id;
	int cart_count;
	
	String product_name;
	String sysfile;
	String product_price;
	String product_size;
	
	
	
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	public String getSysfile() {
		return sysfile;
	}
	public void setSysfile(String sysfile) {
		this.sysfile = sysfile;
	}
	public String getProduct_size() {
		return product_size;
	}
	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}
	public int getOrderDetails_serial() {
		return orderDetails_serial;
	}
	public void setOrderDetails_serial(int orderDetails_serial) {
		this.orderDetails_serial = orderDetails_serial;
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
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_img() {
		return sysfile;
	}
	public void setProduct_img(String product_img) {
		this.sysfile = product_img;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getOrder_serial() {
		return order_serial;
	}
	public void setOrder_serial(String order_serial) {
		this.order_serial = order_serial;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getGet_name() {
		return get_name;
	}
	public void setGet_name(String get_name) {
		this.get_name = get_name;
	}
	public String getGet_phone() {
		return get_phone;
	}
	public void setGet_phone(String get_phone) {
		this.get_phone = get_phone;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
}
