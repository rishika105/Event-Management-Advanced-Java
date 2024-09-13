package in.sp.backend;


import java.io.IOException;
import java.io.PrintWriter;

import in.sp.dao.BookingDAO;
import in.sp.dao.PaymentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

	@WebServlet("/CancelServletPage")
	public class Cancelbooking extends HttpServlet {
	    private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html");
	        PrintWriter out = response.getWriter();

	        int bookingId = Integer.parseInt(request.getParameter("bookingId"));

	        BookingDAO bookingDAO = new BookingDAO();
	        PaymentDAO paymentDAO = new PaymentDAO();

	        if (bookingDAO.cancelBookingAndRelatedEntries(bookingId)) {
			    out.println("<h1>Event cancelled successfully!</h1>");
			} else {
			    out.println("<h1>Error cancelling event!</h1>");
			}
	    }

	    	}


