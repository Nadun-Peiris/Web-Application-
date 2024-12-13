<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Cinema Checkout</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style/checkout.css">
    <style type="text/css">
        /* General Styles */
        header {
            padding: 20px;
        }

        header .logo img {
            width: 120px;
        }

        /* Checkout Page */
        .checkout-container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .checkout-box {
            display: flex;
            justify-content: space-between;
            gap: 30px;
        }

        .movie-info {
            flex: 1;
        }

        .movie-info img {
            width: 100%;
            max-width: 300px;
        }

        .price-summary {
            flex: 1;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 8px;
            border-bottom: 1px solid #ccc;
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
        }

        select, input[type="number"], input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button.btn {
            background-color: #333;
            color: white;
            padding: 15px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button.btn:hover {
            background-color: #555;
        }
  
        .seating-section {
            text-align: center;
            margin: 2rem auto;
            max-width: 800px;
        }
        .screen {
            background-color: #ccc;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .seats {
            display: grid;
            grid-template-columns: repeat(10, 1fr);
            gap: 10px;
            justify-content: center;
        }
        .seat {
            width: 30px;
            height: 30px;
            background-color: #4caf50;
            border-radius: 5px;
            cursor: pointer;
        }
        .seat.selected {
            background-color: #f39c12;
        }
        .seat.occupied {
            background-color: #e74c3c;
            cursor: not-allowed;
        }
        .legend {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 15px;
        }
        .legend div {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .legend .box {
            width: 20px;
            height: 20px;
            border-radius: 5px;
        }
        .paypal-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
    width: 100%;
}

        .paypal-button {
            margin-top: 20px;
        }
        
    </style>
    <!-- PayPal SDK -->
    <script src="https://www.paypal.com/sdk/js?client-id=AQQxphozkfmoaRetEoBj89NVEUCH3PKORwcyRubLZo4bQSk1H-Czj3LtXxVJrYEV5mpYQm3d2G_Txw2k&currency=USD"></script>
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
           
            
        </ul>
    </nav>
</header>

<section class="seating-section">
    <div class="screen">SCREEN</div>

    <div class="seats">
        <%-- Dynamically render seats --%>
        <c:forEach var="row" begin="1" end="5">
            <c:forEach var="col" begin="1" end="5">
                <div class="seat ${occupiedSeats[row][col] ? 'occupied' : ''}" 
                     data-row="${row}" 
                     data-col="${col}">
                </div>
            </c:forEach>
        </c:forEach>
    </div>

    <!-- Legend -->
    <div class="legend">
        <div><div class="box" style="background-color: #4caf50;"></div> Available</div>
        <div><div class="box" style="background-color: #f39c12;"></div> Selected</div>
        <div><div class="box" style="background-color: #e74c3c;"></div> Occupied</div>
    </div>
</section>

<div class="checkout-container">
    <div class="checkout-box">
        <!-- Display Movie Information -->
        <div class="movie-info">
            <img src="<%= request.getAttribute("image_url") %>" alt="<%= request.getAttribute("movie_name") %>">
            <h2><%= request.getAttribute("movie_name") %></h2>
            <p><strong>Genre:</strong> <%= request.getAttribute("genre") %></p>
            <p><strong>Description:</strong> <%= request.getAttribute("description") %></p>
        </div>

        <!-- Display Ticket Price Summary -->
        <div class="price-summary">
            <h3>Price Summary</h3>
            <table>
                <tr>
                    <th>Ticket Price</th>
                    <td>$<%= request.getAttribute("price") %></td>
                </tr>
                
                <tr>
                    <th>Total</th>
                    <td id="totalPrice">$0</td>
                </tr>
            </table>
        </div>

        <!-- Booking Form -->
        <form method="POST" action="<%= request.getContextPath() %>/CompleteBookingServlet">
            <input type="hidden" name="movie_id" value="<%= request.getAttribute("movie_id") %>">
            <input type="hidden" name="selected_seats" id="selectedSeats">
            <label for="quantity">Number of Tickets:</label>
            <label id="ticketCount">0</label>
            <label for="email">Email Address:</label>
            <input type="email" name="email" placeholder="Enter your email" required>
            <button type="submit" class="btn">Complete Booking</button>
            <div id="paypal-button-container" class="paypal-container paypal-button"></div>
        </form>
       
    </div>
     
</div>

<!-- PayPal Button -->
<div id="paypal-button-container" class="paypal-container paypal-button"></div>

<footer class="footer">
    <p>&copy; 2024 ABC Cinema. All Rights Reserved.</p>
</footer>

<script>
    // JavaScript for handling seat selection
 document.addEventListener("DOMContentLoaded", () => {
    const seats = document.querySelectorAll('.seat:not(.occupied)'); // Select only available seats
    const selectedSeatsInput = document.getElementById('selectedSeats');
    const ticketCount = document.getElementById('ticketCount');
    const totalPrice = document.getElementById('totalPrice');
    const pricePerTicket = parseFloat('<%= request.getAttribute("price") %>'); // Get the price per ticket from the server

    const selectedSeats = new Set(); // Track selected seats

    seats.forEach(seat => {
        seat.addEventListener('click', () => {
            const row = seat.dataset.row;
            const col = seat.dataset.col;
            const seatId = ${row}-${col};

            if (seat.classList.contains('selected')) {
                // If the seat is already selected, deselect it
                seat.classList.remove('selected');
                selectedSeats.delete(seatId); // Remove from selected seats
            } else {
                // If the seat is not selected, select it
                seat.classList.add('selected');
                selectedSeats.add(seatId); // Add to selected seats
            }

            // Update hidden input and ticket summary
            selectedSeatsInput.value = Array.from(selectedSeats).join(','); // Update selected seats input
            updateTicketSummary(); // Update ticket count and total price
        });
    });

    // Function to update the ticket summary (ticket count and total price)
    function updateTicketSummary() {
        const count = selectedSeats.size; // Get the number of selected seats
        const totalAmount = count * pricePerTicket; // Calculate total price

        ticketCount.textContent = count; // Update the ticket count display
        totalPrice.textContent = $${totalAmount.toFixed(2)}; // Update the total price display
    }
});

    // PayPal button integration
    paypal.Buttons({
        createOrder: function(data, actions) {
            return actions.order.create({
                purchase_units: [{
                    amount: {
                        value: document.getElementById('totalPrice').innerText.replace('$', '')
                    }
                }]
            });
        },
        onApprove: function(data, actions) {
            return actions.order.capture().then(function(details) {
                alert('Payment Successful!');
                // Handle successful payment (e.g., update booking status)
            });
        },
        onError: function(err) {
            console.error('PayPal Error:', err);
            alert('There was an error with your payment. Please try again.');
        }
    }).render('#paypal-button-container');
</script>

</body>
</html>
