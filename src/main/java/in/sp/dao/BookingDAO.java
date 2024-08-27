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

    private static final String DB_URL = System.getenv("DB_URL");
    private static final String USER = System.getenv("DB_USERNAME");
    private static final String PASS = System.getenv("DB_PASSWORD");

    // Method to get database connection
    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(DB_URL, USER, PASS);
    }

    // Insert a new booking into the database
    public void insertBooking(Booking booking) {
        String sql = "INSERT INTO event_booking (event_type, number_of_guests, event_price, email, date, phone) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, booking.getEvent_type());
            ps.setInt(2, booking.getNumber_of_guests());
            ps.setBigDecimal(3, booking.getEvent_price());
            ps.setString(4, booking.getEmail());
            ps.setDate(5, new java.sql.Date(booking.getDate().getTime()));
            ps.setString(6, booking.getPhone());

            ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            // Log the exception using a logging framework
            System.err.println("Error inserting booking: " + e.getMessage());
        }
    }

    // Retrieve bookings by email
    public List<Booking> retrieveBookingsByEmail(String email) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM event_booking WHERE email = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBooking_id(rs.getInt("booking_id"));
                booking.setEvent_type(rs.getString("event_type"));
                booking.setNumber_of_guests(rs.getInt("number_of_guests"));
                booking.setEvent_price(rs.getBigDecimal("event_price"));
                booking.setEmail(rs.getString("email"));
                booking.setDate(rs.getDate("date"));
                booking.setPhone(rs.getString("phone"));

                bookings.add(booking);
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving bookings: " + e.getMessage());
        }

        return bookings;
    }

    // Cancel a booking by email and event type
    public void cancelBookingByEmailAndEventType(String email, String eventType) {
        String sql = "DELETE FROM event_booking WHERE email = ? AND event_type = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, eventType);

            ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error canceling booking: " + e.getMessage());
        }
    }
}
