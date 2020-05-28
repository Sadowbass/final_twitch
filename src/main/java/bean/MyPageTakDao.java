package bean;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.Factory;

public class MyPageTakDao {
	SqlSession sqlSession;
	
	public MyPageTakDao() {
		sqlSession = Factory.getFactory().openSession();
	}

	
	public UserInfoVo userInit(String mId) {
		UserInfoVo vo = null;
		
		try {
			vo = sqlSession.selectOne("myPageTak.selectInfo",mId);
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			sqlSession.close();
			return vo;
		}
	}
	
	public int pwdCheck(String mId, String pwd) {
		int result = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mId", mId);
		map.put("pwd",pwd);
		
		try {
			result = sqlSession.selectOne("myPageTak.pwdCheck",map);
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			sqlSession.close();
			return result;
		}
		
		
	}
	
	public int updatePwd(String mId, String pwd) {
		int result = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mId", mId);
		map.put("pwd",pwd);
		
		try {
			result = sqlSession.update("myPageTak.updatePwd",map);
			if(result<1) {
				throw new Exception("패스워드업뎃에러");
			}
		}catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
		}finally {
			if(result>0) {
				sqlSession.commit();
			}
			sqlSession.close();
			return result;
		}
		
		
	}
	

	
	public String insertCoin(String mId, int money) {
		int result = 0;
		String msg = "실패";
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mId", mId);
		map.put("money",money);
		try {
			result = sqlSession.update("myPageTak.insertCoin",map);
			if(result<1) {
				msg = "실패";
				throw new Exception("돈업뎃에러");
				
			}else {
				result = sqlSession.insert("myPageTak.insertPay",map);
				if(result<1) {
					msg = "실패";
					throw new Exception("돈업뎃에러");	
				}
			}
		} catch (Exception e) {
			msg = "실패";
			e.printStackTrace();
			sqlSession.rollback();
			// sqlSession.close();
		} finally {
			if (result > 0) {
				msg = "성공";
				sqlSession.commit();
				
			}
			sqlSession.close();
			return msg;

		}
	}
}
