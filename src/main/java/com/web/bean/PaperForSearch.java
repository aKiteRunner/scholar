package com.web.bean;

import java.util.Date;

public class PaperForSearch {
    private Integer id;

    private String name;

    private Double popularity;

    private String abstract1;

    private String scholarname;

    private Date time;

    public PaperForSearch(int id, String name, double popularity, String abstract1, String scholarname, Date time){
        this.id = id;
        this.name = name;
        this.popularity = popularity;
        this.abstract1 = abstract1;
        this.scholarname = scholarname;
        this.time = time;
    }

    public void setTime(Date time){ this.time = time; }

    public void setScholarname(String scholarname) {
        this.scholarname = scholarname;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPopularity(Double popularity) {
        this.popularity = popularity;
    }

    public void setAbstract1(String abstract1) {
        this.abstract1 = abstract1;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Double getPopularity() {
        return popularity;
    }

    public String getAbstract1() {
        return abstract1;
    }

    public String getScholarname() {
        return scholarname;
    }

    public Date getTime() { return time; }
}
