package in.sp.backend;

import in.sp.dao.FoodBookingDAO;
import in.sp.model.FoodModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/FoodBooking")
public class FoodBooking extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Generate a new booking ID or get it from somewhere if it's pre-existing
        int bookingId = generateNewBookingId(); // Implement this method as needed

        String[] foodItemsArray = request.getParameterValues("food_items");
        String foodItems = foodItemsArray != null ? String.join(", ", foodItemsArray) : "";
        double totalCost = Double.parseDouble(request.getParameter("total_cost"));
        String foodProviderName = request.getParameter("food_provider_name");

        FoodModel booking = new FoodModel();
        booking.setBookingId(bookingId);
        booking.setFoodItems(foodItems);
        booking.setTotalCost(totalCost);
        booking.setFoodProviderName(foodProviderName);

        try {
            FoodBookingDAO dao = new FoodBookingDAO();
            boolean success = dao.addFoodBooking(booking);
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
        // For example, querying the database for the latest ID or using an auto-increment field
        return 1; // Placeholder value, implement actual ID generation
    }
}
