<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Booking</title>
    <!-- Link to external CSS -->
    <link rel="stylesheet" href="moviedetails.css">
</head>
<body>
    <header id="navbar">
        <a href="#" class="logo">
            <img src="<%= request.getContextPath() %>/images/logo.png" alt="ABC Cinema Logo">
        </a>
        <nav>
            <ul>
                <li><a href="<%= request.getContextPath() %>/home.jsp">Home</a></li>
                <li><a href="<%= request.getContextPath() %>/movies.jsp">Movies</a></li>
                <li><a href="<%= request.getContextPath() %>/booking.jsp">Booking</a></li>
                <li><button class="login-btn" onclick="location.href='<%= request.getContextPath() %>/login.jsp'">Login</button></li>
            </ul>
        </nav>
    </header>

    <!-- Hero Section -->
    <div class="hero">
        <h1>Welcome to ABC Movie Booking</h1>
        <p>Find your favorite movies, book tickets, and enjoy the show!</p>
    </div>

    <!-- Movie Cards -->
    <div class="container">
        <div class="movie-grid">
            <!-- Deadpool -->
            <div class="movie-card">
                <img src="https://musicart.xboxlive.com/7/7e206d00-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080" alt="Deadpool">
                <div class="name">Deadpool</div>
                <div class="description">A hilarious antihero breaks the fourth wall and saves the day.</div>
                <div class="genre">Genre: Action, Comedy</div>
                <div class="stars">
                    <span>&#9733;&#9733;&#9733;&#9733;&#9734;</span>
                </div>
                <select>
                    <option value="adult">Adult - $15.99</option>
                    <option value="child">Child - $10.99</option>
                </select>
                <input type="number" min="1" placeholder="Quantity" value="1">
                <button class="btn">Book Now</button>
                <button class="btn trailer-btn">Watch Trailer</button>
            </div>

            <!-- Venom -->
            <div class="movie-card">
                <img src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRSAV161vHVXamqMrcrD63a116fbv_B3icvCM7XVpK2S2U3vNGKeat6KFnEcyQxH9Zmt8eE" alt="Venom">
                <div class="name">Venom</div>
                <div class="description">A journalist bonds with an alien symbiote for justice.</div>
                <div class="genre">Genre: Action, Sci-Fi</div>
                <div class="stars">
                    <span>&#9733;&#9733;&#9733;&#9733;&#9734;</span>
                </div>
                <select>
                    <option value="adult">Adult - $14.99</option>
                    <option value="child">Child - $9.99</option>
                </select>
                <input type="number" min="1" placeholder="Quantity" value="1">
                <button class="btn">Book Now</button>
                <button class="btn trailer-btn">Watch Trailer</button>
            </div>

            <!-- Venom: Let There Be Carnage -->
            <div class="movie-card">
                <img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRsQ4Js0KosQW3Fg7JEAdtf4Ux9iHcD1_DE79I-_sgJvflR5jLNvgxy-Gyob-mA6x-e_zI" alt="Venom: Let There Be Carnage">
                <div class="name">Venom: Let There Be Carnage</div>
                <div class="description">Venom faces off against the psychotic Carnage.</div>
                <div class="genre">Genre: Action, Sci-Fi</div>
                <div class="stars">
                    <span>&#9733;&#9733;&#9733;&#9734;&#9734;</span>
                </div>
                <select>
                    <option value="adult">Adult - $16.99</option>
                    <option value="child">Child - $11.99</option>
                </select>
                <input type="number" min="1" placeholder="Quantity" value="1">
                <button class="btn">Book Now</button>
                <button class="btn trailer-btn">Watch Trailer</button>
            </div>
        </div>
    </div>

    <!-- Banner -->
    <div class="banner">
        <h2>Select Your Favorite Genre</h2>
        <label><input type="radio" name="genre" value="action"> Action</label>
        <label><input type="radio" name="genre" value="comedy"> Comedy</label>
        <label><input type="radio" name="genre" value="drama"> Drama</label>
        <label><input type="radio" name="genre" value="sci-fi"> Sci-Fi</label>
        <button class="btn">Submit</button>
    </div>

    <!-- Footer -->
    <footer>
        <p>© 2024 ABC Cinema. All rights reserved.</p>
    </footer>
</body>
</html>
