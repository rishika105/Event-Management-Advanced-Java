package in.sp.backend;

import in.sp.dao.TransportationDAO;
import in.sp.model.TransportationModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/TransportationBooking")
public class TransportationBooking extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = generateNewBookingId(); // Implement this method as needed

        String vehicleType = request.getParameter("vehicle_type");
        String pickupLocation = request.getParameter("pickup_location");
        String dropoffLocation = request.getParameter("dropoff_location");
        String pickupTime = request.getParameter("pickup_time");
        double price = Double.parseDouble(request.getParameter("price"));

        TransportationModel booking = new TransportationModel();
        booking.setBookingId(bookingId);
        booking.setVehicleType(vehicleType);
        booking.setPickupLocation(pickupLocation);
        booking.setDropoffLocation(dropoffLocation);
        booking.setPickupTime(pickupTime);
        booking.setPrice(price);

        try {
            TransportationDAO dao = new TransportationDAO();
            boolean success = dao.addTransportationBooking(booking);
            if (success) {
                response.sendRedirect("success.jsp"); // Redirect to a success page
            } else {
                response.sendRedirect("error.jsp"); // Redirect to an error page
            }
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }

    private int generateNewBookingId() {
        // Implement logic to generate or retrieve a new booking ID
        return 1; // Placeholder value, implement actual ID generation
    }
}
