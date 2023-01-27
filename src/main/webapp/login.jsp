<%@ page import="com.awd.redfox.model.beans.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html>
<head>
    <title>Redfox login</title>
    <%@include file="includes/header.jsp"%>
</head>
<body>
<%@include file="includes/navbar.jsp"%>

<div class="container">
    <div class="card w-50 mx-auto my-5">
        <div class="card-header text-center">
            <h4>User LogIn</h4>
            <p>Enter your credentials to log in</p>
        </div>
        <div class="card-body">
            <form action="user-LogIn" method="post">
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" class="form-control" name="login-email" placeholder="Enter your email" required="required">
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name="login-password" placeholder="Enter your password" required="required">

                    <div class="text-center my-2">
                        <button type="submit" class="btn btn-primary">LogIn</button>
                    </div>
                    <div class="text-center my-2">
                        <a href="register.jsp">I don't have an account</a>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp"%>
</body>
</html>