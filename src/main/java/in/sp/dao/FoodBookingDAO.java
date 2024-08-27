package in.sp.dao;

import in.sp.model.FoodModel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FoodBookingDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/eventmanagement";
    private static final String USER = System.getenv("DB_USERNAME");
    private static final String PASS = System.getenv("DB_PASSWORD");

    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(DB_URL, USER, PASS);
        if (connection != null) {
            System.out.println("Connected to MySQL database!");
        } else {
            System.out.println("Failed to connect to MySQL database.");
        }
        return connection;
    }

    public boolean addFoodBooking(FoodModel booking) throws SQLException {
        String query = "INSERT INTO food (booking_id, food_items, total_cost, food_provider_name) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, booking.getBookingId());
            pstmt.setString(2, booking.getFoodItems());
            pstmt.setDouble(3, booking.getTotalCost());
            pstmt.setString(4, booking.getFoodProviderName());
            int rowsAffected = pstmt.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);
            return rowsAffected > 0;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Other methods...
}
