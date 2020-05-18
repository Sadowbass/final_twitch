package bean;

import java.util.List;

public class CategoriesVo {
    private int cat_serial;
    private String cat_gname;
    private String cat_genre;
    private String cat_sysfile;
    private List<String> genreList;

    public int getCat_serial() {
        return cat_serial;
    }

    public void setCat_serial(int cat_serial) {
        this.cat_serial = cat_serial;
    }

    public String getCat_gname() {
        return cat_gname;
    }

    public void setCat_gname(String cat_gname) {
        this.cat_gname = cat_gname;
    }

    public String getCat_genre() {
        return cat_genre;
    }

    public void setCat_genre(String cat_genre) {
        this.cat_genre = cat_genre;
    }

    public String getCat_sysfile() {
        return cat_sysfile;
    }

    public void setCat_sysfile(String cat_sysfile) {
        this.cat_sysfile = cat_sysfile;
    }

    public List<String> getGenreList() {
        return genreList;
    }

    public void setGenreList(List<String> genreList) {
        this.genreList = genreList;
    }
}
