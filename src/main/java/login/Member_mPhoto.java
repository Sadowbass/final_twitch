package login;

public class Member_mPhoto {
	int    ph_serial;
	String ph_Id;
	String ph_oriFile;
	String ph_sysFile;
	
	public Member_mPhoto() {}
	public Member_mPhoto(String ori, String sys) {
		this.ph_oriFile = ori;
		this.ph_sysFile = sys;
	}
	public int getPh_serial() {
		return ph_serial;
	}
	public void setPh_serial(int ph_serial) {
		this.ph_serial = ph_serial;
	}
	public String getPh_Id() {
		return ph_Id;
	}
	public void setPh_Id(String ph_Id) {
		this.ph_Id = ph_Id;
	}
	public String getPh_oriFile() {
		return ph_oriFile;
	}
	public void setPh_oriFile(String ph_oriFile) {
		this.ph_oriFile = ph_oriFile;
	}
	public String getPh_sysFile() {
		return ph_sysFile;
	}
	public void setPh_sysFile(String ph_sysFile) {
		this.ph_sysFile = ph_sysFile;
	}
	
	
	
	
}
