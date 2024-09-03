package in.sp.backend;

import java.io.IOException;
import java.sql.SQLException;

import in.sp.dao.BookingDAO;
import in.sp.model.FoodModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FoodBooking")
public class FoodBooking extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDAO bookingDAO = new BookingDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String bookingIdStr = request.getParameter("booking_id");
        String foodItems = request.getParameter("food_items");
        String totalCostStr = request.getParameter("total_cost");
        String foodProviderName = request.getParameter("food_provider_name");
        String eventPriceStr = request.getParameter("event_price");  // Retrieve event price

        // Validate and parse inputs
        if (isNullOrEmpty(bookingIdStr, foodItems, totalCostStr, foodProviderName, eventPriceStr)) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("food.jsp").forward(request, response);
            return;
        }

        int bookingId;
        double totalCost;
        double eventPrice;
        try {
            bookingId = Integer.parseInt(bookingIdStr);
            totalCost = Double.parseDouble(totalCostStr);
            eventPrice = Double.parseDouble(eventPriceStr);  // Parse event price
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format.");
            request.getRequestDispatcher("food.jsp").forward(request, response);
            return;
        }

        // Create FoodModel object and set its properties
        FoodModel foodBooking = new FoodModel();
        foodBooking.setBookingId(bookingId);
        foodBooking.setFoodItems(foodItems);
        foodBooking.setTotalCost(totalCost);
        foodBooking.setFoodProviderName(foodProviderName);

        // Insert food booking into the database
        try {
            boolean isInserted = bookingDAO.addFoodBooking(foodBooking);
            if (isInserted) {
                // Redirect to the Transportation page with the booking ID, event price, and food cost
                response.sendRedirect("Transportation.jsp?booking_id=" + bookingId 
                                      + "&event_price=" + eventPrice 
                                      + "&food_cost=" + totalCost);
                return;
            } else {
                request.setAttribute("error", "Failed to add food booking.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
        }

        // Forward to the food.jsp page if there was an error
        request.getRequestDispatcher("food.jsp").forward(request, response);
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
