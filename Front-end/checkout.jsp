<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Cinema Checkout</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/checkout.css">
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

<div class="progress-bar">
    <button class="step active" onclick="changeStep(1)">Select Movie</button>
    <button class="step" onclick="changeStep(2)">Choose Seats</button>
    <button class="step" onclick="changeStep(3)">Payment</button>
    <button class="step" onclick="changeStep(4)">Confirmation</button>
</div>

<div class="checkout-container">
    <div class="checkout-box">
        <div class="movie-info">
            <img src="<%= request.getContextPath() %>/images/movie-poster.jpg" alt="Movie Poster">
            <h2><%= request.getAttribute("movieTitle") != null ? request.getAttribute("movieTitle") : "Movie Title" %></h2>
            <p>Showtime: <%= request.getAttribute("showtime") != null ? request.getAttribute("showtime") : "December 5, 2024 - 7:30 PM" %></p>
            <p>Theater: <%= request.getAttribute("theaterNumber") != null ? request.getAttribute("theaterNumber") : "2" %></p>
        </div>

        <div class="price-summary">
            <h3>Price Summary</h3>
            <table>
                <tr>
                    <th>Ticket Price</th>
                    <td>$<%= request.getAttribute("ticketPrice") != null ? request.getAttribute("ticketPrice") : "12.00" %></td>
                </tr>
                <tr>
                    <th>Seat Selection Fee</th>
                    <td>$<%= request.getAttribute("seatFee") != null ? request.getAttribute("seatFee") : "2.00" %></td>
                </tr>
                <tr>
                    <th>Discount</th>
                    <td>-$<%= request.getAttribute("discount") != null ? request.getAttribute("discount") : "2.00" %></td>
                </tr>
                <tr>
                    <th>Total</th>
                    <td>$<%= request.getAttribute("totalPrice") != null ? request.getAttribute("totalPrice") : "12.00" %></td>
                </tr>
            </table>
        </div>

        <div class="payment-method">
            <h3>Payment Information</h3>
            <table>
                <tr>
                    <th>Payment Method</th>
                    <td>
                        <select id="payment-method" onchange="handlePaymentChange()">
                            <option value="credit-card" data-tooltip="Use a credit card to pay">Credit Card</option>
                            <option value="paypal" data-tooltip="Pay using your PayPal account">PayPal</option>
                            <option value="cash" data-tooltip="Pay in cash at the theater">Cash</option>
                        </select>
                    </td>
                </tr>
            </table>
            <div id="tooltip" class="tooltip"></div>
        </div>

        <div class="total-price">
            <p>Total: $<%= request.getAttribute("totalPrice") != null ? request.getAttribute("totalPrice") : "12.00" %></p>
        </div>

        <button class="checkout-button" onclick="proceedToPayment()">Proceed to Payment</button>
    </div>
</div>

<footer class="footer">
    <p>&copy; 2024 ABC Cinema. All Rights Reserved.</p>
</footer>

<script src="<%= request.getContextPath() %>/checkout.js"></script>
</body>
</html>
