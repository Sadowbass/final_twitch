package bean;

import org.apache.ibatis.session.SqlSession;

import mybatis.Factory;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HEDao {

	SqlSession sqlSession;

	public HEDao() {
		this.sqlSession = Factory.getFactory().openSession();
	}
	
	public List<MemberVo> member_select() {
		List<MemberVo> list =  null;
		try {
			list = sqlSession.selectList("member.select");
		}catch(Exception ex) { 
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public MemberVo member_view(String mid) {
		MemberVo vo = null;
		try {
			vo = sqlSession.selectOne("member.view",mid);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return vo;
		}
		
	}
	
	public String member_insert(MemberVo vo,HttpServletRequest req) {
		String msg = "dao 시작";
		try {
		 int cnt = sqlSession.insert("member.insert", vo);
		 if(cnt<1) {
			 throw new Exception("본문 저장중 오류 발생");
		 }
		 cnt = sqlSession.insert("member.insert_p", vo);
		 if(cnt<1) {
			 throw new Exception("사진 저장중 오류 발생");
		 }
		 msg ="입력 성공";
		 sqlSession.commit();
		 
		}catch(Exception ex) {
			 ex.printStackTrace();
			 msg = ex.getMessage();
			 sqlSession.rollback();
			 String path =  req.getSession().getServletContext().getRealPath("/img/user-photo/");
			 File f = new File(path + vo.getPh_sysfile());
			 if(f.exists()) f.delete();
			
		}finally {
			return msg;
		}
		
	}



}
