package checkout;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class CheckoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int movieId = Integer.parseInt(request.getParameter("movie_id"));
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "root", "admin");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM movies WHERE movie_id = ?");
            ps.setInt(1, movieId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("movie_id", rs.getInt("movie_id"));
                request.setAttribute("movie_name", rs.getString("movie_name"));
                request.setAttribute("description", rs.getString("description"));
                request.setAttribute("genre", rs.getString("genre"));
                request.setAttribute("price", rs.getDouble("price"));
                request.setAttribute("image_url", rs.getString("image_url"));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");
        rd.forward(request, response);
    }
}
