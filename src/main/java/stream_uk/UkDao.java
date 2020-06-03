package stream_uk;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.Cht;
import bean.Friend;
import bean.UserList;
import bean.ViewerCnt;
import bean.Whisper;
import mybatis.Factory;

public class UkDao {

SqlSession sqlSession;

   public UkDao() {
      sqlSession = Factory.getFactory().openSession();
   }

   /*채팅*/
   public void chatting(Cht cht) {
      int r=sqlSession.insert("mybatis_uk.cht", cht);
      if(r>0) {
         sqlSession.commit();
         sqlSession.close();
      }
   }

   /*시청자 입장*/
   public void enter(UserList userList) {
	  int r=sqlSession.insert("mybatis_uk.enter", userList);
      if(r>0) {
         sqlSession.commit();
         sqlSession.close();
      }
   }

   /*시청자 퇴장*/
   public void exit(UserList userList) {
      int r=sqlSession.update("mybatis_uk.exit", userList);
      if(r>0) {
         sqlSession.commit();
         sqlSession.close();
      }
   }

   /*스트리머 팔로워*/
   public List<String> followList(String followList){
	   List<String> list=sqlSession.selectList("mybatis_uk.followList",followList);
	   sqlSession.close();
	   return list;
   }

    /*스트리머 방송중*/
   public String onAir(String mid) {
	   String result=sqlSession.selectOne("mybatis_uk.onAir", mid);
	   sqlSession.close();
	   return result;
   }

   /*친추 수락*/
   public void plusOk(Friend friend) {
	  int r1=sqlSession.insert("mybatis_uk.plusOk1", friend);
	  int r2=sqlSession.insert("mybatis_uk.plusOk2", friend);
      if(r1>0 && r2>0) {
         sqlSession.commit();
         sqlSession.close();
      }
   }

   /*귓속말*/
   public void whisper(Whisper whisper) {
	   int r=sqlSession.insert("mybatis_uk.whisperIn", whisper);
	   if(r>0) {
         sqlSession.commit();
         sqlSession.close();
      }
   }

   /*하은 부탁*/
   public void viewerCnt(ViewerCnt viewerCnt) {
	   int r=sqlSession.update("mybatis_uk.viewerCnt", viewerCnt);
	      if(r>0) {
	         sqlSession.commit();
	         sqlSession.close();
	      }
   }
}