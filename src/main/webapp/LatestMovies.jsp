<%@ page import="com.awd.redfox.model.beans.User" %>
<%@ page import="com.awd.redfox.model.dao.MovieDAO" %>
<%@ page import="com.awd.redfox.model.beans.Movie" %>
<%@ page import="com.awd.redfox.data.DbCon" %>
<%@ page import="java.util.List" %>
<%@ page import="com.awd.redfox.model.beans.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    MovieDAO md=new MovieDAO(DbCon.getConnection());
    List<Movie> lmovies = md.getLatestMovies();

    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if (cart_list != null) {
        MovieDAO mDao = new MovieDAO(DbCon.getConnection());
        cartProduct = mDao.getCartMovies(cart_list);
        //double total = mDao.getTotalCartPrice(cart_list);
        //request.setAttribute("total", total);
        request.setAttribute("cart_list", cart_list);
    }

%>

<!DOCTYPE html>
<html>
<head>
    <title>Latest Movies</title>
    <%@include file="includes/header.jsp"%>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container">
    <div class="card-header my-3">Latest Movies</div>
    <div class="row">
        <%
            if (!lmovies.isEmpty()){
                for (Movie m:lmovies){

        %>
        <div class="col-md-4 my-3">
            <div class="card " style="width: 18rem;">
                <a data-toggle="modal" data-target="#myModal">
                    <img class="card-img-top" src="img/<%=m.getImage()%>" alt="Card image cap">
                </a>
                <div class="card-body">
                    <h5 class="card-title">Movie Title: <%=m.getTitle()%></h5>
                    <h5 class="price">Price: <%=m.getPrice()%></h5>
                    <div class="mt-3 d-flex justify-content-between">
                        <a href="AddtoCart?id=<%=m.getmID()%>" class="btn btn-dark">Add to Cart</a>
                        <a href="#" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
        </div>
        <%}
        }%>
    </div>
</div>
<div class="container">

    <%
        if (!lmovies.isEmpty()){
            for (Movie m:lmovies){

    %>
    <!-- ITERATE MODAL FOR ALL MOVIES IN THE DBASE -->
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Movie Details</h4>
                </div>
                <div class="modal-body">
                    <h5 class="card-title"><%=m.getTitle()%></h5>
                    <h6 class="genre"><%=m.getGenre()%></h6>
                    <h6 class="price">Released: <%=m.getDateReleased()%></h6>
                    <h6 class="price">Price: <%=m.getPrice()%></h6>
                    <p class="synopsis">Synopsis: <%=m.getSynopsis()%></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%}
    }%>
</div>
</div>
<%@include file="includes/footer.jsp"%>
</body>
</html>
