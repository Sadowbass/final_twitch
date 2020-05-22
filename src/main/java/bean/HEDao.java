package bean;

import org.apache.ibatis.session.SqlSession;
import org.springframework.http.HttpRequest;

import mybatis.Factory;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
			 delFile(vo, req);
			
		}finally {
			return msg;
		}
		
	}
	
	public String member_modify(MemberVo vo,HttpServletRequest req) {
		String msg = "dao 시작";
		try {
			//본문 글 수정 
			int cnt = sqlSession.update("member.update", vo);
			if(cnt <1) {
				throw new Exception("본문 글 수정 중 오류 발생");
			}
			
			if(vo.getPh_sysfile() != null) {
				MemberVo delvo = sqlSession.selectOne("member.ph_sysfile", vo);
				if(delvo != null) {
					//기존 사진이 있는 경우(수정)
					int cnt2 =sqlSession.update("member.ph_modify",vo);
					if(cnt2<1) throw new Exception("첨부사진 수정 중 오류 발생");
					//기존 사진 삭제
					delFile(delvo, req);
					
				}else {
					//기존파일 없었는데 추가 
					cnt = sqlSession.insert("member.ph_insert", vo);
					if(cnt<1) throw new Exception("첨부사진 추가 중 오류 발생");
					
				}
			}
			
			sqlSession.commit();
			
		}catch(Exception ex) {
			msg = ex.getMessage();
			ex.printStackTrace();
			delFile(vo, req);
			sqlSession.rollback();
		}finally {
			return msg;
		}
		
	}
	
	public void delFile(MemberVo vo,HttpServletRequest req) {
		String path =  req.getSession().getServletContext().getRealPath("/img/user-photo/");//상대경로 -> 가상서버의 사진만 삭제
		File f = new File(path + vo.getPh_sysfile());
		if(f.exists()) f.delete();
	}
	public void delFile2(BroadCastingCateVo vo,HttpServletRequest req) {
		String path =  req.getSession().getServletContext().getRealPath("/img/cate/");//상대경로 -> 가상서버의 사진만 삭제
		File f = new File(path + vo.getCat_sysfile());
		if(f.exists()) f.delete();
		
	}
	
	public String member_delete(String mid,HttpServletRequest req) {
		String msg = "dao 시작";
		MemberVo delvo = new MemberVo();
		try {
			int cnt = sqlSession.delete("member.delete", mid);
			if(cnt<1) throw new Exception("삭제 중 오류 발생");
			 delvo.setPh_id(mid);
			 delvo = sqlSession.selectOne("member.ph_sysfile", delvo);
			 if(delvo != null) {
				 delFile(delvo, req);//파일 삭제
				 cnt =sqlSession.delete("member.ph_delete", mid);
				 if(cnt<1) throw new Exception("첨부 사진 테이블 삭제 중 오류 ");
			 }
			 
			 sqlSession.commit();
			msg = "삭제 성공";
			
		}catch(Exception ex) {
			sqlSession.rollback();
			msg =ex.getMessage();
			ex.printStackTrace();
					
		}finally {
			return msg;
		}
	}
	
	public List<BroadCastingCateVo> cate_select(){
		List<BroadCastingCateVo> list =null;
		try {
			list = sqlSession.selectList("cate.select");
		}catch(Exception ex) { 
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public BroadCastingCateVo cate_view(String serial) {
		BroadCastingCateVo vo = null;
		try {
			vo = sqlSession.selectOne("cate.view",serial);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return vo;
		}
		
	}
	
	public String cate_delete(String serial,HttpServletRequest req) {
		String msg = "dao 시작";
		BroadCastingCateVo vo = new BroadCastingCateVo();
		try {
			vo = sqlSession.selectOne("cate.view",serial);
			int cnt = sqlSession.delete("cate.delete", serial);
			if(cnt<1) throw new Exception("삭제 중 오류 발생");
			if(vo.getCat_sysfile() != null) {
				 delFile2(vo,req);//파일 삭제
			}
			sqlSession.commit();
			msg = "삭제 성공";
			
		}catch(Exception ex) {
			sqlSession.rollback();
			msg =ex.getMessage();
			ex.printStackTrace();
					
		}finally {
			return msg;
		}
	}
	
	public String cate_modify(BroadCastingCateVo vo,HttpServletRequest req) {
		String msg = "dao 시작";
		try {
			//본문 글 수정 
			int cnt = sqlSession.update("cate.update", vo);
			if(cnt <1) {
				throw new Exception("본문 글 수정 중 오류 발생");
			}
			
			if(vo.getCat_sysfile() != null) {
				BroadCastingCateVo delvo = sqlSession.selectOne("cate.ph_sysfile", vo);
				if(delvo.getCat_sysfile() != null) {
					//기존 사진이 있는 경우(수정)
					int cnt2 =sqlSession.update("cate.ph_modify",vo);
					if(cnt2<1) throw new Exception("첨부사진 수정 중 오류 발생");
					//기존 사진 삭제
					delFile2(delvo, req);
					
				}else {
					//기존파일 없었는데 추가 
					cnt = sqlSession.update("cate.ph_modify", vo);
					if(cnt<1) throw new Exception("첨부사진 추가 중 오류 발생");
					
				}
			}
			
			sqlSession.commit();
			
		}catch(Exception ex) {
			msg = ex.getMessage();
			ex.printStackTrace();
			delFile2(vo, req);
			sqlSession.rollback();
		}finally {
			return msg;
		}
		
	}
	
	public String cate_insert(BroadCastingCateVo vo,HttpServletRequest req) {
		String msg = "dao 시작";
		try {
		 int cnt = sqlSession.insert("cate.insert", vo);
		 if(cnt<1) {
			 throw new Exception("본문 저장중 오류 발생");
		 }
		 msg ="입력 성공";
		 sqlSession.commit();
		 
		}catch(Exception ex) {
			 ex.printStackTrace();
			 msg = ex.getMessage();
			 sqlSession.rollback();
			 delFile2(vo, req);
			
		}finally {
			return msg;
		}
		
	}
	
	public List<TagVo> tag_select(){
		List<TagVo> list =null;
		try {
			list = sqlSession.selectList("cate.tag_select");
		}catch(Exception ex) { 
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public List<TagVo> tag_search(String findStr){
		List<TagVo> list =null;
		try {
			list = sqlSession.selectList("cate.tag_search",findStr);
		}catch(Exception ex) { 
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public String tag_delete(String serial) {
		String msg = "dao 시작";
		try {
			int cnt = sqlSession.delete("cate.tag_delete", serial);
			if(cnt<1) throw new Exception("삭제 중 오류 발생");
			sqlSession.commit();
			msg = "삭제 성공";
		}catch(Exception ex) {
			sqlSession.rollback();
			msg =ex.getMessage();
			ex.printStackTrace();
		}finally {
			return msg;
		}
	}
	
	public String tag_insert(String tn) {
		String msg = "dao 시작";
		try {
		 int cnt = sqlSession.insert("cate.tag_insert", tn);
		 if(cnt<1) {
			 throw new Exception("본문 저장중 오류 발생");
		 }
		 msg ="입력 성공";
		 sqlSession.commit();
		 
		}catch(Exception ex) {
			 ex.printStackTrace();
			 msg = ex.getMessage();
			 sqlSession.rollback();
			
		}finally {
			return msg;
		}
		
	}
	
	public List<StreamerVo> streamer_select() {
		List<StreamerVo> list =  null;
		try {
			list = sqlSession.selectList("stream.select");
		}catch(Exception ex) { 
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public StreamerVo streamer_view(String mid) {
		StreamerVo vo = null;
		try {
			vo = sqlSession.selectOne("stream.view",mid);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return vo;
		}
		
	}
	
	public List<String> weekly_broad_time(String mid) {
		List<String> list= new ArrayList<String>();
		try {
		        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Calendar cal = GregorianCalendar.getInstance();
		        cal.setTime(new Date());
		        
		        
		        Map<String,Object> map = new HashMap<String, Object>();
		        map.put("mid", mid);
		        for(int i=1 ; i<8; i++) {
		        	cal.set(Calendar.DAY_OF_WEEK, i);
		        	String day = format.format(cal.getTime());
		        	map.put("day", day);
		        	String broad_time = sqlSession.selectOne("stream.weekly_broad_time",map);
		        	list.add(broad_time);
		        }
		       
		        
		       
		       
			
		}catch(Exception ex) {
			
		}finally {
			return list;
		}
		
	}



}
