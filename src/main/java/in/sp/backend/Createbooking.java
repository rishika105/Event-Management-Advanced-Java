package in.sp.backend;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import in.sp.dao.BookingDAO;
import in.sp.model.Booking;
import in.sp.model.FoodModel;
import in.sp.model.TransportationModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/booking3")
public class Createbooking extends HttpServlet {
    private BookingDAO bookingDAO = new BookingDAO();
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String step = request.getParameter("step");

        if ("event".equalsIgnoreCase(step)) {
            bookEvent(request, response);
        } else if ("food".equalsIgnoreCase(step)) {
            bookFood(request, response);
        } else if ("transportation".equalsIgnoreCase(step)) {
            bookTransportation(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid step");
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
                request.getRequestDispatcher("event.jsp").forward(request, response);
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
            response.sendRedirect("food.jsp?booking_id=" + bookingId);
        } catch (NumberFormatException | ParseException e) {
            request.setAttribute("error", "Invalid input format.");
            request.getRequestDispatcher("event.jsp").forward(request, response);
        }
    }

    private void bookFood(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookingIdStr = request.getParameter("booking_id");
        String foodItems = request.getParameter("food_items");
        String totalCostStr = request.getParameter("total_cost");
        String foodProviderName = request.getParameter("food_provider_name");

        if (isNullOrEmpty(bookingIdStr, foodItems, totalCostStr, foodProviderName)) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("food.jsp").forward(request, response);
            return;
        }

        try {
            int bookingId = Integer.parseInt(bookingIdStr);
            double totalCost = Double.parseDouble(totalCostStr);

            FoodModel foodBooking = new FoodModel();
            foodBooking.setBookingId(bookingId);
            foodBooking.setFoodItems(foodItems);
            foodBooking.setTotalCost(totalCost);
            foodBooking.setFoodProviderName(foodProviderName);

            // Insert food booking into the database
            boolean isInserted = bookingDAO.addFoodBooking(foodBooking);
            if (isInserted) {
                // Redirect to transportation.jsp with booking_id as a parameter
                response.sendRedirect("transportation.jsp?booking_id=" + bookingId);
            } else {
                request.setAttribute("error", "Failed to add food booking.");
                request.getRequestDispatcher("food.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format.");
            request.getRequestDispatcher("food.jsp").forward(request, response);
        }
    }

    private void bookTransportation(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookingIdStr = request.getParameter("booking_id");
        String vehicleType = request.getParameter("vehicle_type");
        String pickupLocation = request.getParameter("pickup_location");
        String dropoffLocation = request.getParameter("dropoff_location");
        String pickupTime = request.getParameter("pickup_time");
        String priceStr = request.getParameter("price");

        if (isNullOrEmpty(bookingIdStr, vehicleType, pickupLocation, dropoffLocation, pickupTime, priceStr)) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("transportation.jsp").forward(request, response);
            return;
        }

        try {
            int bookingId = Integer.parseInt(bookingIdStr);
            double price = Double.parseDouble(priceStr);

            TransportationModel transportationBooking = new TransportationModel();
            transportationBooking.setBookingId(bookingId);
            transportationBooking.setVehicleType(vehicleType);
            transportationBooking.setPickupLocation(pickupLocation);
            transportationBooking.setDropoffLocation(dropoffLocation);
            transportationBooking.setPickupTime(pickupTime);
            transportationBooking.setPrice(price);

            // Insert transportation booking into the database
            boolean isInserted = bookingDAO.addTransportationBooking(transportationBooking);
            if (isInserted) {
                request.setAttribute("success", "All bookings completed successfully.");
                request.getRequestDispatcher("confirmation.jsp").forward(request, response);  // Redirect to a confirmation page
            } else {
                request.setAttribute("error", "Failed to add transportation booking.");
                request.getRequestDispatcher("transportation.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format.");
            request.getRequestDispatcher("transportation.jsp").forward(request, response);
        }
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
