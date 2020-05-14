package bean;

import org.apache.ibatis.session.SqlSession;

import mybatis.Factory;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class SCDao {

	SqlSession sqlSession;

	public SCDao() {
		this.sqlSession = Factory.getFactory().openSession();
	}

	public List<StreamingVo> nowStreaming(){
		List<StreamingVo> list = sqlSession.selectList("scbatis.nowStreaming");
		return list;
	}

	public StreamingVo streamInfo(String mId) {
		StreamingVo vo = sqlSession.selectOne("scbatis.select", mId);
		return vo;
	}

	public DonationVo donationView(String mId){
		DonationVo vo = new DonationVo();
		vo = sqlSession.selectOne("scbatis.donationView", mId);
		/*sqlSession.update("scbatis.donationStatusChange", vo.getDon_serial());*/
		return vo;
	}


}
