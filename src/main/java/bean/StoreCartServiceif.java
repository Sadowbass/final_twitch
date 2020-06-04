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
    
    List<StoreMember> listMember(String mem_id);//주문할때 회원정보 불러오기
    
    void orderInsert(StoreOrderVo vo);//주문
    void orderDetails(List<StoreOrderDetailVo> olist);//주문 상세
    
    List<StoreOrderDetailVo> countC(String mem_id);//장바구니 상품 숫자
}
