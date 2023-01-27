package com.awd.redfox.model.controller;

import com.awd.redfox.data.DbCon;
import com.awd.redfox.model.beans.Movie;
import com.awd.redfox.model.dao.MovieDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

@WebServlet(name = "EditMoviesServlet", value = "/EditMoviesServlet")
public class EditMoviesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        int mID1 = Integer.parseInt(request.getParameter("mID"));
        String title = request.getParameter("Title");
        String director = request.getParameter("Director");
        String actors = request.getParameter("Actors");
        String genre = request.getParameter("Genre");
        LocalDate dateReleased = LocalDate.parse(request.getParameter("Year"));
        int rating = Integer.parseInt(request.getParameter("Rating"));
        String image1=request.getParameter("Image");
        String synopsis= request.getParameter("Synopsis");
        Double price= Double.valueOf(request.getParameter("Price"));
        Movie mv = new Movie(mID1,title,director,actors,genre,dateReleased,rating,image1,synopsis,price);

        try{
            MovieDAO mdao = new MovieDAO(DbCon.getConnection());
            if(mdao.editMovieInfo(mv)){
                response.sendRedirect("index.jsp");
            }else{
                out.print("Edit unsuccessful");
            }


        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
