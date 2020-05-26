package bean;

public class UserInfoVo {
    private String mem_id;
    private String ph_sysfile;
    private String mem_pwd;
    private String mem_name;
    private int mem_admin;

    public String getMem_id() {
        return mem_id;
    }

    public void setMem_id(String mem_id) {
        this.mem_id = mem_id;
    }

    public String getPh_sysfile() {
        return ph_sysfile;
    }

    public void setPh_sysfile(String ph_sysfile) {
        this.ph_sysfile = ph_sysfile;
    }

    public String getMem_pwd() {
        return mem_pwd;
    }

    public void setMem_pwd(String mem_pwd) {
        this.mem_pwd = mem_pwd;
    }

    public String getMem_name() {
        return mem_name;
    }

    public void setMem_name(String mem_name) {
        this.mem_name = mem_name;
    }

	public int getMem_admin() {
		return mem_admin;
	}

	public void setMem_admin(int mem_admin) {
		this.mem_admin = mem_admin;
	}
    
    
}
