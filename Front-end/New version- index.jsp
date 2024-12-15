<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Cinema - Home</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style/home.css"> <!-- Linking the external CSS file -->
</head>
<body>
    <header id="navbar">
        <a href="#" class="logo">
            <img src="<%= request.getContextPath() %>/images/logo.png" alt="ABC Cinema Logo">
        </a>
        <nav>
            <ul>
                <li><a href="<%= request.getContextPath() %>/login.jsp">Home</a></li>
                <li><a href="<%= request.getContextPath() %>/login.jsp">Movies</a></li>
                <li><a href="<%= request.getContextPath() %>/login.jsp">Booking</a></li>
                <li><button class="login-btn" onclick="location.href='<%= request.getContextPath() %>/login.jsp'">Login</button></li>
            </ul>
        </nav>
    </header>

    <section class="hero">
        <h1>Welcome to ABC Cinema</h1>
        <p>Experience the magic of movies like never before.</p>
        <button onclick="location.href='<%= request.getContextPath() %>/booking.jsp'">Book Now</button>
    </section>

    <!-- Now Showing Section -->
    <section class="now-showing">
        <h2>Now Showing</h2>
        <div class="movie-grid">
            <%
                // Movie titles and corresponding images
                String[] movieTitles = {"Movie Title 1", "Movie Title 2", "Movie Title 3", "Movie Title 4"};
                String[] movieImages = {"movie1.jpg", "movie2.jpg", "movie3.jpg", "movie4.webp"}; // Add movie images

                for (int i = 0; i < movieTitles.length; i++) {
            %>
            <div class="movie-card">
                <img src="<%= request.getContextPath() %>/images/<%= movieImages[i] %>" alt="<%= movieTitles[i] %>">
                <div class="movie-info">
                    <h3><%= movieTitles[i] %></h3>
                    <a href="<%= request.getContextPath() %>/booking.jsp?movie=<%= movieTitles[i] %>">Book Now</a>
                </div>
            </div>
            <% } %>
        </div>
    </section>

    <section class="about-us">
        <div class="about-content">
            <img src="<%= request.getContextPath() %>/images/cinema.jpg" alt="Cinema Image" class="about-image">

            <div class="about-text">
                <h2>About Us</h2>
                <p>
                    ABC Cinema has been a cornerstone of entertainment in our community for over 20 years.
                    With state-of-the-art facilities and a passion for movies, we aim to provide the best cinematic experience for all our patrons.
                </p>
                <p>
                    Our theaters are equipped with the latest sound and visual technology, ensuring every movie is seen and heard in its full glory.
                    From the comfortable seating to the meticulously designed interiors, we have created an environment that amplifies the joy of watching movies.
                </p>
            </div>
        </div>
    </section>

    <footer>
        <p>©️ 2024 ABC Cinema. All rights reserved.</p>
    </footer>
    <script src="<%= request.getContextPath() %>style/home.js"></script>
</body>
</html>
