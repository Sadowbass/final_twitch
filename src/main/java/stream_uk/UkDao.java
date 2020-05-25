package stream_uk;

import org.apache.ibatis.session.SqlSession;

import bean.Cht;
import mybatis.Factory;

public class UkDao {

SqlSession sqlSession;

	public UkDao() {
		sqlSession = Factory.getFactory().openSession();
	}

	public void chatting(Cht cht) {
		int r=sqlSession.insert("mybatis_uk.cht", cht);
		if(r>0) {
			sqlSession.commit();
			sqlSession.close();
		}
	}

}
