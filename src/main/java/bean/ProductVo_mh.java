package bean;

import java.util.ArrayList;
import java.util.List;

public class ProductVo_mh {
	int product_id;
	String product_name;
	String product_explain;
	int product_price;
	String product_cate;
	int product_count;
	int product_state;
	String product_size;
	List<ProductPhoto_mh> photos = new ArrayList<ProductPhoto_mh>();
	
	
	
	
	public int getProduct_state() {
		return product_state;
	}
	public void setProduct_state(int product_state) {
		this.product_state = product_state;
	}
	public List<ProductPhoto_mh> getPhotos() {
		return photos;
	}
	public void setPhotos(List<ProductPhoto_mh> photos) {
		this.photos = photos;
	}
	public String getProduct_explain() {
		return product_explain;
	}
	public void setProduct_explain(String product_explain) {
		this.product_explain = product_explain;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_cate() {
		return product_cate;
	}
	public void setProduct_cate(String product_cate) {
		this.product_cate = product_cate;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public String getProduct_size() {
		return product_size;
	}
	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}
	
	
	
}
