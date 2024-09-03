package in.sp.backend;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;

import in.sp.dao.PaymentDAO;
import in.sp.model.PaymentModel;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("booking_id"));
        BigDecimal eventPrice = new BigDecimal(request.getParameter("event_price"));
        BigDecimal foodCost = new BigDecimal(request.getParameter("food_cost"));
        BigDecimal transportPrice = new BigDecimal(request.getParameter("transport_price"));
        BigDecimal totalCost = eventPrice.add(foodCost).add(transportPrice);

        String razorpayPaymentId = request.getParameter("razorpay_payment_id");
        String razorpayOrderId = request.getParameter("razorpay_order_id");
        String razorpaySignature = request.getParameter("razorpay_signature");

        PaymentModel paymentModel = new PaymentModel();
        paymentModel.setBookingId(bookingId);
        paymentModel.setPaymentAmount(totalCost);
        paymentModel.setPaymentDate(new java.util.Date());
        paymentModel.setPaymentStatus("completed");
        paymentModel.setRazorpayPaymentId(razorpayPaymentId);
        paymentModel.setRazorpayOrderId(razorpayOrderId);
        paymentModel.setRazorpaySignature(razorpaySignature);

        PaymentDAO paymentDAO = new PaymentDAO();
        if (paymentDAO.savePayment(paymentModel)) {
            response.sendRedirect("bookingConfirmation.jsp?booking_id=" + bookingId);
        } else {
            request.setAttribute("error", "Error processing payment. Please try again.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        }
    }
}
