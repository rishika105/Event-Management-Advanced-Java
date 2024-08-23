package in.sp.backend;

import java.io.IOException;
import java.util.List;

import in.sp.dao.BookingDAO;
import in.sp.model.Booking;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/bookingHistory")
public class BookingHistoryServlet extends HttpServlet {
    private BookingDAO bookingDAO;

    @Override
    public void init() {
        bookingDAO = new BookingDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        List<Booking> bookings = bookingDAO.getBookingHistory(email);

        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("bookingHistory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookingIdStr = request.getParameter("booking_id");

        if (bookingIdStr != null && !bookingIdStr.isEmpty()) {
            int bookingId = Integer.parseInt(bookingIdStr);
            boolean isCanceled = bookingDAO.cancelBooking(bookingId);

            if (isCanceled) {
                request.setAttribute("message", "Booking canceled successfully.");
            } else {
                request.setAttribute("message", "Failed to cancel booking.");
            }
        }

        doGet(request, response); // Refresh the booking history
    }
}
