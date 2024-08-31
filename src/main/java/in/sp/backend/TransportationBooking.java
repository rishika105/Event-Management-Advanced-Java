package in.sp.backend;

import in.sp.dao.TransportationDAO;
import in.sp.model.TransportationModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/TransportationBooking")
public class TransportationBooking extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TransportationDAO transportationDAO;

    @Override
    public void init() throws ServletException {
        transportationDAO = new TransportationDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from the form
        int bookingId = Integer.parseInt(request.getParameter("booking_id"));
        String vehicleType = request.getParameter("vehicle_type");
        String pickupLocation = request.getParameter("pickup_location");
        String dropoffLocation = request.getParameter("dropoff_location");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        
        // Parse the pickupTime parameter
        String pickupTimeStr = request.getParameter("pickup_time");
        Time pickupTime = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
            pickupTime = new Time(sdf.parse(pickupTimeStr).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // Create a new TransportationModel object
        TransportationModel transportation = new TransportationModel();
        transportation.setBookingId(bookingId);
        transportation.setVehicleType(vehicleType);
        transportation.setPickupLocation(pickupLocation);
        transportation.setDropoffLocation(dropoffLocation);
        transportation.setPrice(price);
        transportation.setPickupTime(pickupTime);

        // Insert the transportation booking into the database
        boolean isInserted = false;
        try {
            isInserted = transportationDAO.addTransportationBooking(transportation);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect or forward based on the result
        if (isInserted) {
            response.sendRedirect("success.jsp"); // Redirect to a success page
        } else {
            response.sendRedirect("error.jsp"); // Redirect to an error page
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET requests if necessary
        doPost(request, response);
    }
}
