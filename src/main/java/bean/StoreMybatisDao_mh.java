/**
 * 
 */
package bean;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.Factory;


public class StoreMybatisDao_mh {

	SqlSession sqlSession;

	public StoreMybatisDao_mh() {

		sqlSession = Factory.getFactory().openSession();
		System.out.println("★★★★★ 민호 DAO들어옴★★★★★");
	}
	
	
	public String pModify(ProductVo_mh vo) {
		System.out.println("dao -> pModify()");
		String msg = "";
		int cnt = 0;
		
		try {
			cnt = sqlSession.update("storeAdmin.pModify",vo);
			if(cnt>0) {
				msg="수정완료";
				sqlSession.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return msg;
		
	}
	
	public String noticeDelete(int serial) {
		int cnt = 0;
		String msg="삭제 중 오류";
		try {
			cnt = sqlSession.delete("storeAdmin.noticeDelete",serial);
			if(cnt>0) {
				sqlSession.commit();
				msg = "삭제되었습니다.";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	
	public String noticeModify(MH_noticeVo vo) {
		int cnt = 0;
		String msg="수정 중 오류";
		try {
			cnt = sqlSession.update("storeAdmin.noticeModify",vo);
			if(cnt>0) {
				sqlSession.commit();
				msg="수정되었습니다.";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	
	public MH_noticeVo noticeView(int serial) {
		MH_noticeVo vo = null;
		
		try {
			vo = sqlSession.selectOne("storeAdmin.noticeView",serial);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return vo;
	}
	
	public String noticeInsertR(MH_noticeVo vo) {
		String msg="저장 중 오류 발생";
		int cnt = 0;
		
		try {
			cnt = sqlSession.insert("storeAdmin.noticeInsert", vo);
			System.out.println("★★★ cnt : " + cnt);
			
			if(cnt>0) {
				sqlSession.commit();
				msg="저장되었습니다.";
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return msg;
	}
	
	public List<MH_noticeVo> noticeSelect(mh_Page p){
		List<MH_noticeVo> list = null;
		int cnt = 0;
		
		try {
			cnt = sqlSession.selectOne("storeAdmin.noticeCount", p);
			System.out.println("★★★cnt : " + cnt);
			if(cnt<0) {
				throw new Exception();
			}else {
				p.setTotListSize(cnt);
				p.pageCompute();
				
				list= sqlSession.selectList("storeAdmin.noticeSelect",p);
				System.out.println("★★★list size : " + list.size());
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<MH_cateCountVo> cateCount(){
		List<MH_cateCountVo> list = null;
		
		try {
			
			list = sqlSession.selectList("storeAdmin.cateCount");
			System.out.println("cateCount list 사이즈 : " + list.size());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<MH_ageCountVo> ageCount(){
		List<MH_ageCountVo> list = null;
		
		try {
			
			list = sqlSession.selectList("storeAdmin.ageCount");
			System.out.println("ageCount list 사이즈 : " + list.size());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<MH_rankproductVo> rankproduct(){
		List<MH_rankproductVo> list = null;
		
		try {
			list = sqlSession.selectList("storeAdmin.rankproduct");
			System.out.println("rankproduct List 사이즈 : " + list.size());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<MH_monthAmountVo> monthAmount(){
		List<MH_monthAmountVo> list = null; 
		
		try {
			list = sqlSession.selectList("storeAdmin.amountMonth");
			System.out.println(" amountMonth list사이즈 : "+list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public String orderDelete(int order_serial) {
		String msg = null;
		
		try {
			int cnt = sqlSession.delete("storeAdmin.orderDetailDelete",order_serial);
			if(cnt <0) {
				throw new Exception();
			}
			cnt = sqlSession.delete("storeAdmin.orderDelete",order_serial);
			System.out.println("★★★cnt : "+cnt);
			if(cnt>0) {
				msg = "주문 삭제됨";
			}
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return msg;
	}
	
	
	public List<MH_orderListVo> orderDetail(MH_orderVo vo){
		List<MH_orderListVo> list = null;
		
		try {
			list = sqlSession.selectList("storeAdmin.orderView",vo);
			System.out.println("★★★List 사이즈 : " + list.size());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<MH_orderVo> orderSelect(mh_Page p){		
		List<MH_orderVo> list = null;
		
		try {
			int cnt = sqlSession.selectOne("storeAdmin.orderCount",p);
			System.out.println("★★★cnt : " + cnt);
			
			p.setTotListSize(cnt);
			p.pageCompute();
			
			list = sqlSession.selectList("storeAdmin.orderSelect",p);
			
			
			System.out.println("★★★list 사이즈 : " + list.size()  );
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public MH_ReviewVo reviewDetail(int serial) {
		MH_ReviewVo vo = null;
		try {
			vo = sqlSession.selectOne("storeAdmin.reviewView",serial); 
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	
	public List<MH_ReviewVo> reviewSelect(mh_Page p){
		List<MH_ReviewVo> list = null;
		
		try {
			int cnt = sqlSession.selectOne("storeAdmin.reviewCount",p);
			System.out.println("cnt : " +cnt);
			
			p.setTotListSize(cnt);
			p.pageCompute();
			
			list = sqlSession.selectList("storeAdmin.reviewSelect",p);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public String delete(String value) {
		String msg="";
		int product_id = Integer.parseInt(value);
		try {
			int cnt = sqlSession.delete("storeAdmin.att_delete_all",product_id);
			System.out.println("에러1");
			if(cnt<1) {
				throw new Exception("사진 삭제중 오류");
			}
			cnt = sqlSession.delete("storeAdmin.product_delete",product_id);
			System.out.println("에러2");
			if(cnt<1) {
				throw new Exception();
			}
			msg="정상적으로 삭제 완료";
			sqlSession.commit();
		}catch (Exception e){
			e.printStackTrace();
		}
		
		return msg;
	}
	
	public String reviewDelete(int value) {
		String msg="";
		int review_id = value;
		try {
			int cnt = sqlSession.delete("storeAdmin.reviewPhoto_delete_all",review_id);
			System.out.println("에러1");
			if(cnt<1) {
				throw new Exception("사진 삭제중 오류");
			}
			cnt = sqlSession.delete("storeAdmin.review_delete",review_id);
			System.out.println("에러2");
			if(cnt<1) {
				throw new Exception();
			}
			msg="리뷰,리뷰 사진 삭제 완료";
			sqlSession.commit();
		}catch (Exception e){
			e.printStackTrace();
		}
		
		return msg;
	}
	
	public String modify(ProductVo_mh vo, List<ProductPhoto_mh> attList) {
		
		String msg = "상품이 정상적으로 수정되었습니다.";
		
		try {
			int cnt = sqlSession.update("storeAdmin.product_modify",vo);
			System.out.println("여기까지됨1");
			if(cnt<1) {
				throw new Exception("상품 수정 중 오류 발생");
			}
			cnt = sqlSession.delete("storeAdmin.att_delete_all",vo.getProduct_id());
			if(cnt<1) {
				throw new Exception("상품 삭제 중 오류 발생");
			}
			for (ProductPhoto_mh attVo : attList) {
				attVo.setProduct_id(vo.getProduct_id());
				cnt = sqlSession.insert("storeAdmin.att_modify", attVo);
				if (cnt < 1) {
					throw new Exception("사진 등록 중 오류 발생");
				}
			}
			sqlSession.commit();
					
		}catch (Exception e) {
			e.printStackTrace();
			msg=e.getMessage();
		}
		System.out.println("dao에서 msg : "+msg);
		return msg;
		
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
	
	public List<Integer> productStateCount() {
		List<Integer> productState = new ArrayList<Integer>();
			
		try {
			productState.add(sqlSession.selectOne("storeAdmin.totalCount"));
			productState.add(sqlSession.selectOne("storeAdmin.nomalCount"));
			productState.add(sqlSession.selectOne("storeAdmin.soldOutCount"));
			productState.add(sqlSession.selectOne("storeAdmin.hideCount"));
		} catch (Exception e) {
			e.printStackTrace();
		}			
		return productState;
	}
	
	public ProductVo_mh productView(int product_id) {
		ProductVo_mh vo = null;
		
		try {
			vo=sqlSession.selectOne("storeAdmin.productView",product_id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	
}
