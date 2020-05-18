/**
 * 
 */
package bean;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.Factory;


public class StoreMybatisDao_mh {

	SqlSession sqlSession;

	public StoreMybatisDao_mh() {

		sqlSession = Factory.getFactory().openSession();
		System.out.println("★★★★★ 민호 DAO들어옴★★★★★");
	}

	public String insert(ProductVo_mh vo, List<ProductPhoto_mh> attList) {
		String msg = "상품이 정상적으로 입력되었습니다.";

		try {
			int cnt = sqlSession.insert("storeAdmin.product_insert", vo);
			if (cnt < 1) {
				throw new Exception("상품 등록 중 오류 발생");
			}
			for (ProductPhoto_mh attVo : attList) {
				cnt = sqlSession.insert("storeAdmin.att_insert", attVo);
				if (cnt < 1) {
					throw new Exception("사진 등록 중 오류 발생");
				}
			}
			sqlSession.commit();
		} catch (Exception ex) {
			sqlSession.rollback();
			ex.printStackTrace();
			msg = ex.getMessage();
		} finally {
			return msg;
		}
	}

	public List<ProductVo_mh> select(mh_Page p) {
		List<ProductVo_mh> list = null;

		try {
			System.out.println("★★★★★★★여기★★★★★★★"+p.getFindStr());
			int totList = sqlSession.selectOne("storeAdmin.count", p);
			
			
			System.out.println("★★★★★" + totList);
			p.setTotListSize(totList);
			p.pageCompute();
			
			list = sqlSession.selectList("storeAdmin.select", p);
			System.out.println(list.size());
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			// sqlSession.close();
			return list;
		}

	}

}
