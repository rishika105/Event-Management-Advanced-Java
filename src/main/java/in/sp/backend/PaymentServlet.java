package in.sp.backend;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import in.sp.dao.PaymentDAO;
import in.sp.dao.BookingDAO;
import in.sp.model.PaymentDetails;
import in.sp.model.FoodModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private Connection getConnection() throws SQLException {
        String url = System.getenv("DB_URL");
        String user = System.getenv("DB_USERNAME");
        String password = System.getenv("DB_PASSWORD");
        return DriverManager.getConnection(url, user, password);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingIdStr = request.getParameter("bookingId");
        int bookingId = Integer.parseInt(bookingIdStr);

        BookingDAO bookingDAO = new BookingDAO();
        FoodModel food = null;
        BigDecimal eventPrice = BigDecimal.ZERO;
        BigDecimal totalCostBigDecimal = BigDecimal.ZERO;

        try {
            food = bookingDAO.getFoodByBookingId(bookingId);
            eventPrice = bookingDAO.getEventPriceByBookingId(bookingId);

            if (food != null) {
                totalCostBigDecimal = BigDecimal.valueOf(food.getTotalCost());
            }

            // Pass connection to PaymentDAO constructor
            try (Connection conn = getConnection()) {
                PaymentDAO paymentDAO = new PaymentDAO(conn);

                // Razorpay client initialization
                String razorpayKey = System.getenv("RAZORPAY_KEY");
                String razorpaySecret = System.getenv("RAZORPAY_SECRET");
                RazorpayClient razorpayClient = new RazorpayClient(razorpayKey, razorpaySecret);

                // Create order in Razorpay
                Map<String, Object> options = new HashMap<>();
                options.put("amount", totalCostBigDecimal.multiply(BigDecimal.valueOf(100)).intValue()); // Convert to paise
                options.put("currency", "INR");
                options.put("receipt", "txn_" + bookingId);

                Order order = razorpayClient.orders.create(new JSONObject(options));

                // Prepare payment model
                PaymentDetails payment = new PaymentDetails();
                payment.setBookingId(bookingId);
                payment.setPaymentAmount(totalCostBigDecimal); // Use BigDecimal here
                payment.setPaymentStatus("CREATED");
                payment.setRazorpayOrderId(order.get("id"));

                // Save the payment details to the database
                paymentDAO.savePayment(payment);

                // Set attributes and forward to JSP
                request.setAttribute("razorpayKey", razorpayKey);
                request.setAttribute("orderId", order.get("id"));
                request.setAttribute("bookingId", bookingId);
                request.setAttribute("eventPrice", eventPrice);
                request.setAttribute("foodItems", food != null ? food.getFoodItems() : ""); // Safe null check
                request.setAttribute("totalCost", totalCostBigDecimal);

                request.getRequestDispatcher("/payment.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
