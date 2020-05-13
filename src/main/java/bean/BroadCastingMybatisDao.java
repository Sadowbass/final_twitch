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
			if(flag<1) throw new Exception("업데이트 에러");
			
			flag = sqlSession.insert("broadCasting.startAir",vo);
			if(flag<1) throw new Exception("인서트 에러");
			
	
			
		}catch(Exception ex) {
			ex.printStackTrace();
			result="입력실패";
			sqlSession.rollback();
		}finally {
			if(flag>0) {
			sqlSession.commit();
			result="입력성공";
			}
			return result;
		}
		
	}
	
	public String updateAir(BroadCastingAirVo vo) {
		String result = "";
		int flag = 0;
		
		try {
			flag = sqlSession.update("broadCasting.updateAir",vo);
			if(flag<1) throw new Exception("업데이트 에러");
		}catch (Exception e) {
			e.printStackTrace();
			result="수정에 실패하셨습니다.";
			sqlSession.rollback();
		}finally {
			if(flag>0) {
			sqlSession.commit();
			result="수정에 성공하셨습니다.";
			}
			return result;
		}
		
	}
	
	
}
