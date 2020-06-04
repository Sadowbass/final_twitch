package bean;

import java.util.ArrayList;
import java.util.List;

public class StreamingVo {
    private int rno;
    private String mem_id;
    private String mem_skey;
    private String air_mid;
    private String air_subject;
    private String air_content;
    private String air_gname;
    private String air_tnames;
    private String air_thumbnail;
    private String ph_sysfile;
    private String cat_sysfile;
    private int cnt;
    private int totCnt;
    private List<String> tlist = new ArrayList<String>();
    

    public int getTotCnt() {
        return totCnt;
    }

    public void setTotCnt(int totCnt) {
        this.totCnt = totCnt;
    }

    public String getCat_sysfile() {
        return cat_sysfile;
    }

    public void setCat_sysfile(String cat_sysfile) {
        this.cat_sysfile = cat_sysfile;
    }

    public List<String> getTlist() {
        return tlist;
    }

    public void setTlist(List<String> tlist) {
        this.tlist = tlist;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

    public int getRno() {
        return rno;
    }

    public void setRno(int rno) {
        this.rno = rno;
    }

    public String getMem_id() {
        return mem_id;
    }

    public void setMem_id(String mem_id) {
        this.mem_id = mem_id;
    }

    public String getMem_skey() {
        return mem_skey;
    }

    public void setMem_skey(String mem_skey) {
        this.mem_skey = mem_skey;
    }

    public String getAir_mid() {
        return air_mid;
    }

    public void setAir_mid(String air_mid) {
        this.air_mid = air_mid;
    }

    public String getAir_subject() {
        return air_subject;
    }

    public void setAir_subject(String air_subject) {
        this.air_subject = air_subject;
    }

    public String getAir_gname() {
        return air_gname;
    }

    public void setAir_gname(String air_gname) {
        this.air_gname = air_gname;
    }

    public String getPh_sysfile() {
        return ph_sysfile;
    }

    public void setPh_sysfile(String ph_sysfile) {
        this.ph_sysfile = ph_sysfile;
    }

    public String getAir_content() {
        return air_content;
    }

    public void setAir_content(String air_content) {
        this.air_content = air_content;
    }

    public String getAir_tnames() {
        return air_tnames;
    }

    public void setAir_tnames(String air_tnames) {
        this.air_tnames = air_tnames;
    }

    public String getAir_thumbnail() {
        return air_thumbnail;
    }

    public void setAir_thumbnail(String air_thumbnail) {
        this.air_thumbnail = air_thumbnail;
    }

}
