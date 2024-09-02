package in.sp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import in.sp.model.PaymentDetails;

public class PaymentDAO {

    private Connection connection;

    public PaymentDAO(Connection connection) {
        this.connection = connection;
    }

  



	public void savePayment(PaymentDetails payment) {
        String sql = "INSERT INTO payment (booking_id, payment_amount, payment_date, payment_status, razorpay_order_id, razorpay_payment_id, razorpay_signature) "
                   + "VALUES (?, ?, NOW(), ?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, payment.getBookingId());
            stmt.setBigDecimal(2, payment.getPaymentAmount());
            stmt.setString(3, payment.getPaymentStatus());
            stmt.setString(4, payment.getRazorpayOrderId());
            stmt.setString(5, payment.getRazorpayPaymentId());
            stmt.setString(6, payment.getRazorpaySignature());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public PaymentDetails getPaymentByOrderId(String orderId) {
        PaymentDetails payment = null;
        String sql = "SELECT * FROM payment WHERE razorpay_order_id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, orderId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    payment = new PaymentDetails();
                    payment.setPaymentId(rs.getInt("payment_id"));
                    payment.setBookingId(rs.getInt("booking_id"));
                    payment.setPaymentAmount(rs.getBigDecimal("payment_amount"));
                    payment.setPaymentDate(rs.getTimestamp("payment_date"));
                    payment.setPaymentStatus(rs.getString("payment_status"));
                    payment.setRazorpayOrderId(rs.getString("razorpay_order_id"));
                    payment.setRazorpayPaymentId(rs.getString("razorpay_payment_id"));
                    payment.setRazorpaySignature(rs.getString("razorpay_signature"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return payment;
    }
}
