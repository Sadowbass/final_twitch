package bean;

public class OnAirVo {
	String air_mid;
	String air_gname;
	int cnt;//시청자 수 
	int cnt2;// 카테고리 별 방송중인 사람 수

	public int getCnt2() {
		return cnt2;
	}
	public void setCnt2(int cnt2) {
		this.cnt2 = cnt2;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getAir_mid() {
		return air_mid;
	}
	public void setAir_mid(String air_mid) {
		this.air_mid = air_mid;
	}
	public String getAir_gname() {
		return air_gname;
	}
	public void setAir_gname(String air_gname) {
		this.air_gname = air_gname;
	}
	
	
}
