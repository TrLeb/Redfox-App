<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="index.jsp"><img src="img/Flogo.png" style="width:180px;height:40px;"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Filter By</a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="LatestMovies.jsp">Latest Movies</a>
            <a class="dropdown-item" href="upcomingMovies.jsp">Upcoming Movies</a>
            <a class="dropdown-item" href="RecommendedMovies.jsp">Recommended Movies</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="index.jsp">All Movies</a>
          </div>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="cart.jsp">Cart<span class="badge badge-danger">${cart_list.size()}</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminLogin.jsp">Admin</a>
        </li>
        <li class="nav-item">

            <a class="nav-link" href="orders.jsp">Orders</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="LogOut">LogOut</a>
              </li>
            <li class="nav-item">
          <a class="nav-link" href="login.jsp">LogIn</a>
        </li>



      </ul>
    </div>
  </div>
</nav>
