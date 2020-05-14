/**
 * 
 */
package bean;

import org.apache.ibatis.session.SqlSession;

import mybatis.Factory;
import store.StoreReviewVo;



/**
 * @author silve
 *
 */
public class StoreMybatisDao {

	SqlSession sqlsession;
	
	public StoreMybatisDao() {
		
		sqlsession = Factory.getFactory().openSession();
		System.out.println("factory...");
	}
	
	public String insertReview(StoreReviewVo vo) {
		String msg = "자료가 정상적으로 입력되었습니다.";
		
		try {

			int cnt = sqlsession.insert("store.review_insert", vo);

			if (cnt < 1) {
				throw new Exception("본문 저장 중 오류 발생");
			}

			sqlsession.commit();

		} catch (Exception e1) {

			sqlsession.rollback();
			e1.printStackTrace();
			msg = e1.getMessage();
			

		} finally {

			//sqlSession.close();
			return msg;

		}
		
	}
	
	
	
}
