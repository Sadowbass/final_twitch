/**
 * 
 */
package bean;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;


import mybatis.Factory;
import store.StoreReviewPhotoVo;
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

	public String insertReview(StoreReviewVo vo, List<StoreReviewPhotoVo> list) {
		String msg = "리뷰가 정상적으로 입력되었습니다.";
		System.out.println("dao inset들어옴");
	    int cnt;
	

			try {			
						cnt = sqlsession.insert("store.review_insert", vo);
						if(cnt<1) {
							throw new Exception("리뷰 저장 중 오류 발생");
						}
						
						//첨부 파일 데이터 저장
						for(StoreReviewPhotoVo rpVo : list) {
							cnt  = sqlsession.insert("store.review_photo_insert", rpVo);
							if(cnt<1) {
								throw new Exception("리뷰 사진 저장 중 오류 발생");
							}
						}
						sqlsession.commit();
						
						
					}catch(Exception e1) {
					
						sqlsession.rollback();
						msg = e1.getMessage();
						e1.printStackTrace();
					}finally {
						//sqlSession.close();
						return msg;
					}
				
			}
	
	public List<StoreReviewVo> reviewSelect(){
		List<StoreReviewVo> list = new ArrayList<StoreReviewVo>();	
		System.out.println("reviewselectdao,xncm");
		try {

			list = sqlsession.selectList("store.review_select");

		} catch (Exception e1) {

			e1.printStackTrace();

		} finally {

			//sqlSession.close();
			return list;

		}
	}
	
}
