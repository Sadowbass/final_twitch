package stream_uk;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.AccUk;
import bean.Cht;
import bean.UserList;
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

   public void enter(UserList userList) {
      int r=sqlSession.insert("mybatis_uk.enter", userList);
      if(r>0) {
         sqlSession.commit();
         sqlSession.close();
      }
   }

   public void exit(UserList userList) {
      int r=sqlSession.update("mybatis_uk.exit", userList);
      if(r>0) {
         sqlSession.commit();
         sqlSession.close();
      }
   }

   public int accUser(AccUk accUk){
      int acc=sqlSession.selectOne("mybatis_uk.accUser", accUk);
      System.out.println("마이바티스 실행");
      sqlSession.close();
      return acc;
   }


   public List<String> followList(String followList){
	   List<String> list=sqlSession.selectList("mybatis_uk.followList",followList);
	   sqlSession.close();
	   return list;
   }
}