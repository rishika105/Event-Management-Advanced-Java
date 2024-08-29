package in.sp.backend;

import in.sp.dao.PaymentDAO;
import in.sp.model.PaymentDetails;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import org.json.JSONObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.Date;

@WebServlet("/processPayment")
public class PaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        
        try {
            // Fetch Razorpay API key and secret from environment variables
            String razorpayApiKey = System.getenv("RAZORPAY_KEY");
            String razorpayApiSecret = System.getenv("RAZORPAY_SECRET");

            // Initialize Razorpay client
            RazorpayClient razorpay = new RazorpayClient(razorpayApiKey, razorpayApiSecret);

            // Create a new order
            JSONObject orderRequest = new JSONObject();
            orderRequest.put("amount", amount * 100); // amount in paise
            orderRequest.put("currency", "INR");
            orderRequest.put("receipt", "txn_" + bookingId);

            Order order = razorpay.orders.create(orderRequest);

            // Save payment details
            PaymentDetails payment = new PaymentDetails();
            payment.setBookingId(bookingId);
            payment.setPaymentAmount(amount);
            payment.setPaymentDate(new Date());
            payment.setPaymentStatus("Pending");
            payment.setRazorpayOrderId(order.get("id"));

            // Database connection
            Connection connection = (Connection) getServletContext().getAttribute("DBConnection");
            PaymentDAO paymentDAO = new PaymentDAO(connection);
            paymentDAO.savePayment(payment);

            // Forward to payment page
            request.setAttribute("orderId", order.get("id"));
            request.setAttribute("amount", amount);
            request.setAttribute("bookingId", bookingId);
            request.getRequestDispatcher("payment.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
