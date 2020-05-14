package login;

import org.apache.ibatis.session.SqlSession;

import mybatis.Factory;

public class MemberDao_m {
	SqlSession sqlSession;
	
	public MemberDao_m() {
		sqlSession = Factory.getFactory().openSession(); 
	}

	
	public String insert(MemberVo_m vo) {
		String msg ="정상적으로 가입되었습니다.";
		
		try { 
		 int cnt = sqlSession.insert("lm.insert", vo);
		 if(cnt<1) {
			 throw new Exception("회원 가입 중 오류 발생");
		 }
		 sqlSession.commit();
		}catch(Exception ex){
			ex.printStackTrace();
			msg = ex.getMessage();
			sqlSession.rollback();
		}finally {
			sqlSession.close();
			return msg;
		}
	}
	
	public boolean login(MemberVo_m vo) {
		boolean b = true;
		
		try {
			b = sqlSession.selectOne("lm.login", vo);
		}catch(Exception ex) {
			b=false;
			ex.printStackTrace();
		}finally {
			return b;
		}
		
		
	}
	
}
