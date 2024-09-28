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
        	refundAndCancelBooking(request, response);
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
            // Extract parameters from the request
            String eventType = request.getParameter("event_type");
            String venueIdStr = request.getParameter("venue_id"); // New parameter for venue ID
            String numberOfGuestsStr = request.getParameter("number_of_guests");
            String eventPriceStr = request.getParameter("event_price");
            String email = request.getParameter("email");
            String dateStr = request.getParameter("date");
            String phone = request.getParameter("phone");
           

            // Check if all required fields are filled
            if (isNullOrEmpty(eventType, numberOfGuestsStr, eventPriceStr, email, dateStr, phone, venueIdStr)) {
                request.setAttribute("error", "All fields must be filled out.");
                request.getRequestDispatcher("food.jsp").forward(request, response);
                return;
            }

            // Create a new Booking object and populate it
            Booking booking = new Booking();
            booking.setEvent_type(eventType);
            booking.setNumber_of_guests(Integer.parseInt(numberOfGuestsStr));
            booking.setEvent_price(new BigDecimal(eventPriceStr));
            booking.setEmail(email);
            booking.setDate(DATE_FORMAT.parse(dateStr));
            booking.setPhone(phone);
            booking.setVenue_id(Integer.parseInt(venueIdStr)); // Set venue ID

            // Insert booking and retrieve the generated id
            int bookingId = bookingDAO.insertBooking(booking);

            // Redirect to food.jsp with booking_id and event_price as parameters
            response.sendRedirect("food.jsp?booking_id=" + bookingId + "&event_price=" + eventPriceStr);
        } catch (NumberFormatException | ParseException e) {
            request.setAttribute("error", "Invalid input format.");
            request.getRequestDispatcher("food.jsp").forward(request, response);
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("food.jsp").forward(request, response);
        }
    }


 // Function to cancel a booking and process a refund
    private void refundAndCancelBooking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingIdStr = request.getParameter("booking_id");

        try {
            int bookingId = Integer.parseInt(bookingIdStr);

            // Get the total cost (event price, food, transportation) before cancellation
            BigDecimal totalCost = bookingDAO.calculateTotalCost(bookingId);

            // Delete the booking and related entries (food, transportation, payment) within the BookingDAO
            boolean cancellationSuccess = bookingDAO.cancelBookingAndRelatedEntries(bookingId);

            if (cancellationSuccess) {
                // Set success message with the refund amount
                request.setAttribute("success", "Booking canceled. A total refund of " + totalCost + " has been initiated.");
            } else {
                request.setAttribute("error", "Failed to cancel the booking.");
            }
            request.getRequestDispatcher("history.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid booking ID.");
            request.getRequestDispatcher("history.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error occurred while canceling the booking: " + e.getMessage());
            request.getRequestDispatcher("history.jsp").forward(request, response);
        }
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
        request.getRequestDispatcher("history.jsp").forward(request, response);
    }

    private void showAllBookings(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Booking> allBookings = bookingDAO.getAllUserBookings();

        request.setAttribute("allBookings", allBookings);
        
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