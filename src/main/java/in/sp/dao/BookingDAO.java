package in.sp.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import in.sp.model.Booking;
import in.sp.model.FoodModel;
import in.sp.model.PaymentModel;
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
        String sql = "INSERT INTO event_booking (venue_id, event_type, number_of_guests, event_price, email, date, phone) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

        	stmt.setInt(1, booking.getVenue_id());  // Set venue_id
        	stmt.setString(2, booking.getEvent_type());
        	stmt.setInt(3, booking.getNumber_of_guests());
        	stmt.setBigDecimal(4, booking.getEvent_price());
        	stmt.setString(5, booking.getEmail());
        	stmt.setDate(6, new java.sql.Date(booking.getDate().getTime()));
        	stmt.setString(7, booking.getPhone());


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
    
 // Method to get user bookings by email
    public List<Booking> getUserBookingsByEmail(String email) {
        return retrieveBookingsByEmail(email);
    }


    // Cancel booking and delete related data from food, transportation, and payment tables
    public boolean cancelBookingAndRelatedEntries(int bookingId) {
        String deleteBookingSQL = "DELETE FROM event_booking WHERE booking_id = ?";
        String deleteFoodSQL = "DELETE FROM food WHERE booking_id = ?";
        String deleteTransportSQL = "DELETE FROM transportation WHERE booking_id = ?";
        String deletePaymentSQL = "DELETE FROM payment WHERE booking_id = ?";

        try (Connection conn = getConnection()) {
            conn.setAutoCommit(false); // Start transaction

            try (PreparedStatement psBooking = conn.prepareStatement(deleteBookingSQL);
                 PreparedStatement psFood = conn.prepareStatement(deleteFoodSQL);
                 PreparedStatement psTransport = conn.prepareStatement(deleteTransportSQL);
                 PreparedStatement psPayment = conn.prepareStatement(deletePaymentSQL)) {

                // Delete booking
                psBooking.setInt(1, bookingId);
                psBooking.executeUpdate();

                // Delete food entry
                psFood.setInt(1, bookingId);
                psFood.executeUpdate();

                // Delete transportation entry
                psTransport.setInt(1, bookingId);
                psTransport.executeUpdate();

                // Delete payment entry
                psPayment.setInt(1, bookingId);
                psPayment.executeUpdate();

                conn.commit(); // Commit transaction
                return true;

            } catch (SQLException e) {
                conn.rollback(); // Rollback on error
                e.printStackTrace();
                return false;
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
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
                return food;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }



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
        return BigDecimal.ZERO;
    }
    
    // Method to save payment details to the database
    public boolean savePayment(PaymentModel paymentDetails) {
        boolean isSaved = false;
        String query = "INSERT INTO payment (booking_id, payment_amount, payment_date, payment_status, razorpay_order_id, razorpay_payment_id, razorpay_signature) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, paymentDetails.getBookingId());
            ps.setBigDecimal(2, paymentDetails.getPaymentAmount());
            ps.setTimestamp(3, new java.sql.Timestamp(paymentDetails.getPaymentDate().getTime()));
            ps.setString(4, paymentDetails.getPaymentStatus());
            ps.setString(5, paymentDetails.getRazorpayOrderId());
            ps.setString(6, paymentDetails.getRazorpayPaymentId());
            ps.setString(7, paymentDetails.getRazorpaySignature());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isSaved = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        return isSaved;
    }

    public BigDecimal calculateTotalCost(int bookingId) throws SQLException {
        BigDecimal totalCost = getEventPriceByBookingId(bookingId);
        FoodModel food = getFoodByBookingId(bookingId);
        TransportationModel transportation = getTransportationByBookingId(bookingId);

        if (food != null) {
            totalCost = totalCost.add(BigDecimal.valueOf(food.getTotalCost()));
        }
        if (transportation != null) {
            totalCost = totalCost.add(BigDecimal.valueOf(transportation.getPrice()));
        }

        return totalCost;
    }
    
    public List<Booking> getAllUserBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM event_booking";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

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
                booking.setVenue_id(rs.getInt("venue_id")); // Add this line to get venue_id
                bookings.add(booking);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return bookings;
    }
    
    // Add this method to get the venue name from venue ID
    public String getVenueNameByVenueId(int venueId) throws ClassNotFoundException {
        String venueName = null;
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT venue_name FROM events WHERE venue_id = ?")) {
            stmt.setInt(1, venueId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    venueName = rs.getString("venue_name");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return venueName;
    }
   
}