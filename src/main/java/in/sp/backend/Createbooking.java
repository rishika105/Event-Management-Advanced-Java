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

@WebServlet("/bookingg")
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
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }

    private void bookEvent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Validate required parameters
            String eventType = request.getParameter("event_type");
            String numberOfGuestsStr = request.getParameter("number_of_guests");
            String eventPriceStr = request.getParameter("event_price");
            String email = request.getParameter("email");
            String dateStr = request.getParameter("date");
            String phone = request.getParameter("phone");

            if (isNullOrEmpty(eventType, numberOfGuestsStr, eventPriceStr, email, dateStr, phone)) {
                throw new IllegalArgumentException("All fields must be filled out.");
            }

            Booking booking = new Booking();
            booking.setEvent_type(eventType);
            booking.setNumber_of_guests(Integer.parseInt(numberOfGuestsStr));
            booking.setEvent_price(new BigDecimal(eventPriceStr));
            booking.setEmail(email);
            booking.setDate(DATE_FORMAT.parse(dateStr));
            booking.setPhone(phone);

            bookingDAO.insertBooking(booking);
            response.sendRedirect("bookingConfirmation.jsp");
        } catch (NumberFormatException | ParseException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input format");
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
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
        response.sendRedirect("bookingCancellation.jsp");
    }

    private void showBookingHistory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        if (isNullOrEmpty(email)) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Email is required");
            return;
        }

        List<Booking> bookings = bookingDAO.retrieveBookingsByEmail(email);
        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("bookingHistory.jsp").forward(request, response);
    }

    private boolean isNullOrEmpty(String... params) {
        for (String param : params) {
            if (param == null || param.trim().isEmpty()) {
                return true;
            }
        }
        return false;
    }
}
