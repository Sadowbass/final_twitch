package bean;

import org.apache.ibatis.session.SqlSession;

import mybatis.Factory;

import java.util.List;

public class SCDao {

	SqlSession sqlSession;

	public SCDao() {
		this.sqlSession = Factory.getFactory().openSession();
	}

	public List<StreamingVo> nowStreaming(){
		List<StreamingVo> list = sqlSession.selectList("test.nowStreaming");

		return list;
	}

	public StreamingVo streamInfo(String mId) {
		StreamingVo vo = sqlSession.selectOne("test.select", mId);
		return vo;
	}
}
