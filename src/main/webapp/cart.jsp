<%@ page import="com.awd.redfox.model.beans.User" %>
<%@ page import="com.awd.redfox.model.beans.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.awd.redfox.model.dao.MovieDAO" %>
<%@ page import="com.awd.redfox.data.DbCon" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if (cart_list != null) {
        MovieDAO mDao = new MovieDAO(DbCon.getConnection());
        cartProduct = mDao.getCartMovies(cart_list);
        double total = mDao.getTotalCartPrice(cart_list);
        request.setAttribute("total", total);
        request.setAttribute("cart_list", cart_list);
    }
%>
<html>
<head>
    <title>Cart</title>
    <%@include file="includes/header.jsp"%>

</head>
<body>
<%@include file="includes/navbar.jsp"%>

<div class="container">
<div class="d-flex py-3"><h3>Total Price: BWP${total>0?total:0}</h3><a class="mx-3 btn btn-primary" href="#">CheckOut</a> </div>
<table class="table table-loght">
    <thead>
    <th scope = "col">Name</th>
    <th scope = "col">Genre</th>
    <th scope = "col">Price</th>
    <th scope = "col">BuyNow</th>
    <th scope = "col">Cancel</th>
    </thead>
    <tbody>
    <%
        if (cart_list != null) {
            for (Cart c : cartProduct) {%>
            <tr>
        <td><%=c.getTitle()%></td>
        <td><%=c.getGenre()%></td>
        <td><%=c.getPrice()%></td>
        <td>
            <form action="OrderNow" method="post" class="form-inline">
                <input type="hidden" name="id" value="1" class="form-input">
                <div class="form-group d-flex justify-content-between">
                    <input type="text" name="quantity" class="form-control" value="1" readonly>
                </div>
                <button type="submit" class="btn btn-sm btn-success">Buy</button>
            </form>
        </td>
        <td><a class="btn btn-sm btn-danger" href="RemoveFromCart?id=<%=c.getmID()%>">Remove</a> </td>
    </tr>

    <% }
        }%>
    </tbody>
</table>
</div>

<%@include file="includes/footer.jsp"%>

</body>
</html>
