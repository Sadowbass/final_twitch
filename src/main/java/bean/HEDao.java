package bean;

import org.apache.ibatis.session.SqlSession;

import mybatis.Factory;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

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
			vo = sqlSession.selectOne("member.view");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return vo;
		}
		
	}


}
