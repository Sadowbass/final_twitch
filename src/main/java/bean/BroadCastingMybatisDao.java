package bean;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.Factory;

public class BroadCastingMybatisDao {
	SqlSession sqlSession;
	
	public BroadCastingMybatisDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
	public List<String> selectTag() {
		List<String> list = null;
		
		try {
			list = sqlSession.selectList("broadCasting.selectTag");
	
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			//sqlSession.close();
			
			return list;
		}
	}
	
	public List<BroadCastingCateVo> selectCate(){
		List<BroadCastingCateVo> list = null;
		
		try {
			list = sqlSession.selectList("broadCasting.selectCate");
	
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			//sqlSession.close();
			
			return list;
		}
		
		
	}
}
