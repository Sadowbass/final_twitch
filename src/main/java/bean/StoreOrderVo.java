package bean;

import java.util.Date;

public class StoreOrderVo {
	
	/*
	ORDER_SERIAL	VARCHAR2(50 BYTE)
	MEM_ID	VARCHAR2(50 BYTE)
	GET_NAME	VARCHAR2(50 BYTE)
	GET_PHONE	VARCHAR2(30 BYTE)
	ZIP_CODE	VARCHAR2(20 BYTE)
	ADDRESS1	VARCHAR2(50 BYTE)
	ADDRESS2	VARCHAR2(50 BYTE)
	AMOUNT	NUMBER
	ORDER_DATE	DATE
	ORDER_STATE	NUMBER
*/
	String order_serial;
	String mem_id;
	String get_name;
	String get_phone;
	String zip_code;
	String address1;
	String address2;
	int amount;
	int order_state;
	Date order_date;
	
	public StoreOrderVo() {
		
	}
	
	public StoreOrderVo(String mem_id,String get_name,String get_phone,String zip_code,String address1,String address2,int amount) {
		
		this.mem_id =mem_id;
		this.get_name = get_name;
		this.get_phone = get_phone;
		this.zip_code = zip_code;
		this.address1 = address1;
		this.address2 = address2;
		this.amount = amount;
		
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
	public int getOrder_state() {
		return order_state;
	}
	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	
	
	
	
}
