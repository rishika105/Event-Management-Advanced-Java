package in.sp.backend;

import java.io.IOException;
import java.sql.SQLException;

import in.sp.dao.BookingDAO;
import in.sp.model.TransportationModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/TransportationBooking")
public class TransportationBooking extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDAO bookingDAO = new BookingDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String bookingIdStr = request.getParameter("booking_id");
        String vehicleType = request.getParameter("vehicle_type");
        String pickupLocation = request.getParameter("pickup_location");
        String dropoffLocation = request.getParameter("dropoff_location");
        String pickupTime = request.getParameter("pickup_time");
        String priceStr = request.getParameter("price");
        String eventPriceStr = request.getParameter("event_price");  // Retrieve event price
        String foodCostStr = request.getParameter("food_cost");  // Retrieve food cost

        // Validate and parse inputs
        if (isNullOrEmpty(bookingIdStr, vehicleType, pickupLocation, dropoffLocation, pickupTime, priceStr, eventPriceStr, foodCostStr)) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("Transportation.jsp").forward(request, response);
            return;
        }

        int bookingId;
        double price;
        double eventPrice;
        double foodCost;
        try {
            bookingId = Integer.parseInt(bookingIdStr);
            price = Double.parseDouble(priceStr);
            eventPrice = Double.parseDouble(eventPriceStr);  // Parse event price
            foodCost = Double.parseDouble(foodCostStr);  // Parse food cost
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format.");
            request.getRequestDispatcher("Transportation.jsp").forward(request, response);
            return;
        }

        // Create TransportationModel object and set its properties
        TransportationModel transportationBooking = new TransportationModel();
        transportationBooking.setBookingId(bookingId);
        transportationBooking.setVehicleType(vehicleType);
        transportationBooking.setPickupLocation(pickupLocation);
        transportationBooking.setDropoffLocation(dropoffLocation);
        transportationBooking.setPickupTime(pickupTime);
        transportationBooking.setPrice(price);

        // Insert transportation booking into the database
        try {
            boolean isInserted = bookingDAO.addTransportationBooking(transportationBooking);
            if (isInserted) {
                // Redirect to the Payment page with the booking ID, event price, food cost, and transportation price
                response.sendRedirect("payment.jsp?booking_id=" + bookingId 
                                      + "&event_price=" + eventPrice 
                                      + "&food_cost=" + foodCost 
                                      + "&transport_price=" + price);
                return;
            } else {
                request.setAttribute("error", "Failed to add transportation booking.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
        }

        // Forward to the Transportation.jsp page if there was an error
        request.getRequestDispatcher("Transportation.jsp").forward(request, response);
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
