package bean;

import java.io.File;
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
	
	public int nameCheck(String name,String mId) {
		int result = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mId", mId);
		map.put("name",name);
		
		try {
			result = sqlSession.selectOne("myPageTak.nameCheck",map);
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			sqlSession.close();
			return result;
		}
		
		
	}
	
	public List<PaymentVo> paymentInit(String mId) {
		List<PaymentVo> list = null;
	
		try {
			list = sqlSession.selectList("myPageTak.paymentInit",mId);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
			return list;
		}
		
		
	}
	
	public List<BroadCastingDonationVo> donationInit(String mId) {
		List<BroadCastingDonationVo> list = null;
	
		try {
			list = sqlSession.selectList("myPageTak.donationInit",mId);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
			return list;
		}
		
		
	}
	
	
	public List<BroadCastingDonationVo> donation2Init(String mId) {
		List<BroadCastingDonationVo> list = null;
	
		try {
			list = sqlSession.selectList("myPageTak.donation2Init",mId);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
			return list;
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
	
	
	public int updateProfill(UserInfoVo vo) {
		int result = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		
		try {
			result = sqlSession.update("myPageTak.updateProfill",vo);
			if(result<1) {
				throw new Exception("유저정보업뎃에러");
			}
			if(result>0 && vo.getPh_sysfile() != null) {
				if(vo.getFlag() == 1) {
	
				result2 = sqlSession.update("myPageTak.updateMemberPhoto",vo);
				if(result2 <1) {
					throw new Exception("유저정보업뎃에러");
				}
				}else if(vo.getFlag() == 0) {
					result2 = sqlSession.insert("myPageTak.insertMemberPhoto",vo);
					if(result2 <1) {
						throw new Exception("유저포토인섯에러");
					}
				}
			}else {
				result3 = 1;
			}
		}catch (Exception e) {
			
			if(vo.getPh_sysfile() != null) {
			File file = new File(
					"C:/Users/JHTA/eclipse-workspace/final_twitch/WebContent/img/user-photo/" + vo.getPh_sysfile());
			if (file.exists()) {
				if (file.delete()) {

				} else {

				}
			} else {

			}
			}
		
			sqlSession.rollback();
		}finally {
			if((result>0 && result2>0) || result3>0) {
				
				if(vo.getFlag() == 1 && result3 == 0) {
				
				File file = new File(
						"C:/Users/JHTA/eclipse-workspace/final_twitch/WebContent/img/user-photo/" + vo.getPh_delfile());
				if (file.exists()) {
					if (file.delete()) {

					} else {

					}
				} else {

				}
				
				}
				
				sqlSession.commit();
				sqlSession.close();
			}
			if(result>0 && result2>0) {
				result4 = 1;
			}
			if(result3 == 1) {
				result4 = 1;
			}
			return result4;
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