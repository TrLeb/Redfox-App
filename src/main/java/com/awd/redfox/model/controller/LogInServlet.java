package com.awd.redfox.model.controller;


import com.awd.redfox.data.DbCon;
import com.awd.redfox.model.beans.User;
import com.awd.redfox.model.dao.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "LogInServlet", value = "/user-LogIn")
public class LogInServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()){
            String email = request.getParameter("login-email");
            String password = request.getParameter("login-password");

            try {
                UserDAO uDao= new UserDAO(DbCon.getConnection());
                User user = uDao.userLogin(email,password);

                if (user!=null){
                    //on successfull login redirect user to index and set user value to session
                    request.getSession().setAttribute("auth",user);
                    response.sendRedirect("index.jsp");
                }else {
                    out.print("user login failed ");
                }
            } catch (ClassNotFoundException | SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }
}

