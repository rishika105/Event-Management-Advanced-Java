package in.sp.backend;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import in.sp.dao.BookingDAO;
import in.sp.model.Booking;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/booking2")
public class Createbooking extends HttpServlet {
    private BookingDAO bookingDAO = new BookingDAO();
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("book".equalsIgnoreCase(action)) {
            bookEvent(request, response);
        } else if ("cancel".equalsIgnoreCase(action)) {
            cancelBooking(request, response);
        } else if ("history".equalsIgnoreCase(action)) {
            showBookingHistory(request, response);
        } else if ("adminBookings".equalsIgnoreCase(action)) {
            showAllBookings(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }

    private void bookEvent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String eventType = request.getParameter("event_type");
            String numberOfGuestsStr = request.getParameter("number_of_guests");
            String eventPriceStr = request.getParameter("event_price");
            String email = request.getParameter("email");
            String dateStr = request.getParameter("date");
            String phone = request.getParameter("phone");

            if (isNullOrEmpty(eventType, numberOfGuestsStr, eventPriceStr, email, dateStr, phone)) {
                request.setAttribute("error", "All fields must be filled out.");
                request.getRequestDispatcher("food.jsp").forward(request, response);
                return;
            }

            Booking booking = new Booking();
            booking.setEvent_type(eventType);
            booking.setNumber_of_guests(Integer.parseInt(numberOfGuestsStr));
            booking.setEvent_price(new BigDecimal(eventPriceStr));
            booking.setEmail(email);
            booking.setDate(DATE_FORMAT.parse(dateStr));
            booking.setPhone(phone);

            // Insert booking and retrieve the generated id
            int bookingId = bookingDAO.insertBooking(booking);

            // Redirect to food.jsp with booking_id as a parameter
            response.sendRedirect("food.jsp?booking_id=" + bookingId + "&event_price=" + eventPriceStr);
        } catch (NumberFormatException | ParseException e) {
            request.setAttribute("error", "Invalid input format.");
            request.getRequestDispatcher("food.jsp").forward(request, response);
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("food.jsp").forward(request, response);
        }
    }

    private void cancelBooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String eventType = request.getParameter("event_type");

        if (isNullOrEmpty(email, eventType)) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Email and Event Type are required");
            return;
        }

        bookingDAO.cancelBookingByEmailAndEventType(email, eventType);

        request.setAttribute("success", "Booking canceled successfully.");
        request.getRequestDispatcher("bookingCancel.jsp").forward(request, response);
    }

    private void showBookingHistory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        if (isNullOrEmpty(email)) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Email is required");
            return;
        }

        // Use the updated DAO method to get detailed booking history
        List<Booking> bookings = bookingDAO.getBookingHistoryByEmail(email);

        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("bookingHistory.jsp").forward(request, response);
    }

    private void showAllBookings(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Booking> allBookings = bookingDAO.getAllUserBookings();

        request.setAttribute("allBookings", allBookings);
        request.getRequestDispatcher("adminBookings.jsp").forward(request, response);
    }

    // Utility method to check if any of the provided strings are null or empty
    private boolean isNullOrEmpty(String... params) {
        for (String param : params) {
            if (param == null || param.trim().isEmpty()) {
                return true;
            }
        }
        return false;
    }
}
