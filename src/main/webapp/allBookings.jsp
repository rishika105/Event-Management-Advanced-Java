<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="in.sp.model.Booking"%>
<%@ page import="in.sp.model.Event"%>
<%@ page import="in.sp.dao.EventDAO"%>
<%@ page import="in.sp.model.PaymentModel"%>
<%@ page import="in.sp.dao.PaymentDAO"%>
<%@ page import="in.sp.dao.BookingDAO"%>

<!DOCTYPE html>
<html>
<head>
<title>All User Bookings</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    h2 {
        text-align: center;
        padding: 20px;
        color: #333;
    }

    table {
        border-collapse: collapse;
        width: 80%;
        margin: 20px auto;
        background-color: #fff;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #7848f4;
        color: #fff;
    }

    td {
        background-color: #f9f9f9;
    }

    .container {
        width: 80%;
        margin: 0 auto;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>All User Bookings</h2>

        <table>
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Venue Name</th>
                    <th>User Email</th>
                    <th>Date</th>
                    <th>Total Payment</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                // Instantiate DAOs
                EventDAO eventDAO = new EventDAO();
                PaymentDAO paymentDAO = new PaymentDAO();
                BookingDAO bookingDAO = new BookingDAO();

                // Fetch all bookings (not restricted by email)
                List<Booking> bookings = bookingDAO.getAllUserBookings();

                if (bookings != null && bookings.size() > 0) {
                    for (Booking booking : bookings) {
                        String eventType = booking.getEvent_type();
                        Event event = eventDAO.getEventByType(eventType);
                        PaymentModel paymentModel = paymentDAO.getPaymentByBookingId(booking.getBooking_id());
                        String status = getStatus(booking.getDate());
                %>
                <tr>
                    <td><%=booking.getBooking_id()%></td>
                    <td><%=event != null ? event.getVenueName() : "N/A"%></td>
                    <td><%=booking.getEmail()%></td>
                    <td><%=booking.getDate()%></td>
                    <td><%=paymentModel != null ? paymentModel.getPaymentAmount() : "N/A"%></td>
                    <td><%=status%></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6" style="text-align:center;">No bookings found.</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>

<%!
// Method to calculate booking status based on date
private String getStatus(Date date) {
    Date currentDate = new Date();
    if (date.before(currentDate)) {
        return "Completed";
    } else if (date.equals(currentDate)) {
        return "Upcoming";
    } else {
        return "Pending";
    }
}
%>
