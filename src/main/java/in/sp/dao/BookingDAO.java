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
    
    
    
    private Connection conn;

    public BookingDAO(Connection conn) {
        this.conn = conn;
    }

    public BookingDAO() {
		// TODO Auto-generated constructor stub
	}

	public List<Booking> getBookingHistoryByEmail(String email) throws SQLException {
        String sql = "SELECT eb.*, f.*, t.*, p.* " +
                     "FROM event_booking eb " +
                     "LEFT JOIN food f ON eb.booking_id = f.booking_id " +
                     "LEFT JOIN transportation t ON eb.booking_id = t.booking_id " +
                     "LEFT JOIN payment p ON eb.booking_id = p.booking_id " +
                     "WHERE eb.email = ?";
        
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        List<Booking> bookingList = new ArrayList<>();

        while (rs.next()) {
            Booking booking = new Booking();
            // Set booking details
            booking.setBooking_id(rs.getInt("booking_id"));
            booking.setEvent_type(rs.getString("event_type"));
            booking.setNumber_of_guests(rs.getInt("number_of_guests"));
            booking.setEvent_price(rs.getBigDecimal("event_price"));
            booking.setEmail(rs.getString("email"));
            booking.setDate(rs.getDate("date"));
            booking.setPhone(rs.getString("phone"));

            // Set food details
            FoodModel food = new FoodModel();
            food.setFoodId(rs.getInt("food_id"));
            food.setFoodItems(rs.getString("food_items"));
            food.setTotalCost(rs.getDouble("total_cost"));
            food.setFoodProviderName(rs.getString("food_provider_name"));
            booking.setFoodDetails(food);

            // Set transportation details
            TransportationModel transport = new TransportationModel();
            transport.setTransportationId(rs.getInt("transportationId"));
            transport.setVehicleType(rs.getString("vehicle_type"));
            transport.setPickupLocation(rs.getString("pickupLocation"));
            transport.setDropoffLocation(rs.getString("dropoffLocation"));
            
            transport.setPrice(rs.getDouble ("price"));
            booking.setTransportationDetails(transport);

            // Set payment details
            PaymentModel payment = new PaymentModel();
            payment.setPaymentAmount(rs.getBigDecimal("paymentAmount"));
            payment.setPaymentDate(rs.getTimestamp("paymentDate"));
            payment.setPaymentStatus(rs.getString("paymentStatus"));
            payment.setRazorpayOrderId(rs.getString("razorpayOrderId"));
            payment.setRazorpayPaymentId(rs.getString("razorpayOrderId"));
            payment.setRazorpaySignature(rs.getString("razorpaySignature"));
            booking.setPaymentDetails(payment);

            // Add to the list
            bookingList.add(booking);
        }

        return bookingList;
    }



    // Method to cancel a booking by booking ID
    public boolean cancelBooking(int bookingId) throws SQLException {
        String sql = "DELETE FROM event_booking WHERE booking_id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, bookingId);
        int rowsDeleted = ps.executeUpdate();

        return rowsDeleted > 0;
    }



	public List<Booking> getAllUserBookings() {
		// TODO Auto-generated method stub
		return null;
	}


	
}