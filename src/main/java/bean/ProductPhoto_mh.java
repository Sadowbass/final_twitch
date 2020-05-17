package bean;

public class ProductPhoto_mh {
	int photo_serial; // 시리얼 고유번호
	int product_id; // 상품 번호
	String orifile;
	String sysfile;
	
	public ProductPhoto_mh() {
		// TODO Auto-generated constructor stub
	}
	public ProductPhoto_mh(String ori, String sys) {
		this.orifile = ori;
		this.sysfile = sys;
	}
	
	
	public int getPhoto_serial() {
		return photo_serial;
	}
	public void setPhoto_serial(int photo_serial) {
		this.photo_serial = photo_serial;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getOrifile() {
		return orifile;
	}
	public void setOrifile(String orifile) {
		this.orifile = orifile;
	}
	public String getSysfile() {
		return sysfile;
	}
	public void setSysfile(String sysfile) {
		this.sysfile = sysfile;
	}
	
	
}
