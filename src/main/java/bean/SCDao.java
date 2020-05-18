package bean;

import org.apache.ibatis.session.SqlSession;

import mybatis.Factory;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class SCDao {

	SqlSession sqlSession;

	public SCDao() {
		this.sqlSession = Factory.getFactory().openSession();
	}

	/*팔로워 정보*/
	public List<UserInfoVo> followers(String mId){
		List<UserInfoVo> list = new ArrayList<UserInfoVo>();
		list = sqlSession.selectList("scbatis.followers",mId);
		return list;
	}
	
	/*현재 로그인중인 회원 정보*/
	public UserInfoVo userInfo(String mId){
		UserInfoVo vo = new UserInfoVo();
		vo = sqlSession.selectOne("scbatis.userInfo", mId);

		return vo;
	}

	/*현재 방송중인 리스트 불러오는 메소드*/
	public List<StreamingVo> nowStreaming(String mId){
		List<StreamingVo> list = sqlSession.selectList("scbatis.nowStreaming2",mId);
		return list;
	}
	
	/*특정 1개의 방송정보를 가져오는 메소드*/
	public StreamingVo streamInfo(String mId) {
		StreamingVo vo = sqlSession.selectOne("scbatis.select", mId);
		return vo;
	}

	/*도네이션 출력을 위한 메소스*/
	public DonationVo donationView(String mId){
		DonationVo vo = new DonationVo();
		vo = sqlSession.selectOne("scbatis.donationView", mId);
		/*sqlSession.update("scbatis.donationStatusChange", vo.getDon_serial());*/
		return vo;
	}

	/*친구 검색시 사용되는 메소드*/
	public List<SCFriendListVo> findFriends(String mId){
		List<SCFriendListVo> list = new ArrayList<SCFriendListVo>();
		list = sqlSession.selectList("scbatis.findFriends",mId);
		return list;
	}

	/*카테고리 목록 정보*/
	public List<CategoriesVo> categories(){
		SCDao dao = new SCDao();
		List<CategoriesVo> list = new ArrayList<CategoriesVo>();
		list = sqlSession.selectList("scbatis.categories");
		for(int i = 0 ; i < list.size() ; i++){
			List<String> temp = new ArrayList<String>();
			String genre = list.get(i).getCat_genre();
			String[] gl = genre.split(",");
			for(int j = 0 ; j < gl.length ; j++){
				String agl = gl[j];
				temp.add(agl);
				if(j == 1) {
					break;
				}
			}
			list.get(i).setGenreList(temp);
		}

		return list;
	}

	public List<StreamingVo> allStreaming(){
		List<StreamingVo> list = new ArrayList<StreamingVo>();
		list = sqlSession.selectList("scbatis.nowStreaming");
		return list;
	}

}
