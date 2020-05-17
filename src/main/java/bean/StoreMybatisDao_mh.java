/**
 * 
 */
package bean;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.Factory;


public class StoreMybatisDao_mh {

	SqlSession sqlsession;
	
	public StoreMybatisDao_mh() {
		
		sqlsession = Factory.getFactory().openSession();
		System.out.println("★★★★★ 민호 DAO들어옴★★★★★");
	}
	
	public String insert(ProductVo_mh vo , List<ProductPhoto_mh> attList) {
		String msg = "상품이 정상적으로 입력되었습니다.";
		
		try {
			int cnt = sqlsession.insert("adminStore.product_insert", vo);
			if (cnt < 1) {
				throw new Exception("상품 등록 중 오류 발생");
			}
			for(ProductPhoto_mh attVo : attList) {
				cnt = sqlsession.insert("adminStore.att_insert",attVo);
				if(cnt<1) {
					throw new Exception("사진 등록 중 오류 발생");
				}
			}
			sqlsession.commit();
		} catch (Exception ex) {
			sqlsession.rollback();
			ex.printStackTrace();
			msg = ex.getMessage();		
		} finally {			
			return msg;
		}		
	}
	
	
	
}
