
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="com.awd.redfox.model.beans.User" %>
<%@ page import="com.awd.redfox.model.dao.MovieDAO" %>
<%@ page import="com.awd.redfox.data.DbCon" %>
<%@ page import="com.awd.redfox.model.beans.Movie" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
    <%@include file="includes/header.jsp"%>
</head>
<body>
<%@include file="includes/navbar.jsp"%>

<div class="container">
    <div class="card-header my-3">ADMINISTRATOR'S PANEL</div>
    <div class="row">
        <div class="col-md-4 my-3">
            <div class="card " style="width: 18rem;">
                <a href="userMan.jsp">
                    <img class="card-img-top" src="img/USERS.png" alt="Card image cap">
                </a>
            </div>
        </div>
        <div class="col-md-4 my-3">
            <div class="card " style="width: 18rem;">
                <a href="movieMan.jsp">
                    <img class="card-img-top" src="img/movie.png" alt="Card image cap">
                </a>
            </div>
        </div>
        <div class="col-md-4 my-3">
            <div class="card " style="width: 18rem;">
                <a href="empMg">
                    <img class="card-img-top" src="img/EMPLOYEE.png" alt="Card image cap">
                </a>
            </div>
        </div>
        <div class="col-md-4 my-3">
            <div class="card " style="width: 18rem;">
                <a href="">
                    <img class="card-img-top" src="img/reviews.png" alt="Card image cap">
                </a>
            </div>
        </div>
        <div class="col-md-4 my-3">
            <div class="card " style="width: 18rem;">
                <a href="#">
                    <img class="card-img-top" src="img/STATS.png" alt="Card image cap">
                </a>
            </div>
        </div>
        <div class="col-md-4 my-3">
            <div class="card " style="width: 18rem;">
                <a href="">
                    <img class="card-img-top" src="img/feedback.png" alt="Card image cap">
                </a>
            </div>
        </div>
     </div>
 </div>


        <%@include file="includes/footer.jsp"%>
</body>
</html>