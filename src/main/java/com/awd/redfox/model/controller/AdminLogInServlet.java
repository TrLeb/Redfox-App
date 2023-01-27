package com.awd.redfox.model.controller;

import com.awd.redfox.data.DbCon;
import com.awd.redfox.model.beans.Admin;
import com.awd.redfox.model.dao.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "AdminLogInServlet", value = "/AdminLogIn")
public class AdminLogInServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("adminLogin.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()){
            String aemail = request.getParameter("alogin-email");
            String apassword = request.getParameter("alogin-password");

            try {
                AdminDAO aDao= new AdminDAO(DbCon.getConnection());
                Admin admin= aDao.adminLogIn(aemail,apassword);

                if (admin!=null){
                    //on successfull login redirect user to index and set user value to session
                    request.getSession().setAttribute("sesh",admin);
                    response.sendRedirect("adminPanel.jsp");
                }else {
                    out.print("admin login failed ");
                }
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }
}
