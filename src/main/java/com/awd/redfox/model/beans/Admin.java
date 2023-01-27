package com.awd.redfox.model.beans;

import java.io.Serializable;

public class Admin implements Serializable {
    protected int aID;
    protected String firstname;
    protected String lastname;
    protected String email;
    protected String password;

    public Admin() {
    }

    public Admin(int aID, String firstname, String lastname, String email, String password) {
        this.aID = aID;
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
    }

    public int getaID() {
        return aID;
    }

    public void setaID(int aID) {
        this.aID = aID;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
