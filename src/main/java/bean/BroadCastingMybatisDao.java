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
		System.out.println("�����̼Ǻ��̿�����");
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
			System.out.println("��������");
			sqlSession.rollback();
			// sqlSession.close();
		} finally {
			if (result > 0) {
				System.out.println("�����Ϸ�");
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
			msg = "�������";
			sqlSession.rollback();
			// sqlSession.close();
		} finally {
			if (result > 0) {
				msg = "���⼺��";
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
				throw new Exception("������Ʈ ����");

			flag = sqlSession.insert("broadCasting.startAir", vo);
			if (flag < 1)
				throw new Exception("�μ�Ʈ ����");

		} catch (Exception ex) {
			ex.printStackTrace();
			result = "�Է½���";
			sqlSession.rollback();
		} finally {
			if (flag > 0) {
				sqlSession.commit();
				result = "�Է¼���";
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
				throw new Exception("������Ʈ ����");
		} catch (Exception e) {
			e.printStackTrace();
			result = "������ �����ϼ̽��ϴ�.";
			sqlSession.rollback();
		} finally {
			if (flag > 0) {
				sqlSession.commit();
				result = "������ �����ϼ̽��ϴ�.";
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
				throw new Exception("���� ����");
		} catch (Exception e) {
			e.printStackTrace();
			result = "��������";
			sqlSession.rollback();
		} finally {
			if (flag > 0) {

				File file = new File("C:/Users/JHTA/eclipse-workspace/final_twitch/WebContent/uploads/"+sKey+".m3u8.png");
				if (file.exists()) {
					if (file.delete()) {
						System.out.println("���ϻ��� ����");
					} else {
						System.out.println("���ϻ��� ����");
					}
				} else {
					System.out.println("������ �������� �ʽ��ϴ�.");
				}
			}

			sqlSession.commit();
			result = "��������";
		}
		
		return result;
	}


	public RouletteVo selectRoulette(String mId) {
		RouletteVo vo = null;
		try {
			vo = sqlSession.selectOne("broadCasting.selectRoulette", mId);
		} catch (Exception e) {
			System.out.println("�귿��ȸ�Լ���!!");
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

			if (flagRul.equals("true")) { // ������ �����Ͱ� ���� ������Ʈ
				flag = sqlSession.update("broadCasting.saveRoulette1", map);
				if (flag < 1)
					throw new Exception("�귿 ������Ʈ ����");
			} else if (flagRul.equals("false")) { // ������ �����Ͱ� ���� �μ�Ʈ
				flag = sqlSession.insert("broadCasting.saveRoulette2", map);

				if (flag < 1)
					throw new Exception("�귿 �μ�Ʈ ����");
			}

		} catch (Exception e) {
			sqlSession.rollback();
			result = "����";
		} finally {
			if (flag > 0) {
				sqlSession.commit();
				result = "����";
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
				throw new Exception("�귿 ����Ʈ ����");
		} catch (Exception e) {
			sqlSession.rollback();
			result = "����";
		} finally {
			if (flag > 0) {
				sqlSession.commit();
				result = "����";
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
				throw new Exception("����� �Է� ����");
		} catch (Exception e) {
			sqlSession.rollback();
			result = "����";
		} finally {
			if (flag > 0) {
				sqlSession.commit();
				result = "����";
			}
			
			return result;
		}

	}

}
