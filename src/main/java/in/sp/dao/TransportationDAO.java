package in.sp.dao;

import in.sp.model.TransportationModel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TransportationDAO {
    private static final String DB_URL = System.getenv("DB_URL");
    private static final String USER = System.getenv("DB_USERNAME");
    private static final String PASS = System.getenv("DB_PASSWORD");

    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(DB_URL, USER, PASS);
    }

    public boolean addTransportationBooking(TransportationModel booking) throws SQLException {
        String query = "INSERT INTO transportation (booking_id, vehicle_type, pickup_location, dropoff_location, pickup_time, price) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, booking.getBookingId());
            pstmt.setString(2, booking.getVehicleType());
            pstmt.setString(3, booking.getPickupLocation());
            pstmt.setString(4, booking.getDropoffLocation());
            pstmt.setString(5, booking.getPickupTime());
            pstmt.setDouble(6, booking.getPrice());
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Other methods...
}
