package in.sp.backend;

import java.io.IOException;
import java.math.BigDecimal;

import in.sp.dao.BookingDAO;
import in.sp.model.Booking;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/booking")
public class Createbooking extends HttpServlet {
    private BookingDAO bookingDAO;

    @Override
    public void init() {
        bookingDAO = new BookingDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // Retrieve and validate form data
        String eventIdStr = request.getParameter("event_id");
        String numberOfTicketsStr = request.getParameter("number_of_tickets");
        String totalPriceStr = request.getParameter("total_price");
        String email = request.getParameter("email");

        try {
            if (eventIdStr == null || eventIdStr.isEmpty() ||
                numberOfTicketsStr == null || numberOfTicketsStr.isEmpty() ||
                totalPriceStr == null || totalPriceStr.isEmpty() ||
                email == null || email.isEmpty()) {
                
                throw new IllegalArgumentException("All fields must be filled out.");
            }

            int event_id = Integer.parseInt(eventIdStr);
            int number_of_tickets = Integer.parseInt(numberOfTicketsStr);
            BigDecimal total_price = new BigDecimal(totalPriceStr);
          
            // Create a new Booking object and populate it with data
            Booking booking = new Booking();
            booking.setEvent_id(event_id);
            booking.setNumber_of_tickets(number_of_tickets);
            booking.setTotal_price(total_price);
            booking.setEmail(email);

            // Save the booking using BookingDAO
            bookingDAO.addBooking(booking);

            // Redirect to a confirmation page
            response.sendRedirect("bookingConfirmation.jsp");

        } catch (NumberFormatException e) {
                }
    }
}
