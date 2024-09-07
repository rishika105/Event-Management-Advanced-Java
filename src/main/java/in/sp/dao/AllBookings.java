package in.sp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import in.sp.model.AllBookings;
import in.sp.model.Event;

public class AllBookingsDAO {
    private static final String DB_URL = System.getenv("DB_URL");
    private static final String DB_USER = System.getenv("DB_USERNAME");
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD");

    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    // Method to fetch all bookings from the database
    public List<AllBookings> getAllBookings() {
        List<AllBookings> bookings = new ArrayList<>();
        String query = "SELECT b.booking_id, b.user_id, e.name AS event_name, e.venue, e.date, b.status, b.payment_status " +
                       "FROM Booking b " +
                       "JOIN Event e ON b.event_id = e.event_id";
        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(query)) {

            while (rs.next()) {
                AllBookings booking = new AllBookings();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setUserId(rs.getInt("user_id"));

                Event event = new Event();
                event.setName(rs.getString("event_name"));
                event.setVenue(rs.getString("venue"));
                event.setDate(rs.getDate("date"));

                booking.setEvent(event);
                booking.setStatus(rs.getString("status"));
                booking.setPaymentStatus(rs.getString("payment_status"));

                bookings.add(booking);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return bookings;
    }
}
