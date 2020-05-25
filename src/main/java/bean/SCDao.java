package bean;

import org.apache.ibatis.session.SqlSession;

import mybatis.Factory;

import java.text.SimpleDateFormat;
import java.util.*;

public class SCDao {

    SqlSession sqlSession;

    public SCDao() {
        this.sqlSession = Factory.getFactory().openSession();
    }

    /* 팔로워 정보 */
    public List<UserInfoVo> followers(String mId) {
        List<UserInfoVo> list = new ArrayList<UserInfoVo>();
        list = sqlSession.selectList("scbatis.followers", mId);
        return list;
    }

    /* 현재 로그인중인 회원 정보 */
    public UserInfoVo userInfo(String mId) {
        UserInfoVo vo = new UserInfoVo();
        vo = sqlSession.selectOne("scbatis.userInfo", mId);
        return vo;
    }

    /* 현재 방송중인 리스트 불러오는 메소드 */
    public List<StreamingVo> nowStreaming(String mId) {
        List<StreamingVo> list = sqlSession.selectList("scbatis.nowStreaming2", mId);
        return list;
    }

    /* 비회원 추천채널 */
    public List<StreamingVo> nowStreaming() {
        List<StreamingVo> list = sqlSession.selectList("scbatis.recommend");
        return list;
    }

    /* 특정 1개의 방송정보를 가져오는 메소드 */
    public StreamingVo streamInfo(String mId) {
        StreamingVo vo = sqlSession.selectOne("scbatis.select", mId);
        return vo;
    }

    /* 특정 스트리머의 지난방송 리스트 */
    public List<BeforeVo> lateVideo(String mId) {
        List<BeforeVo> list = new ArrayList<BeforeVo>();
        list = sqlSession.selectList("scbatis.videoList", mId);
        return list;
    }

