package stream_uk;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.UserList;
import mybatis.Factory;

public class UkDao {

SqlSession sqlSession;

	public UkDao() {
		sqlSession = Factory.getFactory().openSession();
	}

	public void enter(UserList userList) {
		System.out.println("dao.enter시작함");
		int r=sqlSession.insert("mybatis_uk.enter", userList);
		if(r>0) {
			System.out.println("enter");
			sqlSession.commit();
		}
	}

	public void exit(UserList userList) {
		System.out.println("dao.exit시작함");
		int r=sqlSession.update("mybatis_uk.exit", userList);
		if(r>0) {
			System.out.println("exit");
			sqlSession.commit();
		}
	}

	public List<String> users(String streamer){
		System.out.println("dao.user실행");
		List<String> list=sqlSession.selectList("mybatis_uk.users", streamer);
		return list;
	}

}
