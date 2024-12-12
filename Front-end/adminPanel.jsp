<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Add Movie</title>
    <link rel="stylesheet" href="style/adminpanel.css">
</head>
<body>
    <header id="navbar">
        <a href="#" class="logo">
            <img src="<%= request.getContextPath() %>/images/logo.png" alt="ABC Cinema Logo">
        </a>
        <nav>
            <ul>
                <li><a href="<%= request.getContextPath() %>/home.jsp">Home</a></li>
                <li><a href="<%= request.getContextPath() %>/adminPanel.jsp">Admin Panel</a></li>
            </ul>
        </nav>
    </header>

    <h1>Add New Movie</h1>
    <form action="<%= request.getContextPath() %>/AddMovieServlet" method="post">
        <label for="movieName">Movie Name:</label>
        <input type="text" name="movieName" required><br><br>
        
        <label for="movieDescription">Description:</label>
        <textarea name="movieDescription" required></textarea><br><br>

        <label for="movieGenre">Genre:</label>
        <input type="text" name="movieGenre" required><br><br>

        <label for="moviePrice">Price:</label>
        <input type="text" name="moviePrice" required><br><br>

        <label for="movieImageUrl">Image URL:</label>
        <input type="text" name="movieImageUrl" required><br><br>

        <button type="submit">Add Movie</button>
    </form>
</body>
</html>
