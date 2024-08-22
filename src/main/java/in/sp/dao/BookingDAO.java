package in.sp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import in.sp.model.Booking; // Import the Booking model class

public class BookingDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/eventmanagement";
    private static final String USER = "root";
    private static final String PASS = "golu10";

    // Method to establish a connection with the database
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

    // Method to insert a booking into the booking table
    public void addBooking(Booking booking) {
        String sql = "INSERT INTO booking ( event_id, number_of_tickets, total_price,email) VALUES (?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

        	 
             ps.setInt(1, booking.getEvent_id());
             ps.setInt(2, booking.getNumber_of_tickets());
             ps.setBigDecimal(3, booking.getTotal_price());
             ps.setString(4, booking.getEmail());


            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("A new booking was inserted successfully!");
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
