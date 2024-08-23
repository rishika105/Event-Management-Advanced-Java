package in.sp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import in.sp.model.Booking;

public class BookingDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/eventmanagement";
    private static final String USER = "root";
    private static final String PASS = "golu10";

    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(DB_URL, USER, PASS);
    }

    // Method to add a booking
    public void addBooking(Booking booking) {
        String sql = "INSERT INTO booking (event_id, number_of_tickets, total_price, email, date, status) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, booking.getEvent_id());
            ps.setInt(2, booking.getNumber_of_tickets());
            ps.setBigDecimal(3, booking.getTotal_price());
            ps.setString(4, booking.getEmail());
            
            // Convert java.util.Date to java.sql.Date
            java.sql.Date sqlDate = new java.sql.Date(booking.getDate().getTime());
            ps.setDate(5, sqlDate);
            ps.setString(6, "active");  // Set status as 'active'

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("A new booking was inserted successfully!");
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

 // BookingDAO.java
    public List<Booking> getBookingHistory(String email) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM booking WHERE email = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBooking_id(rs.getInt("booking_id"));
                booking.setEvent_id(rs.getInt("event_id"));
                booking.setNumber_of_tickets(rs.getInt("number_of_tickets"));
                booking.setTotal_price(rs.getBigDecimal("total_price"));
                booking.setEmail(rs.getString("email"));
                booking.setDate(rs.getDate("date"));

                bookings.add(booking);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return bookings;
    }

    public boolean cancelBooking(int bookingId) {
        String sql = "DELETE FROM booking WHERE booking_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, bookingId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
}
