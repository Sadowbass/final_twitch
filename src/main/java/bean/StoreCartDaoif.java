package bean;

import java.util.List;

public interface StoreCartDaoif {
	List<StoreCartVo> cartMoney();
    void insert(StoreCartVo vo); //장바구니 추가
    List<StoreCartVo> listCart(String mem_id); //장바구니 목록
    void delete(int cart_id); //장바구니 개별 삭제
    void deleteAll(String mem_id); //장바구니 비우기
    void update(int cart_id); 
    int sumMoney(String mem_id); //장바구니 금액 합계
    int countCart(String mem_id, int product_id); //장바구니 상품 갯수
    void updateCart(StoreCartVo vo); //장바구니 수정 
    void modifyCart(StoreCartVo vo);
    void orderInsert(StoreOrderVo vo);//주문
    void orderDetails(List<StoreOrderDetailVo> olist);//주문 상세
    
    List<StoreOrderDetailVo> countC(String mem_id);//장바구니 상품 숫자
    
    List<StoreMember> listMember(String mem_id);//주문할때 회원정보 불러오기
    
}
