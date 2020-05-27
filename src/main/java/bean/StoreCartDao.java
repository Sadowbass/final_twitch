package bean;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mybatis.Factory;

@Repository
public class StoreCartDao implements StoreCartDaoif{
	
	//ymybatis를 호출하므로 sqlsession에 의존성을 주입해야함
	
	
	SqlSession sqlsession;
	
	public StoreCartDao() {
		// TODO Auto-generated constructor stub
	
		sqlsession = Factory.getFactory().openSession();
		System.out.println("factory...");
	}

	

	@Override
	public List<StoreCartVo> cartMoney() {
		// TODO Auto-generated method stub
		return null;
	}
    
	
	//장바구니 담기
	@Override
	public void insert(StoreCartVo vo) {
		sqlsession.insert("store.cart_insert", vo);	
	}

	@Override
	public List<StoreCartVo> listCart(String mem_id) {
	
	 return	sqlsession.selectList("store.cart_select", mem_id);	
	}

	@Override
	public void delete(int cart_id) {
		sqlsession.delete("store.cart_delete", cart_id);	
		
	}

	@Override
	public void deleteAll(String mem_id) {
		sqlsession.delete("store.cart_deleteAll", mem_id);
		
	}

	@Override
	public void update(int cart_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int sumMoney(String mem_id) {
		
		return sqlsession.selectOne("store.cart_sumMoney", mem_id);
	}

	@Override
	public int countCart(String mem_id, int product_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateCart(StoreCartVo vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyCart(StoreCartVo vo) {
		sqlsession.update("store.cart_modify", vo);
		
	}
	
}
