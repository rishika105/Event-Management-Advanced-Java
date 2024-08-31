package in.sp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import in.sp.model.Booking;
import in.sp.model.FoodModel;
import in.sp.model.TransportationModel;

public class TransportationDAO {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/eventmanagement";
    private static final String USER = "root";
    private static final String PASS = "sourabha@45";

    // Method to get database connection
    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(DB_URL, USER, PASS);
    }

    // Insert a new transportation booking into the database
    public boolean addTransportationBooking(TransportationModel transportationBooking) throws SQLException {
        String sql = "INSERT INTO transportation (booking_id, vehicle_type, pickup_location, dropoff_location, price, pickup_time) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, transportationBooking.getBookingId());
            ps.setString(2, transportationBooking.getVehicleType());
            ps.setString(3, transportationBooking.getPickupLocation());
            ps.setString(4, transportationBooking.getDropoffLocation());
            ps.setBigDecimal(5, transportationBooking.getPrice());
            ps.setTime(6, transportationBooking.getPickupTime());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get transportation details by booking ID
    public TransportationModel getTransportationByBookingId(int bookingId) throws SQLException {
        String sql = "SELECT * FROM transportation WHERE booking_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, bookingId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                TransportationModel transportation = new TransportationModel();
                transportation.setBookingId(bookingId);
                transportation.setVehicleType(rs.getString("vehicle_type"));
                transportation.setPickupLocation(rs.getString("pickup_location"));
                transportation.setDropoffLocation(rs.getString("dropoff_location"));
                transportation.setPrice(rs.getBigDecimal("price"));
                transportation.setPickupTime(rs.getTime("pickup_time"));
                return transportation;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Other methods...

}
