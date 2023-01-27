package com.awd.redfox.model.dao;

import com.awd.redfox.model.beans.Cart;
import com.awd.redfox.model.beans.Movie;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;


    public MovieDAO(Connection con) {
        this.con = con;
    }


    public List<Movie> getAllMovies() throws IOException {
        List<Movie> movies=new ArrayList<Movie>();

        try {
            query="select * from movies";
            pst=this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while(rs.next()){
                Movie row = new Movie();
                row.setmID(rs.getInt("mID"));
                row.setTitle(rs.getString("Title"));
                row.setDirector(rs.getString("Director"));
                row.setActors(rs.getString("Actors"));
                row.setGenre(rs.getString("Genre"));
                row.setDateReleased(LocalDate.parse(rs.getString("Year")));
                row.setRating(rs.getInt("Rating"));
                row.setImage(rs.getString("Image"));
                row.setSynopsis(rs.getString("Synopsis"));
                row.setPrice(rs.getDouble("Price"));

                movies.add(row);

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return movies;
    }
    public List<Movie> getUpcomingMovies() throws IOException {
        List<Movie> umovies=new ArrayList<Movie>();

        try {
            query="select * from movies";
            pst=this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while(rs.next()){
                Integer mID =rs.getInt("mID");
                String Title=rs.getString("Title");
                String Director=rs.getString("Director");
                String Actors = rs.getString("Actors");
                String Genre = rs.getString("Genre");
                LocalDate dateReleased = LocalDate.parse(rs.getString("Year"));
                Integer Rating= rs.getInt("Rating");
                String Image=rs.getString("Image");
                String synopsis = rs.getString("Synopsis");
                Double Price=rs.getDouble("Price");

                if(LocalDate.now().isBefore(dateReleased)){
                    Movie  movie=new Movie(mID, Title, Director, Actors, Genre, dateReleased,Rating, Image, synopsis, Price);
                    umovies.add(movie);
                }
            }
            return umovies;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
    public List<Movie> getLatestMovies() throws IOException {
        List<Movie> lmovies=new ArrayList<Movie>();

        try {
            query="select * from movies";
            pst=this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while(rs.next()){

                Integer mID =rs.getInt("mID");
                String Title=rs.getString("Title");
                String Director=rs.getString("Director");
                String Actors = rs.getString("Actors");
                String Genre = rs.getString("Genre");
                LocalDate dateReleased = LocalDate.parse(rs.getString("Year"));
                Integer Rating= rs.getInt("Rating");
                String Image=rs.getString("Image");
                String synopsis = rs.getString("Synopsis");
                Double Price=rs.getDouble("Price");

                if ((dateReleased.isAfter(LocalDate.of(2022,04,01))) && LocalDate.now().isAfter(dateReleased)){
                    Movie  movie=new Movie(mID, Title, Director, Actors, Genre, dateReleased,Rating, Image, synopsis, Price);
                    lmovies.add(movie);
                }
            }
            return lmovies;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public List<Movie> getRecMovies() throws IOException {
        List<Movie> lmovies=new ArrayList<Movie>();

        try {
            query="select * from movies";
            pst=this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while(rs.next()){

                Integer mID =rs.getInt("mID");
                String Title=rs.getString("Title");
                String Director=rs.getString("Director");
                String Actors = rs.getString("Actors");
                String Genre = rs.getString("Genre");
                LocalDate dateReleased = LocalDate.parse(rs.getString("Year"));
                Integer Rating= rs.getInt("Rating");
                String Image=rs.getString("Image");
                String synopsis = rs.getString("Synopsis");
                Double Price=rs.getDouble("Price");

                if ((dateReleased.isAfter(LocalDate.of(2022,04,01))) && LocalDate.now().isAfter(dateReleased)){
                    Movie  movie=new Movie(mID, Title, Director, Actors, Genre, dateReleased,Rating, Image, synopsis, Price);
                    lmovies.add(movie);
                }
            }
            return lmovies;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public List<Movie> getMoviesID() throws IOException {
        List<Movie> moviesid=new ArrayList<Movie>();

        try {
            query="select * from movies";
            pst=this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while(rs.next()){
                Movie row = new Movie();
                row.setmID(rs.getInt("mID"));

                moviesid.add(row);

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return moviesid;
    }
    //    Edit Movie information
    public boolean editMovieInfo(Movie movie){

        try{
            String query = "update movies set Title=?, Director=?, Genre=?, Actors=?, Year=?, Rating=?, Image=?, Synopsis=? where mID=?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, movie.getTitle());
            pt.setString(2, movie.getDirector());
            pt.setString(3, movie.getGenre());
            pt.setString(4, movie.getActors());
            pt.setString(5, String.valueOf(movie.getDateReleased()));
            pt.setString(6, movie.getImage());
            pt.setString(7, movie.getSynopsis());
            pt.setInt(8, movie.getmID());

            pt.executeUpdate();
        }catch(Exception ex){
            ex.printStackTrace();;
        }


        return false;
    }

    public Movie getSingleMovie(int mID){
        Movie movie = null;

        try{
            String query = "select * from movies where mID=? ";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, mID);
            ResultSet rs= pt.executeQuery();

            while(rs.next()){
                movie = new Movie();
                movie.setmID(rs.getInt("mID"));
                movie.setTitle(rs.getString("Title"));
                movie.setDirector(rs.getString("Director"));
                movie.setActors(rs.getString("Actors"));
                movie.setGenre(rs.getString("Genre"));
                movie.setDateReleased(LocalDate.parse(rs.getString("Year")));
                movie.setRating(rs.getInt("Rating"));
                movie.setImage(rs.getString("Image"));
                movie.setSynopsis(rs.getString("Synopsis"));
                movie.setPrice(rs.getDouble("Price"));
            }
        }catch(Exception ex){
            ex.printStackTrace();;
            System.out.println(ex.getMessage());
        }
        return movie;
    }




    public void deleteMovie(int mID){
        try{

            String query= "drop from movies where mID=?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, mID);
            pt.execute();
            System.out.println("deleted");

        }catch(Exception ex){
            ex.printStackTrace();;
        }
    }

    public List<Cart> getCartMovies(ArrayList<Cart> cartList){
        List<Cart> movies = new ArrayList<Cart>();

        try {
            if (cartList.size()>0){
                for (Cart item:cartList){
                    query= "select * from movies where mID=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getmID());
                    rs = pst.executeQuery();
                    while (rs.next()){
                        Cart row = new Cart();
                        row.setmID(rs.getInt("mID"));
                        row.setTitle(rs.getString("Title"));
                        row.setGenre(rs.getString("Genre"));
                        row.setPrice(rs.getDouble("Price")* item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        movies.add(row);
                    }
                }

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return movies;
    }
    public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select price from movies where mID=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getmID());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum+=rs.getDouble("price")*item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }

    /*public Blob getImage() {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:/redfox_movies", "root", "qwertyui");
            stmt = con.createStatement();
            rs = stmt.executeQuery("select image from movies where id = '1'");
            if (rs.next()) {
                image = (Blob) rs.getBlob(1);
                imgData = image.getBytes(1, (int) image.length());
            } else {
                out.println("ERROR NO IMAGE CAN BE DISPLAYED");
            }
            return image;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }*/



    //upload movies
    public boolean addmovie(Movie movie){
        Movie movies= new Movie();
        boolean flag = false;
        try {
            query = "insert into movies(Title,Director,Actors,Genre,Year,Image,Synopsis,Price) VALUES (?, ?, ?, ?,?, ?, ?,?)";
                pst=this.con.prepareStatement(query);
                rs = pst.executeQuery();
                while(rs.next()){
                Movie row = new Movie();
                row.setmID(rs.getInt("mID"));
                row.setTitle(rs.getString("Title"));
                row.setDirector(rs.getString("Director"));
                row.setActors(rs.getString("Actors"));
                row.setGenre(rs.getString("Genre"));
                row.setDateReleased(LocalDate.parse(rs.getString("Year")));
                row.setRating(rs.getInt("Rating"));
                row.setImage(rs.getString("Image"));
                row.setSynopsis(rs.getString("Synopsis"));
                row.setPrice(rs.getDouble("Price"));

                flag=true;

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }


}


