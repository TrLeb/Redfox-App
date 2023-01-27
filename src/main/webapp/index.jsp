<%@ page import="java.util.List" %>
<%@ page import="com.awd.redfox.model.beans.User" %>
<%@ page import="com.awd.redfox.model.dao.MovieDAO" %>
<%@ page import="com.awd.redfox.data.DbCon" %>
<%@ page import="com.awd.redfox.model.beans.Movie" %>
<%@ page import="com.awd.redfox.model.beans.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

    MovieDAO md=new MovieDAO(DbCon.getConnection());
    List<Movie> movies = md.getAllMovies();

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
    <title>Redfox Movies</title>
    <%@include file="includes/header.jsp"%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <%@include file="includes/navbar.jsp"%>

    <div class="container">
        <div class="card-header my-3">
            <div class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Filter By
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Latest Movies</a>
                <a class="dropdown-item" href="#">Recommended Movies</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="index.jsp">All Movies</a>
            </div>
        </div>
        </div>

        <div class="row">
            <%
                if (!movies.isEmpty()){
                    for (Movie m:movies){

            %>
            <div class="col-md-4 my-3">
                <div class="card " style="width: 18rem;">
                    <a  data-toggle="modal" data-target="#myModal">
                        <img class="card-img-top" src="img/<%=m.getImage()%>" alt="Card image cap">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Movie Title: <%=m.getTitle()%></h5>
                        <h5 class="price">Price: <%=m.getPrice()%></h5>
                        <div class="mt-3 d-flex justify-content-between">
                            <a href="AddtoCart?id=<%=m.getmID()%>" class="btn btn-dark">Add to Cart</a>
                            <a href="OrderNow?quantity=1&id=<%=m.getmID()%>" class="btn btn-primary">Buy Now</a>
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
                if (!movies.isEmpty()){
                    for (Movie m:movies){

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
                            <h6 class="Released"><%=m.getDateReleased()%></h6>
                            <h6 class="genre"><%=m.getGenre()%></h6>
                            <h6 class="released">Released: <%=m.getDateReleased()%></h6>
                            <h6 class="price">Price:<%=m.getPrice()%></h6>
                            <p class="synopsis">Synopsis: <%=m.getSynopsis()%></p>
                            <p class="Actors">Actors: <%=m.getActors()%></p>
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



                <!--Blob image = null;
                        Connection con = null;
                        byte[ ] imgData = null ;
                        Statement stmt = null;
                        ResultSet rs = null;
                        try {

                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","","");
                            stmt =con.createStatement();
                            rs = stmt.executeQuery("select image from image where id = '1'");
                            if (rs.next()) {
                            image = (Blob) rs.getBlob(1);
                            imgData = image.getBytes(1,(int)image.length());

                            }
                            else {}
                            return ;
                        }catch(Exception e){
                            e.printStackTrace();
                        }-->

           <!-- <div class="col-md-4 my-3">
                <div class="card " style="width: 18rem;">
                    <img class="card-img-top" src="img/luckiestgirl.jpg" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">Luckiest Girl Alive</h5>
                        <h6 class="category">Genre</h6>
                        <h6 class="price">Price</h6>
                        <p class="synopsis">Synopsis-Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <div class="mt-3 d-flex justify-content-between">
                            <a href="#" class="btn btn-primary">Add to Cart</a>
                            <a href="#" class="btn btn-primary">Buy Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 my-3">
                <div class="card " style="width: 18rem;">
                    <img class="card-img-top" src="img/badguys.jpeg" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">Beast 2022</h5>
                        <h6 class="category">Genre</h6>
                        <h6 class="price">Price</h6>
                        <p class="synopsis">Synopsis-Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <div class="mt-3 d-flex justify-content-between">
                            <a href="#" class="btn btn-primary">Add to Cart</a>
                            <a href="#" class="btn btn-primary">Buy Now</a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-4 my-3">
                <div class="card " style="width: 18rem;">
                    <img class="card-img-top" src="img/morbius.jpg" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">Beast 2022</h5>
                        <h6 class="category">Genre</h6>
                        <h6 class="price">Price</h6>
                        <p class="synopsis">Synopsis-Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <div class="mt-3 d-flex justify-content-between">
                            <a href="#" class="btn btn-primary">Add to Cart</a>
                            <a href="#" class="btn btn-primary">Buy Now</a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-4 my-3">
                <div class="card " style="width: 18rem;">
                    <img class="card-img-top" src="img/Beast.jpg" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">Beast 2022</h5>
                        <h6 class="category">Genre</h6>
                        <h6 class="price">Price</h6>
                        <p class="synopsis">Synopsis-Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <div class="mt-3 d-flex justify-content-between">
                            <a href="#" class="btn btn-primary">Add to Cart</a>
                            <a href="#" class="btn btn-primary">Buy Now</a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-4 my-3">
                <div class="card h=100" style="width: 18rem;">
                    <img class="card-img-top" src="img/goodandevil.jpg" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">Beast 2022</h5>
                        <h6 class="category">Genre</h6>
                        <h6 class="price">Price</h6>
                        <p class="synopsis">Synopsis-Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <div class="mt-3 d-flex justify-content-between">
                            <a href="#" class="btn btn-primary">Add to Cart</a>
                            <a href="#" class="btn btn-primary">Buy Now</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>-->


    <%@include file="includes/footer.jsp"%>
</body>
</html>