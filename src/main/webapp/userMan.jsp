<%@page import="java.util.List"%>
<%@ page import="com.awd.redfox.model.dao.UserDAO" %>
<%@ page import="com.awd.redfox.data.DbCon" %>
<%@ page import="com.awd.redfox.model.beans.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%
    UserDAO umd=new UserDAO(DbCon.getConnection());
    List<User> users = umd.getAllUsers();
    request.setAttribute("USER_LIST", users);
%>


<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <title>User Management</title>
    <%@include file="includes/header.jsp"%>

    <style>
        .inner{
            margin: 15px 0;
        }
    </style>
</head>
<body>
<%@include file="includes/navbar.jsp"%>

<div class="container my-3">
    <div class="inner">
        <div class="row">
            <div class="col-md-3">
                <h3>
                    Input User/Employee Information</h3>
                <form action="User-Reg" method="post">
                    <div class="form-group">
                        <label>Firstname</label>
                        <input type="name" class="form-control" name="reg-name" placeholder="Enter your Firstname" required="required">
                    </div>
                    <div class="form-group">
                        <label>Lastname</label>
                        <input type="surname" class="form-control" name="reg-surname" placeholder="Enter your Lastname" required="required">
                    </div>
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" class="form-control" name="reg-email" placeholder="Enter your email" required="required">
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" name="reg-password" placeholder="Enter your password" required="required">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-primary">Reset</button>
                </form>
            </div>
            <div class="col-md-9">
                <h3>
                    User Information From Database</h3>
                <table class="table">
                    <thead class="bg-light">
                    <tr>
                        <th scope="col">FirstName</th>
                        <th scope="col">LastName</th>
                        <th scope="col">Email Adress</th>
                        <th scope="col">Password</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="tempUser" items="${USER_LIST}">
                        <tr>
                            <td>${tempUser.firstname }</td>
                            <td>${tempUser.lastname }</td>
                            <td>${tempUser.email }</td>
                            <td>${tempUser.password}</td>
                            <td><a href="editUser.jsp?id=${tempUser.uID }">Edit</a>
                                <a href="DeleteUserServlet?id=${tempUser.uID}">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <a href="adminPanel.jsp">Go back to admin panel</a>
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp"%>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>

