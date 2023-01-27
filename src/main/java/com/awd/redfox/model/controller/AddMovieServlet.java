package com.awd.redfox.model.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


@WebServlet(name = "AddMovieServlet", value = "/AddMovie")
@MultipartConfig(fileSizeThreshold = 1024* 1024 * 2,
maxFileSize = 1024 * 1024 * 10,
maxRequestSize = 1024 * 1024 * 150)

public class AddMovieServlet extends HttpServlet {

    public static final String UPLOAD_DIR = "img";
    public String dbFileName = "";


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html:charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String title = request.getParameter("m-title");
            String director = request.getParameter("m-director");
            String actors = request.getParameter("m-actors");
            String genre = request.getParameter("m-genre");
            String year = request.getParameter("m-year");
            Part part = request.getPart("file");//
            String fileName = extractFileName(part);//file nam
            String applicationPath = getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
            System.out.println("applicationPath:" + applicationPath);
            File fileUploadDirectory = new File(uploadPath);
            if (!fileUploadDirectory.exists()) {
                fileUploadDirectory.mkdirs();
            }
            String savePath = uploadPath + File.separator + fileName;
            System.out.println("fileName: " + fileName);
            System.out.println("savePath: " + savePath);
            String sRootPath = new File(savePath).getAbsolutePath();
            System.out.println("sRootPath: " + sRootPath);
            part.write(savePath + File.separator);
            File fileSaveDir1 = new File(savePath);

            dbFileName = UPLOAD_DIR + File.separator + fileName;
            part.write(savePath + File.separator);

            String synopsis = request.getParameter("m-synopsis");
            Double price = Double.valueOf(request.getParameter("m-price"));

            //load jdbcp
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:/redfox_movies","root","qwertyui");
                PreparedStatement ps = con.prepareStatement("insert into movies(Title,Director,Actors,Genre,Year,Image,Synopsis,Price) VALUES (?, ?, ?, ?,?, ?, ?,?)");
                //set the values
                ps.setString(1, title);
                ps.setString(2, director);
                ps.setString(3, actors);
                ps.setString(4, genre);
                ps.setString(5, year);
                ps.setString(6, fileName);
                ps.setString(7, synopsis);
                ps.setDouble(8, price);

                ps.executeUpdate();
                response.sendRedirect("adminPanel.jsp");
                } catch (Exception e) {
                    out.println(e);
                }

            } catch(Exception e) {
                e.printStackTrace();
            }


        }
    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
    private String getIname(Path savePath){
        Path fsavePath = Paths.get("savePath");

        // call getFileName() and get FileName path object
        Path fileNam = fsavePath.getFileName();

        return String.valueOf(fileNam);
    }
}
