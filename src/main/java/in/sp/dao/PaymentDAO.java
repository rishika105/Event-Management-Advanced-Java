package in.sp.dao;

import in.sp.model.PaymentDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PaymentDAO {

    private Connection connection;

    public PaymentDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean savePayment(PaymentDetails payment) throws SQLException {
        String query = "INSERT INTO payment (booking_id, payment_amount, payment_date, payment_status, razorpay_order_id, razorpay_payment_id, razorpay_signature) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, payment.getBookingId());
            pstmt.setDouble(2, payment.getPaymentAmount());
            pstmt.setTimestamp(3, new java.sql.Timestamp(payment.getPaymentDate().getTime()));
            pstmt.setString(4, payment.getPaymentStatus());
            pstmt.setString(5, payment.getRazorpayOrderId());
            pstmt.setString(6, payment.getRazorpayPaymentId());
            pstmt.setString(7, payment.getRazorpaySignature());

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        }
    }

    public PaymentDetails getPaymentByBookingId(int bookingId) throws SQLException {
        String query = "SELECT * FROM payment WHERE booking_id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, bookingId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                	PaymentDetails payment = new PaymentDetails();
                    payment.setPaymentId(rs.getInt("payment_id"));
                    payment.setBookingId(rs.getInt("booking_id"));
                    payment.setPaymentAmount(rs.getDouble("payment_amount"));
                    payment.setPaymentDate(rs.getTimestamp("payment_date"));
                    payment.setPaymentStatus(rs.getString("payment_status"));
                    payment.setRazorpayOrderId(rs.getString("razorpay_order_id"));
                    payment.setRazorpayPaymentId(rs.getString("razorpay_payment_id"));
                    payment.setRazorpaySignature(rs.getString("razorpay_signature"));
                    return payment;
                }
            }
        }
        return null;
    }
    public double getEventCost(int bookingId) throws SQLException {
        String query = "SELECT total_price FROM booking WHERE booking_id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, bookingId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble("total_price");
                }
            }
        }
        return 0.0;
    }

    public double getFoodCost(int bookingId) throws SQLException {
        String query = "SELECT total_cost FROM food WHERE booking_id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, bookingId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble("total_cost");
                }
            }
        }
        return 0.0;
    }

    public double getTransportationCost(int bookingId) throws SQLException {
        String query = "SELECT total_cost FROM transportation WHERE booking_id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, bookingId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble("total_cost");
                }
            }
        }
        return 0.0;
    }

    public double getTotalCost(int bookingId) throws SQLException {
        return getEventCost(bookingId) + getFoodCost(bookingId) + getTransportationCost(bookingId);
    }

}
