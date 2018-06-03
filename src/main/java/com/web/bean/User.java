package com.web.bean;

public class User {
    private Integer id;

    private String username;

    private String password;

    private String email;

    private Integer degree;

    private Integer credit;

    private String phone;

    private Integer exp;

    public User(String username, String password, String email, Integer degree, Integer credit, String phone, Integer exp){
        this.username = username;
        this.password = password;
        this.email = email;
        this.degree = degree;
        this.credit = credit;
        this.phone = phone;
        this.exp = exp;
    }

    public User(){

    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getDegree() {
        return degree;
    }

    public void setDegree(Integer degree) {
        this.degree = degree;
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getExp() {
        return exp;
    }

    public void setExp(Integer exp) {
        this.exp = exp;
    }


}