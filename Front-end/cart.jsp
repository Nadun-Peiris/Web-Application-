<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Cinema - Cart</title>
    <link rel="stylesheet" href="cart.css">
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

    <!-- Heading -->
    <div class="heading">
        <h3>Your Movie Cart</h3>
        <p><a href="home.jsp">Home</a> / Cart</p>
    </div>

    <!-- Shopping Cart -->
    <section class="shopping-cart">
        <h1 class="title">Your Bookings</h1>

        <div class="box-container">
            <!-- Loop through cart items -->
            <c:forEach var="item" items="${cartItems}">
                <div class="box">
                    <img src="${item.image}" alt="Movie">
                    <div class="name">${item.name}</div>
                    <div class="price">$${item.price}</div>
                    <form action="updateCart" method="post">
                        <input type="hidden" name="itemId" value="${item.id}">
                        <select name="ticketType">
                            <option value="adult" ${item.ticketType == 'adult' ? 'selected' : ''}>Adult - $15.99</option>
                            <option value="child" ${item.ticketType == 'child' ? 'selected' : ''}>Child - $10.99</option>
                        </select>
                        <input type="number" name="quantity" min="1" value="${item.quantity}">
                        <button type="submit" class="btn">Update</button>
                    </form>
                    <div class="sub-total">Sub Total: <span>$${item.subTotal}</span></div>
                </div>
            </c:forEach>
        </div>

        <div class="cart-total">
            <p>Grand Total: <span>$${grandTotal}</span></p>
            <div class="flex">
                <a href="movies.jsp">Continue Booking</a>
                <a href="checkout.jsp">Proceed to Checkout</a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>© 2024 ABC Cinema. All rights reserved.</p>
    </footer>
</body>
</html>
