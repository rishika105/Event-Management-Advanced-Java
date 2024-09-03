package in.sp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import in.sp.model.PaymentModel;

public class PaymentDAO {
    private static final String DB_URL = System.getenv("DB_URL");
    private static final String USER = System.getenv("DB_USERNAME");
    private static final String PASS = System.getenv("DB_PASSWORD");

    public boolean savePayment(PaymentModel paymentModel) {
        boolean isSaved = false;
        String query = "INSERT INTO payment (booking_id, payment_amount, payment_date, payment_status, razorpay_order_id, razorpay_payment_id, razorpay_signature) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, paymentModel.getBookingId());
            ps.setBigDecimal(2, paymentModel.getPaymentAmount());
            ps.setTimestamp(3, new java.sql.Timestamp(paymentModel.getPaymentDate().getTime()));
            ps.setString(4, paymentModel.getPaymentStatus());
            ps.setString(5, paymentModel.getRazorpayOrderId());
            ps.setString(6, paymentModel.getRazorpayPaymentId());
            ps.setString(7, paymentModel.getRazorpaySignature());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isSaved = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSaved;
    }

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found.");
        }
        return DriverManager.getConnection(DB_URL, USER, PASS);
    }
}