    /* 지난방송 페이징 */
    public List<BeforeVo> videoPaging(String mId, int rno) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("mId", mId);
        map.put("rno", rno);
        List<BeforeVo> list = sqlSession.selectList("scbatis.videoPaging", map);
        return list;
    }

    /* 도네이션 출력을 위한 메소스 */
    public DonationVo donationView(String mId) {
        DonationVo vo = new DonationVo();
        vo = sqlSession.selectOne("scbatis.donationView", mId);
        /* sqlSession.update("scbatis.donationStatusChange", vo.getDon_serial()); */
        return vo;
    }

    /* 친구 검색시 사용되는 메소드 */
    public List<SCFriendListVo> findFriends(String mId) {
        List<SCFriendListVo> list = new ArrayList<SCFriendListVo>();
        list = sqlSession.selectList("scbatis.findFriends", mId);
        return list;
    }

    /* 카테고리 목록 정보 */
    public List<CategoriesVo> categories(String findStr) {
        SCDao dao = new SCDao();
        List<CategoriesVo> list = new ArrayList<CategoriesVo>();
        list = sqlSession.selectList("scbatis.categories", findStr);
        for (int i = 0; i < list.size(); i++) {
            List<String> temp = new ArrayList<String>();
            String genre = list.get(i).getCat_genre();
            String[] gl = genre.split(",");
            for (int j = 0; j < gl.length; j++) {
                String agl = gl[j];
                temp.add(agl);
                if (j == 1) {
                    break;
                }
            }
            list.get(i).setGenreList(temp);
        }
        return list;
    }

    /* 카테고리 페이징(오버로딩) */
    public List<CategoriesVo> categories(String rno, String findStr) {
        SCDao dao = new SCDao();
        HashMap<String, Object> map = new HashMap<String, Object>();
        System.out.println(rno);
        System.out.println(findStr);
        map.put("rno", rno);
        map.put("findStr", findStr);
        List<CategoriesVo> list = new ArrayList<CategoriesVo>();
        list = sqlSession.selectList("scbatis.categoryPaging", map);
        for (int i = 0; i < list.size(); i++) {
            List<String> temp = new ArrayList<String>();
            String genre = list.get(i).getCat_genre();
            String[] gl = genre.split(",");
            for (int j = 0; j < gl.length; j++) {
                String agl = gl[j];
                temp.add(agl);
                if (j == 1) {
                    break;
                }
            }
            list.get(i).setGenreList(temp);
        }
        return list;
    }

    /* 생방송중인 스트리밍 정보 */
    public List<StreamingVo> allStreaming(String findStr) {
        List<StreamingVo> list = new ArrayList<StreamingVo>();
        list = sqlSession.selectList("scbatis.nowStreaming", findStr);
        return list;
    }

    /* 생방송 페이징(오버로딩) */
    public List<StreamingVo> allStreaming(String rno, String findStr) {
        List<StreamingVo> list = new ArrayList<StreamingVo>();

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("rno", rno);
        map.put("findStr", findStr);

        list = sqlSession.selectList("scbatis.streamingPaging", map);
        return list;
    }

    /* 쇼핑몰 메인페이지 */
    public List<ProductVo> productListControl() {
        List<ProductVo> list = new ArrayList<ProductVo>();
        list = sqlSession.selectList("store.mainpage_list");
        return list;
    }

    /* 쇼핑몰 카테고리별 페이지 */
    public List<ProductVo> productListControl(String cate) {
        List<ProductVo> list = new ArrayList<ProductVo>();
        list = sqlSession.selectList("store.mainpage_list_cate", cate);
        return list;
    }

    /* 쇼핑몰 상세페이지 */
    public ProductVo productDetail(String pid) {
        ProductVo vo = new ProductVo();
        List<ProductVo> list = new ArrayList<ProductVo>();
        list = sqlSession.selectList("store.detailView", pid);
        for (ProductVo temp : list) {
            vo.setProduct_id(temp.getProduct_id());
            vo.setProduct_explain(temp.getProduct_explain());
            vo.setProduct_name(temp.getProduct_name());
            vo.setProduct_price(temp.getProduct_price());
            vo.getSysfileList().add(temp.getSysfile());
        }
        return vo;
    }

    /* 로그인시 id pwd 체크 */
    public UserInfoVo idcheck(Map<String, String> map) {
        System.out.println(map.get("id"));
        System.out.println(map.get("pwd"));
        UserInfoVo result = sqlSession.selectOne("scbatis.idcheck", map);
        System.out.println(result);
        return result;
    }

    /* 회원 가입시 아이디 중복 체크 */
    public int dupIdCheck(String mId) {
        return sqlSession.selectOne("scbatis.dupIdCheck", mId);
    }

    /*존재하는 회원인지 검색*/
    public boolean checkUser(String mId) {
        boolean flag = false;
        int check = sqlSession.selectOne("scbatis.dupIdCheck", mId);
        if (check > 0) {
            flag = true;
        }
        return flag;
    }

    /*팔로우 여부 체크*/
    public boolean followCheck(String id, String mId) {
        boolean flag = false;
        Map<String, String> map = new HashMap<String, String>();
        map.put("oid", id);
        map.put("mid", mId);
        int check = sqlSession.selectOne("scbatis.followCheck", map);
        if (check > 0) {
            flag = true;
        }
        return flag;
    }

    /*팔로우 추가*/
    public int addFollow(String sid, String mid) {
        int result = 0;
        Map<String, String> map = new HashMap<String, String>();
        map.put("mid", mid);
        map.put("sid", sid);
        result = sqlSession.insert("scbatis.addFollow",map);
        sqlSession.commit();
        return result;
    }

    /*팔로우 삭제*/
    public int deleteFollow(String sid, String mid){
        int result = 0;
        Map<String, String> map = new HashMap<String, String>();
        map.put("mid", mid);
        map.put("sid", sid);
        result = sqlSession.delete("scbatis.deleteFollow",map);
        sqlSession.commit();
        return result;
    }

}
