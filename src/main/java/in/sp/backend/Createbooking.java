package in.sp.backend;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import in.sp.dao.BookingDAO;
import in.sp.model.Booking;
import jakarta.servlet.RequestDispatcher;
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
            try {
				showBookingHistory(request, response);
			} catch (ServletException | IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
                RequestDispatcher dispatcher = request.getRequestDispatcher("food.jsp");
                dispatcher.forward(request, response);
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

            // Redirect to food.jsp with booking_id and event_price as parameters
            response.sendRedirect("food.jsp?booking_id=" + bookingId + "&event_price=" + eventPriceStr);
        } catch (NumberFormatException | ParseException e) {
            request.setAttribute("error", "Invalid input format.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("food.jsp");
            dispatcher.forward(request, response);
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("food.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
            request.setAttribute("error", "An unexpected error occurred.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("food.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void cancelBooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implementation needed for canceling a booking
        // Use bookingDAO to cancel the booking
    }

    private void showBookingHistory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String email = request.getParameter("email");
        if (isNullOrEmpty(email)) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Email is required");
            return;
        }

        List<Booking> bookings = bookingDAO.getBookingHistoryByEmail(email);
        request.setAttribute("bookings", bookings);
        if (bookings != null) {
            System.out.println("Bookings retrieved: " + bookings.size());
            
            // Optionally print details of each booking
            for (Booking booking : bookings) {
                System.out.println("Booking ID: " + booking.getBooking_id() + ", Event Type: " + booking.getEvent_type());
            }
        } else {
            System.out.println("No bookings found for email: " + email);
        }
        
        // Set bookings in the request attribute and forward to JSP
        request.setAttribute("bookings", bookings);
        RequestDispatcher dispatcher = request.getRequestDispatcher("booking_history.jsp");
        dispatcher.forward(request, response);

    }

    private void showAllBookings(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Booking> allBookings = bookingDAO.getAllUserBookings();
        request.setAttribute("allBookings", allBookings);
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminBookings.jsp");
        dispatcher.forward(request, response);
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
