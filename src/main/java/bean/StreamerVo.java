package bean;

public class StreamerVo {
	String mem_id;
	String mem_name;
	String mem_status;
	String mem_email;
	String profit;//총 수익
	String cnt;//팔로워 수 
	String cnt2;//구독자 수 
	String av_view;//평균 시청자 수 
	String sub_profit;//구독 수익;
	String don_profit;//도네 수익;
	String ph_sysfile;//프로필 사진
	String don_mid;
	String sub_mid;
	String don_oid;
	String sub_oid;
	String month;
	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDon_oid() {
		return don_oid;
	}
	public void setDon_oid(String don_oid) {
		this.don_oid = don_oid;
	}
	public String getSub_oid() {
		return sub_oid;
	}
	public void setSub_oid(String sub_oid) {
		this.sub_oid = sub_oid;
	}
	int rn;//순번 
	
	public String getSub_mid() {
		return sub_mid;
	}
	public void setSub_mid(String sub_mid) {
		this.sub_mid = sub_mid;
	}
	
	
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public String getDon_mid() {
		return don_mid;
	}
	public void setDon_mid(String don_mid) {
		this.don_mid = don_mid;
	}
	public String getCnt2() {
		return cnt2;
	}
	public void setCnt2(String cnt2) {
		this.cnt2 = cnt2;
	}
	public String getAv_view() {
		return av_view;
	}
	public void setAv_view(String av_view) {
		this.av_view = av_view;
	}
	public String getSub_profit() {
		return sub_profit;
	}
	public void setSub_profit(String sub_profit) {
		this.sub_profit = sub_profit;
	}
	public String getDon_profit() {
		return don_profit;
	}
	public void setDon_profit(String don_profit) {
		this.don_profit = don_profit;
	}
	public String getPh_sysfile() {
		return ph_sysfile;
	}
	public void setPh_sysfile(String ph_sysfile) {
		this.ph_sysfile = ph_sysfile;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public String getProfit() {
		return profit;
	}
	public void setProfit(String profit) {
		this.profit = profit;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_status() {
		return mem_status;
	}
	public void setMem_status(String mem_status) {
		this.mem_status = mem_status;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	
	
}
