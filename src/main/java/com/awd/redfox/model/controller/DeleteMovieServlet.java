package com.awd.redfox.model.controller;

import com.awd.redfox.data.DbCon;
import com.awd.redfox.model.dao.MovieDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DeleteMovieServlet", value = "/DeleteMovieServlet")
public class DeleteMovieServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int mid = Integer.parseInt(request.getParameter("mID"));

        try{
            MovieDAO bkd = new MovieDAO(DbCon.getConnection());
            bkd.deleteMovie(mid);
            response.sendRedirect("index.jsp");
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
