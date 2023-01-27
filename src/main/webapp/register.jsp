<%@ page import="com.awd.redfox.model.beans.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <title>SignUp</title>
    <%@include file="includes/header.jsp"%>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container">
    <div class="card w-50 mx-auto my-5">
        <div class="card-header text-center">
            <h4>User Registration</h4>
            <p>To sign up enter your details on the form below </p>
        </div>
        <div class="card-body">
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
                <div class="text-center my-2">
                    <button type="submit" class="btn btn-success">SignUp</button>
                </div>
                <div class="text-center my-2">
                    <a href="login.jsp">Already have an account?Log In</a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
