<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>All Bookings</title>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}
</style>
</head>
<body>
	<h2>All Bookings</h2>
	<table>
		<tr>
			<th>Booking ID</th>
			<th>Venue Name</th>
			<th>Email</th>
			<th>Date</th>
			<th>Total Payment</th>
			<th>Status</th>
		</tr>
		<%
		EventDAO eventDAO = new EventDAO();
		PaymentDAO paymentDAO = new PaymentDAO();
		BookingDAO bookingDAO = new BookingDAO();
		List<Booking> bookings = bookingDAO.retrieveBookingsByEmail("admin@example.com"); // Replace with admin's email

		for (Booking booking : bookings) {
			String eventType = booking.getEvent_type();
			Event event = eventDAO.getEventByType(booking.getEvent_type());
			PaymentModel paymentModel = paymentDAO.getPaymentByBookingId(booking.getBooking_id());
			String status = getStatus(booking.getDate());
		%>
		<tr>
			<td><%=booking.getBooking_id()%></td>
			<td><%=event.getVenueName()%></td>
			<td><%=booking.getEmail()%></td>
			<td><%=booking.getDate()%></td>
			<td><%=paymentModel.getPaymentAmount()%></td>
			<td><%=status%></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>

<%!// Method to calculate status based on date
	private String getStatus(Date date) {
		Date currentDate = new Date();
		if (date.before(currentDate)) {
			return "Completed";
		} else if (date.equals(currentDate)) {
			return "Upcoming";
		} else {
			return "Pending";
		}
	}%>