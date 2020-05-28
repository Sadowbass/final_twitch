package bean;

import java.util.ArrayList;
import java.util.List;

public class ProductVo {
    private String product_id;
    private String product_price;
    private String sysfile;
    private String product_name;
    private String product_explain;
    private List<String> sysfileList;

    public ProductVo() {
        this.sysfileList = new ArrayList<String>();
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getProduct_price() {
        return product_price;
    }

    public void setProduct_price(String product_price) {
        this.product_price = product_price;
    }

    public String getSysfile() {
        return sysfile;
    }

    public void setSysfile(String sysfile) {
        this.sysfile = sysfile;
    }

    public List<String> getSysfileList() {
        return sysfileList;
    }

    public void setSysfileList(List<String> sysfileList) {
        this.sysfileList = sysfileList;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_explain() {
        return product_explain;
    }

    public void setProduct_explain(String product_explain) {
        this.product_explain = product_explain;
    }

    @Override
    public String toString() {
        String r = "pid : " + this.product_id + " pr : " + this.product_price + " sfi : " + sysfile;

        return r;
    }
}
