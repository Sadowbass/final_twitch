package bean;

import java.util.List;

import org.springframework.stereotype.Service;

import store.StoreCartVo;

@Service
public class StoreCartServieceDao implements StoreCartServiceif {
    

	StoreCartDaoif cartDaoif;
	
	@Override
	public List<StoreCartVo> cartMoney() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(StoreCartVo vo) {
		cartDaoif.insert(vo);
		
	}

	@Override
	public List<StoreCartVo> listCart(String mem_id) {
		// TODO Auto-generated method stub
		return cartDaoif.listCart(mem_id);
	}

	@Override
	public void delete(int cart_id) {
		// TODO Auto-generated method stub
		cartDaoif.delete(cart_id);
	}

	@Override
	public void deleteAll(String mem_id) {
		// TODO Auto-generated method stub
		cartDaoif.deleteAll(mem_id);
	}

	@Override
	public void update(int cart_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int sumMoney(String mem_id) {
		// TODO Auto-generated method stub
		return cartDaoif.sumMoney(mem_id);
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
		// TODO Auto-generated method stub
		cartDaoif.modifyCart(vo);
	}

}
