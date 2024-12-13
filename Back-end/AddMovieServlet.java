package AddMovie;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class AddMovieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the movie details from the form
        String movieName = request.getParameter("movieName");
        String movieDescription = request.getParameter("movieDescription");
        String movieGenre = request.getParameter("movieGenre");
        double moviePrice = Double.parseDouble(request.getParameter("moviePrice"));
        String movieImageUrl = request.getParameter("movieImageUrl");

        // Database connection
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            // Assuming you have a JDBC connection pool or a driver configured
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "root", "admin");

            String sql = "INSERT INTO movies (movie_name, description, genre, price, image_url) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, movieName);
            stmt.setString(2, movieDescription);
            stmt.setString(3, movieGenre);
            stmt.setDouble(4, moviePrice);
            stmt.setString(5, movieImageUrl);

            int result = stmt.executeUpdate();

            if (result > 0) {
                response.sendRedirect("moviedetails.jsp"); // Redirect to the movie details page
            } else {
                response.getWriter().println("Failed to add movie");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
