package com.awd.redfox.model.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "RegistrationServlet", value = "/User-Reg")
public class RegistrationServlet extends HttpServlet {
    private final static String query = "insert into users(firstname,lastname,email,password) VALUES (?, ?, ?,?)";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()){
            String firstname = request.getParameter("reg-name");
            String lastname = request.getParameter("reg-surname");
            String email = request.getParameter("reg-email");
            String password = request.getParameter("reg-password");

            //load jdbcp
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            }catch(Exception e) {
                e.printStackTrace();
            }
            //generate the connection
            try(Connection con = DriverManager.getConnection("jdbc:mysql://localhost:/redfox_movies","root","qwertyui");
                PreparedStatement ps = con.prepareStatement(query);){
                //set the values
                ps.setString(1, firstname);
                ps.setString(2, lastname);
                ps.setString(3, email);
                ps.setString(4, password);

                //execute the query
                int count = ps.executeUpdate();

                if(count==1) {
                    response.sendRedirect("login.jsp");
                }else {
                    out.print("Registration failed");
                }
            }catch(SQLException se) {
               out.println("<h2 class='bg-danger text-light text-center'>"+se.getMessage()+"</h2>");
                se.printStackTrace();
            }catch(Exception e) {
                e.printStackTrace();
            }

        }
    }
}
