<%@ page import="com.awd.redfox.model.beans.User" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.awd.redfox.model.beans.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.awd.redfox.data.DbCon" %>
<%@ page import="com.awd.redfox.model.dao.OrderDAO" %>
<%@ page import="com.awd.redfox.model.beans.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User) request.getSession().getAttribute("auth");
    List<Order> orders = null;
    if (auth != null) {
        request.setAttribute("person", auth);
        OrderDAO orderDao  = new OrderDAO(DbCon.getConnection());
        orders = orderDao.userOrders(auth.getuID());
    }else{
        response.sendRedirect("login.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }

%>
<html>
<head>
    <title>Movie Orders</title>
    <%@include file="includes/header.jsp"%>

</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container">
    <div class="card-header my-3">All Orders</div>
    <table class="table table-light">
        <thead>
        <tr>
            <th scope="col">Date</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col">Quantity</th>
            <th scope="col">Price</th>
            <th scope="col">Cancel</th>
        </tr>
        </thead>
        <tbody>

        <%
            if(orders != null){
                for(Order o:orders){%>
        <tr>
            <td><%=o.getDate() %></td>
            <td><%=o.getQunatity() %></td>
            <td><%=dcf.format(o.getPrice()) %></td>
            <td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
            <td><a class="btn btn-sm btn-success" href="rateMovie.jsp?id=<%=o.getOrderId()%>">Rate</a></td>
        </tr>
        <%}
        }
        %>

        </tbody>
    </table>
</div>
<%@include file="includes/footer.jsp"%>
</body>
</html>
