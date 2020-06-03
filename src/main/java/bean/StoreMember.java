package bean;

public class StoreMember {
	
	/*
	MEM_ID
	MEM_PWD
	MEM_BIRTH
	MEM_NAME
	MEM_PROFILE
	MEM_RDATE
	MEM_EMAIL
	MEM_MONEY
	MEM_STATUS
	MEM_ADMIN
	MEM_SKEY
	MEM_ZCODE
	MEM_ADD1
	MEM_ADD2
	*/
	
	String mem_id;
	String mem_name;
	String mem_email;
	int mem_money;
	
	
	
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
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
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public int getMem_money() {
		return mem_money;
	}
	public void setMem_money(int mem_money) {
		this.mem_money = mem_money;
	}
	
	

}
