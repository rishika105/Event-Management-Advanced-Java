package in.sp.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import in.sp.model.Booking;
import in.sp.model.FoodModel;
import in.sp.model.TransportationModel;

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
    public int insertBooking(Booking booking) {
        int generatedId = 0;
        String sql = "INSERT INTO event_booking (event_type, number_of_guests, event_price, email, date, phone) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, booking.getEvent_type());
            stmt.setInt(2, booking.getNumber_of_guests());
            stmt.setBigDecimal(3, booking.getEvent_price());
            stmt.setString(4, booking.getEmail());
            stmt.setDate(5, new java.sql.Date(booking.getDate().getTime()));
            stmt.setString(6, booking.getPhone());

            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        generatedId = generatedKeys.getInt(1);
                        booking.setBooking_id(generatedId);
                    }
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return generatedId;
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

    // Get booking by ID
    public Booking getBookingById(int bookingId) throws SQLException {
        String sql = "SELECT * FROM event_booking WHERE booking_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, bookingId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Booking booking = new Booking();
                booking.setBooking_id(bookingId);
                booking.setEvent_type(rs.getString("event_type"));
                booking.setNumber_of_guests(rs.getInt("number_of_guests"));
                booking.setEvent_price(rs.getBigDecimal("event_price"));
                booking.setEmail(rs.getString("email"));
                booking.setDate(rs.getDate("date"));
                booking.setPhone(rs.getString("phone"));
                return booking;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get food booking details by booking ID
    public FoodModel getFoodByBookingId(int bookingId) throws SQLException {
        String sql = "SELECT * FROM food WHERE booking_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, bookingId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                FoodModel food = new FoodModel();
                food.setFoodItems(rs.getString("food_items"));
                food.setTotalCost(rs.getDouble("total_cost"));
                food.setFoodProviderName(rs.getString("food_provider_name"));
                return food;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Insert a new food booking into the database
    public boolean addFoodBooking(FoodModel foodBooking) throws SQLException {
        String sql = "INSERT INTO food (booking_id, food_items, total_cost, food_provider_name) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, foodBooking.getBookingId());
            ps.setString(2, foodBooking.getFoodItems());
            ps.setDouble(3, foodBooking.getTotalCost());
            ps.setString(4, foodBooking.getFoodProviderName());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Get event price by booking ID
    public BigDecimal getEventPriceByBookingId(int bookingId) throws SQLException {
        String sql = "SELECT event_price FROM event_booking WHERE booking_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, bookingId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getBigDecimal("event_price");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
    

    // Get transportation booking details by booking ID
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
                transportation.setPickupTime(rs.getString("pickup_time"));
                transportation.setPrice(rs.getDouble("price"));
                return transportation;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Insert a new transportation booking into the database
    public boolean addTransportationBooking(TransportationModel transportationBooking) throws SQLException {
        String sql = "INSERT INTO transportation (booking_id, vehicle_type, pickup_location, dropoff_location, pickup_time, price) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, transportationBooking.getBookingId());
            ps.setString(2, transportationBooking.getVehicleType());
            ps.setString(3, transportationBooking.getPickupLocation());
            ps.setString(4, transportationBooking.getDropoffLocation());
            ps.setString(5, transportationBooking.getPickupTime());
            ps.setDouble(6, transportationBooking.getPrice());

            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }


}

