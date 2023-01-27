<%@ page import="com.awd.redfox.model.beans.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <title>EDIT MOVIE</title>
  <%@include file="includes/header.jsp"%>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container">
  <div class="card w-50 mx-auto my-5">
    <div class="card-header text-center">
      <h4>EDIT MOVIE </h4>
    </div>
    <div class="card-body">
      <form action="EditMoviesServlet" method="post" enctype="multipart/form-data">
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
        <div class="text-center my-2">
          <button type="submit" class="btn btn-success">Submit</button>
        </div>
        <div class="text-center my-2">
          <a href="adminPanel.jsp">Cancel</a>
        </div>
      </form>
    </div>
  </div>
</div>

</body>
</html>
