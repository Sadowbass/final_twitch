package login;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import email.SendEmail;
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
		
			return msg;
		}
	}
	
	public MemberVo_m login(MemberVo_m vo) {
		MemberVo_m memverVo = null;
		
		try {
			memverVo = sqlSession.selectOne("lm.login", vo);
			
		}catch(Exception ex) {
			
			ex.printStackTrace();
		}finally {
			return memverVo;
		}	
	}
	
	public String email(String email) {
		String msg = "";
				
				try {
				MemberVo_m vo = sqlSession.selectOne("lm.email", email);
			
				if(vo != null) {
					SendEmail s = new SendEmail();
					s.MailSend(vo);
					msg = "이메일이 전송되었습니다.";	
				}else{
					msg = "이메일이 전송이 실패하였습니다.";
					
				}
				}catch(Exception ex) {
					ex.printStackTrace();
					
				}finally {
					
					return msg;
				}	
	}
	
	public MemberVo_m profilem(String profilem) {
				MemberVo_m vo = null;
				
				try {
				 vo = sqlSession.selectOne("lm.profilem", profilem);
				 
			
				}catch(Exception ex) {
					ex.printStackTrace();
					
				}finally {
					
					return vo;
				}	
	}
	
	public String modify(MemberVo_m vo, List<Member_mPhoto> attList, List<Member_mPhoto> delList) {
		String msg = "정상적으로 수정되었습니다.";
		
		try {
			// 본문글 수정
			int cnt = sqlSession.update("mm.update", vo);
			if(cnt<1) throw new Exception("회원정보 수정중 오류 발생");
			
			// member_photo에 삭제파일 정보를 제거
			for(Member_mPhoto attVo : delList) {
				if(!attVo.getPh_sysFile().equals("") ) {
					attVo.setPh_Id(vo.getMem_Id());
					cnt = sqlSession.delete("mm.att_delete", attVo);
					if(cnt<1) throw new Exception("첨부 데이터 정보 삭제중 오류 발생");
				}
			}
			
			
			//member_photo에 첨부 파일 정보를 추가
			for(Member_mPhoto attVo : attList) {
				attVo.setPh_Id(vo.getMem_Id());
				
				if(!attVo.getPh_sysFile().equals("") ) {
					cnt = sqlSession.insert("mm.att_insert", attVo);
					if(cnt<1) throw new Exception("첨부 데이터 정보 수정중 오류 발생");
				}
			}
			


			
			sqlSession.commit();
		}catch(Exception ex) {
			

			
			ex.printStackTrace();
			msg = ex.getMessage();
			sqlSession.rollback();
		}finally {
		
			return msg;
		}
	}
	
	
	
	
	
	
	
	
	
	
}
