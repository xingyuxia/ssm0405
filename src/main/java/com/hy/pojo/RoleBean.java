package com.hy.pojo;


public class RoleBean {

    private Integer rid;
    private String role;

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "RoleBean{" +
                "rid=" + rid +
                ", role='" + role + '\'' +
                '}';
    }
}
