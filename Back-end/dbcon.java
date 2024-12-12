package Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbcon {

    // Database configuration constants
    private static final String URL = "jdbc:mysql://localhost:3306/abc_cinema?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "admin";

    /**
     * Establishes and returns a database connection.
     *
     * @return Connection to the database.
     * @throws SQLException If an error occurs while connecting to the database.
     */
    public static Connection getConnection() throws SQLException {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC driver not found. Ensure the JDBC driver is added to the classpath.", e);
        }

        // Return the database connection
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    /**
     * Closes the given database connection.
     *
     * @param connection The connection to close.
     */
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("[INFO] Database connection closed successfully.");
            } catch (SQLException e) {
                System.err.println("[ERROR] Failed to close the database connection: " + e.getMessage());
                e.printStackTrace();
            }
        }
    }

    /**
     * Main method for testing the database connection.
     *
     * @param args Command-line arguments (not used).
     */
    public static void main(String[] args) {
        Connection connection = null;
        try {
            // Test the database connection
            connection = getConnection();
            System.out.println("[INFO] Database connection established successfully!");
        } catch (SQLException e) {
            System.err.println("[ERROR] Database connection failed: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Ensure the connection is closed
            closeConnection(connection);
        }
    }
}
