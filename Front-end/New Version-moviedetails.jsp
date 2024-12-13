<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Booking</title>
    <link rel="stylesheet" href="style/moviedetails.css">
</head>
<body>
    <header id="navbar">
        <a href="#" class="logo">
            <img src="<%= request.getContextPath() %>/images/logo.png" alt="ABC Cinema Logo">
        </a>
        <nav>
            <ul>
                <li><a href="<%= request.getContextPath() %>/home.jsp">Home</a></li>
                <li><a href="<%= request.getContextPath() %>/moviedetails.jsp">Movies</a></li>
                <li><a href="<%= request.getContextPath() %>/checkout.jsp">Booking</a></li>
                <li><button class="login-btn" onclick="location.href='<%= request.getContextPath() %>/login.jsp'">Logout</button></li>
            </ul>
        </nav>
    </header>

    <div class="hero">
        <h1>Welcome to ABC Movie Booking</h1>
        <p>Find your favorite movies, book tickets, and enjoy the show!</p>
    </div>

    <!-- Movie Cards -->
    <div class="container">
        <div class="movie-grid">
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "root", "123456");

                    String sql = "SELECT * FROM movies";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        String movieName = rs.getString("movie_name");
                        String movieDescription = rs.getString("description");
                        String movieGenre = rs.getString("genre");
                        double moviePrice = rs.getDouble("price");
                        String movieImageUrl = rs.getString("image_url");
                        int movieId = rs.getInt("movie_id");
            %>
            <div class="movie-card">
                <img src="<%= movieImageUrl %>" alt="<%= movieName %>">
                <div class="name"><%= movieName %></div>
                <div class="description"><%= movieDescription %></div>
                <div class="genre">Genre: <%= movieGenre %></div>
                <div class="price">Price: $<%= moviePrice %></div>
                <div class="stars">
                    <span>&#9733;&#9733;&#9733;&#9733;&#9734;</span>
                </div>

                <!-- Form for booking functionality -->
                <form action="<%= request.getContextPath() %>/CheckoutServlet" method="GET">
                    <input type="hidden" name="movie_id" value="<%= movieId %>">
                    <button type="submit" class="btn">Book Now</button>
                </form>
            </div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
    </div>

    <footer>
        <p>©️ 2024 ABC Cinema. All rights reserved.</p>
    </footer>
</body>
</html>
