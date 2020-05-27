package bean;

import java.util.List;

public interface StoreCartServiceif {
	List<StoreCartVo> cartMoney();
    void insert(StoreCartVo vo);
    List<StoreCartVo> listCart(String mem_id);
    void delete(int cart_id);
    void deleteAll(String mem_id);
    void update(int cart_id);
    int sumMoney(String mem_id);
    int countCart(String mem_id, int product_id);
    void updateCart(StoreCartVo vo);
    void modifyCart(StoreCartVo vo);
}
