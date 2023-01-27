<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@ page import="com.awd.redfox.model.dao.MovieDAO" %>
<%@ page import="com.awd.redfox.data.DbCon" %>
<%@ page import="com.awd.redfox.model.beans.Movie" %>
<%@ page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    MovieDAO md= null;
    try {
        md = new MovieDAO(DbCon.getConnection());
    } catch (ClassNotFoundException | SQLException e) {
        throw new RuntimeException(e);
    }
    List<Movie> movies = md.getAllMovies();
    request.setAttribute("MOVIE_LIST", movies);
%>


<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <title>Movie Management</title>
    <%@include file="includes/header.jsp"%>



</head>
<body>
<%@include file="includes/navbar.jsp"%>

<div class="container my-3">
    <div class="inner">
        <div class="row">
            <div class="col-md-3">
                <h3>
                    Input Movie Information</h3>
                <form action="AddMovie" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>Movie Title</label>
                        <input type="name" class="form-control" name="m-title" placeholder="Enter your movie name" required="required">
                    </div>
                    <div class="form-group">
                        <label>Director</label>
                        <input type="director" class="form-control" name="m-director" placeholder="Enter director" required="required">
                    </div>
                    <div class="form-group">
                        <label>Actors</label>
                        <input type="actors" class="form-control" name="m-actors" placeholder="Enter name of actors" required="required">
                    </div>
                    <div class="form-group">
                        <label>Genre</label>
                        <input type="genre" class="form-control" name="m-genre" placeholder="Enter genre" required="required">
                    </div>
                    <div class="form-group">
                        <label>Released</label>
                        <input type="genre" class="form-control" name="m-year" placeholder="Enter date the movie was released" required="required">
                    </div>
                    <div class="form-group">
                        <label>Synopsis</label>
                        <input type="rdate" class="form-control" name="m-synopsis" placeholder="Enter brief description of the movie" required="required">
                    </div>
                    <div class="form-group">
                        <input type="file" name="file"></label>
                    </div>
                    <div class="form-group">
                        <label>Price</label>
                        <input type="price" class="form-control" name="m-price" placeholder="Enter price" required="required">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-primary">Reset</button>
                </form>

            </div>
            <div class="col-md-9">
                <h3>
                    Movie Information From Database</h3>
                <table class="table">
                    <thead class="bg-light">
                    <tr>
                        <th scope="col">Movie Name</th>
                        <th scope="col">Director</th>
                        <th scope="col">Genre</th>
                        <th scope="col">Released</th>
                        <th scope="col">Synopsis</th>
                        <th scope="col">Image</th>
                        <th scope="col">Actors</th>
                        <th scope="col">Rating</th>
                        <th scope="col">Price</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="tempspace" items="${MOVIE_LIST}">
                        <tr>
                            <td>${tempspace.title }</td>
                            <td>${tempspace.director }</td>
                            <td>${tempspace.genre }</td>
                            <td>${tempspace.dateReleased}</td>
                            <td>${tempspace.synopsis }</td>
                            <td>${tempspace.image }</td>
                            <td>${tempspace.actors }</td>
                            <td>${tempspace.rating }</td>
                            <td>${tempspace.price }</td>
                            <td>${tempspace.price }</td>
                            <td><a href="editMovie.jsp?id=${tempspace.mID }">Edit</a>
                                <a href="DeleteMovieServlet?id=${tempspace.mID}">Delete</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <a href="adminPanel.jsp">Go back to admin panel</a>
            </div>
        </div>
    </div>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<%@include file="includes/footer.jsp"%>
</body>
</html>

