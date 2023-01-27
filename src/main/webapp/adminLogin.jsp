<%@ page import="com.awd.redfox.model.beans.Admin" %>
<%@ page import="com.awd.redfox.model.beans.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("person", auth);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin login</title>
    <%@include file="includes/header.jsp"%>
</head>
<body>
<%@include file="includes/navbar.jsp"%>

<div class="container">
    <div class="card w-50 mx-auto my-5">
        <div class="card-header text-center">Employee Login</div>
        <div class="card-body">
            <form action="AdminLogIn" method="post">
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" class="form-control" name="alogin-email" placeholder="Enter your email" required="required">
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name="alogin-password" placeholder="Enter your password" required="required">
                    <div class="text-center my-2">
                        <button type="submit" class="btn btn-primary">LogIn</button>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp"%>
</body>
</html>