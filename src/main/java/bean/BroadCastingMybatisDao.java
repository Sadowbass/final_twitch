package bean;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
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

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			

			return list;
		}
	}

	public List<BroadCastingCateVo> selectCate() {
		System.out.println("ddddddddddddddddddddddddddddddddd");
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
		System.out.println("도네이션브이오들어옴");
		System.out.println(mId);
		List<BroadCastingDonationVo> list = new ArrayList<BroadCastingDonationVo>();

		try {
			list = sqlSession.selectList("broadCasting.selectDonation", mId);
			System.out.println(list.size());

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

	public void readDonation(int serial) {
		int result = 0;
		try {
			result = sqlSession.update("broadCasting.readDonation", serial);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("수정실패");
			sqlSession.rollback();
			// sqlSession.close();
		} finally {
			if (result > 0) {
				System.out.println("수정완료");
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
			msg = "송출실패";
			sqlSession.rollback();
			// sqlSession.close();
		} finally {
			if (result > 0) {
				msg = "송출성공";
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
				throw new Exception("업데이트 에러");

			flag = sqlSession.insert("broadCasting.startAir", vo);
			if (flag < 1)
				throw new Exception("인서트 에러");

		} catch (Exception ex) {
			ex.printStackTrace();
			result = "입력실패";
			sqlSession.rollback();
		} finally {
			if (flag > 0) {
				sqlSession.commit();
				result = "입력성공";
			}
			
			return result;
		}

	}

	public String updateAir(BroadCastingAirVo vo) {
		String result = "";
		int flag = 0;

		try {
			flag = sqlSession.update("broadCasting.updateAir", vo);
			if (flag < 1)
				throw new Exception("업데이트 에러");
		} catch (Exception e) {
			e.printStackTrace();
			result = "수정에 실패하셨습니다.";
			sqlSession.rollback();
		} finally {
			if (flag > 0) {
				sqlSession.commit();
				result = "수정에 성공하셨습니다.";
			}
			
			return result;
		}

	}

	public String deleteAir(String mId, String sKey) {
		String result = "";
		int flag = 0;

		try {
			flag = sqlSession.delete("broadCasting.deleteAir", mId);
			if (flag < 1)
				throw new Exception("삭제 에러");
		} catch (Exception e) {
			e.printStackTrace();
			result = "삭제실패";
			sqlSession.rollback();
		} finally {
			if (flag > 0) {

				File file = new File("C:/Users/JHTA/eclipse-workspace/final_twitch/WebContent/uploads/"+sKey+".m3u8.png");
				if (file.exists()) {
					if (file.delete()) {
						System.out.println("파일삭제 성공");
					} else {
						System.out.println("파일삭제 실패");
					}
				} else {
					System.out.println("파일이 존재하지 않습니다.");
				}
			}

			sqlSession.commit();
			result = "삭제성공";
		}
		
		return result;
	}


	public RouletteVo selectRoulette(String mId) {
		RouletteVo vo = null;
		try {
			vo = sqlSession.selectOne("broadCasting.selectRoulette", mId);
		} catch (Exception e) {
			System.out.println("룰렛조회입섹션!!");
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

			if (flagRul.equals("true")) { // 기존에 데이터가 있음 업데이트
				flag = sqlSession.update("broadCasting.saveRoulette1", map);
				if (flag < 1)
					throw new Exception("룰렛 업데이트 에러");
			} else if (flagRul.equals("false")) { // 기존에 데이터가 없음 인서트
				flag = sqlSession.insert("broadCasting.saveRoulette2", map);

				if (flag < 1)
					throw new Exception("룰렛 인서트 에러");
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
				throw new Exception("룰렛 딜리트 에러");
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
				throw new Exception("썸네일 입력 에러");
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

}
