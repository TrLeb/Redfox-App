package com.awd.redfox.model.dao;

import com.awd.redfox.model.beans.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public AdminDAO(Connection con) {
        this.con = con;
    }
    public Admin adminLogIn(String Email, String Password){
        Admin admin = null;
        try {
            query="select * from administrators where Email=? and Password=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, Email);
            pst.setString(2, Password);
            rs=pst.executeQuery();

            if (rs.next()){
                admin =new Admin();
                admin.setaID(rs.getInt("aID"));
                admin.setFirstname(rs.getString("FirstName"));
                admin.setLastname(rs.getString("LastName"));
                admin.setEmail(rs.getString("Email"));
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return admin;
    }

}
