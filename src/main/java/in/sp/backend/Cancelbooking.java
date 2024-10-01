package in.sp.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cancel-booking")
public class Cancelbooking extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = System.getenv("DB_URL");
    private static final String DB_USER = System.getenv("DB_USERNAME");
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD");

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the booking ID from the request
        String bookingIdStr = request.getParameter("bookingId");

        if (bookingIdStr != null && !bookingIdStr.isEmpty()) {
            int bookingId = Integer.parseInt(bookingIdStr);

            // Establish a database connection within the servlet
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                // Step 1: Load the JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Step 2: Establish the connection
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

                // Step 3: Begin a transaction
                conn.setAutoCommit(false);

                // Step 4: Delete from transportation table
                String deleteTransportation = "DELETE FROM transportation WHERE booking_id = ?";
                pstmt = conn.prepareStatement(deleteTransportation);
                pstmt.setInt(1, bookingId);
                pstmt.executeUpdate();

                // Step 5: Delete from food table
                String deleteFood = "DELETE FROM food WHERE booking_id = ?";
                pstmt = conn.prepareStatement(deleteFood);
                pstmt.setInt(1, bookingId);
                pstmt.executeUpdate();

                // Step 6: Delete from payment table
                String deletePayment = "DELETE FROM payment WHERE booking_id = ?";
                pstmt = conn.prepareStatement(deletePayment);
                pstmt.setInt(1, bookingId);
                pstmt.executeUpdate();

                // Step 7: Delete from event_booking table
                String deleteEventBooking = "DELETE FROM event_booking WHERE booking_id = ?";
                pstmt = conn.prepareStatement(deleteEventBooking);
                pstmt.setInt(1, bookingId);
                pstmt.executeUpdate();

                // Step 8: Commit the transaction if all deletions are successful
                conn.commit();

                // Send success message to the user with a toast message
                response.sendRedirect("bookingHistory.jsp?status=success&message=Booking+Cancelled!+Payment+will+be+refunded+shortly.");

            } catch (SQLException | ClassNotFoundException e) {
                // Roll back the transaction in case of error
                try {
                    if (conn != null) {
                        conn.rollback();
                    }
                } catch (SQLException rollbackEx) {
                    rollbackEx.printStackTrace();
                }
                // Log the error and redirect to an error page with an error message
                e.printStackTrace();
                response.sendRedirect("bookingHistory.jsp?status=error&message=An+error+occurred.+Please+try+again.");
            } finally {
                // Step 9: Close the resources
                try {
                    if (pstmt != null) {
                        pstmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        } else {
            // Invalid booking ID scenario
            response.sendRedirect("bookingHistory.jsp?status=invalidId&message=Invalid+booking+ID.");
        }
    }
}
