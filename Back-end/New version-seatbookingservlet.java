package SeatBooking;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/seatBooking")
public class SeatBookingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Example data: Replace with actual seat data from the database
        Map<Integer, Map<Integer, Boolean>> occupiedSeats = new HashMap<>();
        for (int row = 1; row <= 10; row++) {
            Map<Integer, Boolean> rowSeats = new HashMap<>();
            for (int col = 1; col <= 10; col++) {
                // Example: Mark seats in row 1 as occupied
                rowSeats.put(col, row == 1 && (col % 2 == 0));
            }
            occupiedSeats.put(row, rowSeats);
        }

        request.setAttribute("occupiedSeats", occupiedSeats);
        request.getRequestDispatcher("seatBooking.jsp").forward(request, response);
    }
}
