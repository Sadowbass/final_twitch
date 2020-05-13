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
	

	public String startAir(BroadCastingAirVo vo) {
		String result = "";
		int flag = 0;
		try {
			flag = sqlSession.update("broadCasting.updateKey",vo);
			if(flag<1) throw new Exception("������Ʈ ����");
			
			flag = sqlSession.insert("broadCasting.startAir",vo);
			if(flag<1) throw new Exception("�μ�Ʈ ����");
			
	
			
		}catch(Exception ex) {
			ex.printStackTrace();
			result="�Է½���";
			sqlSession.rollback();
		}finally {
			if(flag>0) {
			sqlSession.commit();
			result="�Է¼���";
			}
			return result;
		}
		
	}
	
	public String updateAir(BroadCastingAirVo vo) {
		String result = "";
		int flag = 0;
		
		try {
			flag = sqlSession.update("broadCasting.updateAir",vo);
			if(flag<1) throw new Exception("������Ʈ ����");
		}catch (Exception e) {
			e.printStackTrace();
			result="������ �����ϼ̽��ϴ�.";
			sqlSession.rollback();
		}finally {
			if(flag>0) {
			sqlSession.commit();
			result="������ �����ϼ̽��ϴ�.";
			}
			return result;
		}
		
	}
	
	
}
