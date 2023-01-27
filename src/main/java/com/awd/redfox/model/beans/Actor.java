package com.awd.redfox.model.beans;

import java.io.Serializable;

public class Actor implements Serializable {

    private int aId;
    private String fname;
    private String lname;
    private String dob;

    public Actor() {
    }

    public Actor(int aId, String fname, String lname, String dob) {
        this.aId = aId;
        this.fname = fname;
        this.lname = lname;
        this.dob = dob;
    }

    public int getaId() {
        return aId;
    }

    public void setaId(int aId) {
        this.aId = aId;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }
}
