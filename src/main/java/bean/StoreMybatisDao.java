/**
 * 
 */
package bean;

import java.util.List;

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
	
	public String insertReview(List<StoreReviewVo> list) {
		String msg = "자료가 정상적으로 입력되었습니다.";
		System.out.println("dao inset들어옴");
	
		
		int size = list.size();
		for(int i=0; i<size; i++) {
			StoreReviewVo vo = list.get(i);
		
			
		try {
            
			if(i==0) {
			
				int cnt = sqlsession.insert("store.review_insert1", vo);
			
			
	
			}else {
				
				int cnt = sqlsession.insert("store.review_insert2", vo);
	
			}
			
			System.out.println(list.get(i).getmId());

			sqlsession.commit();

		} catch (Exception e1) {

			sqlsession.rollback();
			e1.printStackTrace();
			msg = e1.getMessage();
			

		}

		
		
	
	
	}
		return msg;
	
	}
	
}
