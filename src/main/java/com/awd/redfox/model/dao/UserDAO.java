package com.awd.redfox.model.dao;

import com.awd.redfox.model.beans.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public UserDAO(Connection con) {
        this.con = con;
    }
    //User login
    public User userLogin(String email, String password){
        User user = null;
        try {
            query="select * from users where email=? and password=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs=pst.executeQuery();

            System.out.println(rs);
            if (rs.next()){
                user =new User();
                user.setuID(rs.getInt("uID"));
                user.setFirstname(rs.getString("FirstName"));
                user.setLastname(rs.getString("LastName"));
                user.setEmail(rs.getString("Email"));
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return user;
    }

    public List<User> getAllUsers() throws IOException {
        List<User> usersid=new ArrayList<User>();

        try {
            query="select * from users";
            pst=this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while(rs.next()){
                User row = new User();
                row.setuID(rs.getInt("uID"));
                row.setFirstname(rs.getString("FirstName"));
                row.setLastname(rs.getString("LastName"));
                row.setEmail(rs.getString("Email"));
                row.setPassword(rs.getString("Password"));

                usersid.add(row);

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return usersid;
    }
}


