package bean;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

			return list;
		}
	}

	public List<BroadCastingCateVo> selectCate() {
		List<BroadCastingCateVo> list = null;

		try {
			list = sqlSession.selectList("broadCasting.selectCate");

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

			return list;
		}

	}

	public List<BroadCastingDonationVo> selectDonation(String mId) {
		List<BroadCastingDonationVo> list = new ArrayList<BroadCastingDonationVo>();

		try {
			list = sqlSession.selectList("broadCasting.selectDonation", mId);

			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					readDonation(list.get(i).don_serial);
				}
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

			return list;
		}

	}

	public int selectFollow(String mId) {
		int cnt = 0;

		try {
			cnt = sqlSession.selectOne("broadCasting.selectFollow",mId);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			return cnt;
		}


	}



	public List<FollowListVo> selectFollowList(String mId) {
		List<FollowListVo> list = null;
		try {
			list = sqlSession.selectList("broadCasting.selectFollowList",mId);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			return list;
		}


	}
	
	
	public UserInfoVo initUser(String mId) {
		UserInfoVo vo = null;
		
		try {
			vo = sqlSession.selectOne("broadCasting.initUser",mId);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			return vo;
			
		}
		
		
	}
	
	

	public void readDonation(int serial) {
		int result = 0;
		try {
			result = sqlSession.update("broadCasting.readDonation", serial);
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			// sqlSession.close();
		} finally {
			if (result > 0) {
				sqlSession.commit();
				// sqlSession.close();
			}

		}
	}

	public String sendDonation(int serial) {
		int result = 0;
		String msg = "";
		try {
			result = sqlSession.update("broadCasting.sendDonation", serial);
		} catch (Exception e) {
			e.printStackTrace();
			msg = "실패";
			sqlSession.rollback();
			// sqlSession.close();
		} finally {
			if (result > 0) {
				msg = "성공";
				sqlSession.commit();
				// sqlSession.close();
			}

			return msg;
		}
	}

	public String startAir(BroadCastingAirVo vo) {
		String result = "";
		int flag = 0;
		try {
			flag = sqlSession.update("broadCasting.updateKey", vo);
			if (flag < 1)
				throw new Exception("방송시작 에러");

			flag = sqlSession.insert("broadCasting.startAir", vo);
			if (flag < 1)
				throw new Exception("방송시작 에러");

		} catch (Exception ex) {
			ex.printStackTrace();
			result = "실패";
			sqlSession.rollback();
		} finally {
			if (flag > 0) {
				sqlSession.commit();
				result = "성공";
			}

			return result;
		}

	}

	public String updateAir(BroadCastingAirVo vo) {
		String result = "";
		int flag = 0;

		try {
			flag = sqlSession.update("broadCasting.updateAir", vo);
			if (flag < 1) {
				throw new Exception("방송정보 업데이트 에러");}else {
					flag = sqlSession.insert("broadCasting.insertInfo",vo);
					if(flag<1) {
						throw new Exception("방송정보 업데이트 에러");
					}
				}
		} catch (Exception e) {
			e.printStackTrace();
			result = "실패";
			sqlSession.rollback();
		} finally {
			if (flag > 0) {
				sqlSession.commit();
				result = "성공";
			}

			return result;
		}

	}

	public String deleteAir(String mId, String sKey,String gameName) {
		String result = "";
		int flag = 0;
		BroadCastingAirVo vo = new BroadCastingAirVo();
		vo.setAir_gname(gameName);
		vo.setAir_mid(mId);

		try {
			flag = sqlSession.delete("broadCasting.deleteAir", mId);
			if (flag < 1) {
				throw new Exception("생방송삭제에러");}else {
					
					flag = sqlSession.insert("broadCasting.insertInfo",vo);
					if(flag<1) {
						throw new Exception("생방송삭제에러");
					}
				}
		} catch (Exception e) {
			e.printStackTrace();
			result = "중지실패";
			sqlSession.rollback();
		} finally {
			if (flag > 0) {
				File file = new File(
						"C:/Users/JHTA/eclipse-workspace/final_twitch/WebContent/uploads/" + sKey + ".m3u8.png");
				if (file.exists()) {
					if (file.delete()) {

					} else {

					}
				} else {

				}
			}

			sqlSession.commit();
			result = "중지성공";
		}

		return result;
	}

	public RouletteVo selectRoulette(String mId) {
		RouletteVo vo = null;
		try {
			vo = sqlSession.selectOne("broadCasting.selectRoulette", mId);
		} catch (Exception e) {
		} finally {
			return vo;
		}

	}


	public String saveRoulette(String mId, String newRouletteData, String flagRul) {
		String result = "";
		int flag = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mId", mId);
		map.put("newRouletteData", newRouletteData);

		try {

			if (flagRul.equals("true")) {
				flag = sqlSession.update("broadCasting.saveRoulette1", map);
				if (flag < 1)
					throw new Exception("룰렛저장에러");
			} else if (flagRul.equals("false")) { //
				flag = sqlSession.insert("broadCasting.saveRoulette2", map);

				if (flag < 1)
					throw new Exception("룰렛저장에러");
			}

		} catch (Exception e) {
			sqlSession.rollback();
			result = "실패";
		} finally {
			if (flag > 0) {
				sqlSession.commit();
				result = "성공";
			}

			return result;
		}

	}

	public String deleteRoulette(String mId) {
		String result = "";
		int flag = 0;
		try {
			flag = sqlSession.delete("broadCasting.deleteRoulette", mId);
			if (flag < 1)
				throw new Exception("룰렛삭제에러");
		} catch (Exception e) {
			sqlSession.rollback();
			result = "실패";
		} finally {
			if (flag > 0) {
				sqlSession.commit();
				result = "성공";
			}

			return result;
		}
	}

	public String imageCut(String mId, String sKey) {
		String result = "";
		int flag = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mId", mId);
		map.put("path", sKey + ".m3u8.png");

		try {
			flag = sqlSession.update("broadCasting.imageThumbnail", map);
			if (flag < 1)
				throw new Exception("썸네일에러");
		} catch (Exception e) {
			sqlSession.rollback();
			result = "실패";
		} finally {
			if (flag > 0) {
				sqlSession.commit();
				result = "성공";
			}

			return result;
		}

	}
	public BroadCastingAirVo selectAir(String mId) {
		BroadCastingAirVo vo = null;
		try {
			vo = sqlSession.selectOne("broadCasting.selectAir",mId);

		}catch (Exception e) {
		}finally {
			return vo;
		}
	}
	
	public List<StreamerVo> send_dontion(String mid){
		Map<String,Object> map = new HashMap<String, Object>();
        map.put("mid", mid);
        List<StreamerVo> list = new ArrayList<StreamerVo>();
		try {
	       list = sqlSession.selectList("stream.send_donation",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public List<StreamerVo> receive_dontion(String mid){
		Map<String,Object> map = new HashMap<String, Object>();
        map.put("mid", mid);
        List<StreamerVo> list = new ArrayList<StreamerVo>();
		try {
	       list = sqlSession.selectList("stream.receive_donation",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public List<StreamerVo> user_payment(String mid){
		Map<String,Object> map = new HashMap<String, Object>();
        map.put("mid", mid);
        DecimalFormat df = new DecimalFormat("00");
		Calendar currentCalendar = Calendar.getInstance();
		String year  = df.format(currentCalendar.get(Calendar.YEAR));
		
		map.put("year", year);
        List<StreamerVo> list = new ArrayList<StreamerVo>();
		try {
	       list = sqlSession.selectList("stream.user_payment",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}


}
