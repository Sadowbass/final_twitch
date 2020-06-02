package bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		System.out.println("factory di");
	}

	

	@Override
	public List<StoreCartVo> cartMoney() {
		// TODO Auto-generated method stub
		return null;
	}
    
	
	//장바구니 담기
	@Override
	public void insert(StoreCartVo vo) {
	    System.out.println("장바구니 담기 들어옴");
	    System.out.println(vo.getMem_id());
	    System.out.println(vo.getProduct_size());
	    try {
		sqlsession.insert("store.cart_insert", vo);
		sqlsession.commit();
	    }catch(Exception e1) {
	    	e1.printStackTrace();
	    }finally{
	    	
	    }
	}

	@Override
	public List<StoreCartVo> listCart(String mem_id) {
	
	 return	sqlsession.selectList("store.cart_select", mem_id);	
	}

	@Override
	public void delete(int cart_id) {
		try {
			sqlsession.delete("store.cart_delete", cart_id);	
			sqlsession.commit();
			
			System.out.println("cartdelete");
		    }catch(Exception e1) {
		    	e1.printStackTrace();
		    }finally{
		    	
		    }
		
		
	}

	@Override
	public void deleteAll(String mem_id) {
		try {
			sqlsession.delete("store.cart_deleteAll", mem_id);
			sqlsession.commit();
		    }catch(Exception e1) {
		    	e1.printStackTrace();
		    }finally{
		    	
		    }
	
		
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
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("product_id", product_id);
		return sqlsession.selectOne("store.countCart", map);
	}

	@Override
	public void updateCart(StoreCartVo vo) {
	   
		sqlsession.update("store.updateCart", vo);
		sqlsession.commit();
		
	}

	@Override
	public void modifyCart(StoreCartVo vo) {
		try {
			System.out.println(vo.getProduct_id());
			sqlsession.update("store.cart_modify", vo);
			sqlsession.commit();
		    }catch(Exception e1) {
		    	e1.printStackTrace();
		    }finally{
		    	
		    }
	
		
	}
	
}
