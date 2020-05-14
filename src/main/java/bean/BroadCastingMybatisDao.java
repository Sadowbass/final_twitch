package bean;

import java.util.ArrayList;
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
	
	public List<BroadCastingDonationVo> selectDonation(String mId){
		System.out.println("도네이션브이오들어옴");
		System.out.println(mId);
		List<BroadCastingDonationVo> list = new ArrayList<BroadCastingDonationVo>();
		
		try {
			list = sqlSession.selectList("broadCasting.selectDonation",mId);
			System.out.println(list.size());
			
			/*
			if(list != null) {
			for(int i=0; i < list.size(); i++) {
				readDonation(list.get(i).don_serial);
			}
			}
			*/
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			//sqlSession.close();
			
			return list;
		}
		
	}
	
	public void readDonation(int serial) {
		int result = 0;
		try {
			result = sqlSession.update("broadCasting.readDonation", serial);
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("수정실패");
			sqlSession.rollback();
			//sqlSession.close();
		}finally {
			if(result>0) {
				System.out.println("수정완료");
				sqlSession.commit();
				//sqlSession.close();
			}
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
	
	public String deleteAir(String mId) {
		String result = "";
		int flag = 0;
		
		try {
			flag = sqlSession.delete("broadCasting.deleteAir",mId);
			if(flag<1) throw new Exception("삭제 에러");
		}catch (Exception e) {
			e.printStackTrace();
			result="삭제실패";
			sqlSession.rollback();
		}finally {
			if(flag>0) {
			sqlSession.commit();
			result="삭제성공";
			}
			return result;
		}
	
		
	}
	
	
}
