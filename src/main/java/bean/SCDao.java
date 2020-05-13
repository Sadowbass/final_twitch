package bean;

import config.Factory;
import org.apache.ibatis.session.SqlSession;

public class SCDao {

	SqlSession sqlSession;

	public SCDao() {
		this.sqlSession = Factory.getFactory().openSession();
	}

	public StreamingVo test(String mId) {
		StreamingVo vo = sqlSession.selectOne("test.select", mId);
		return vo;
	}
}
