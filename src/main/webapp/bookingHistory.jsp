<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="in.sp.model.Booking"%>
<%@ page import="in.sp.dao.BookingDAO"%>
<%@ page import="in.sp.dao.PaymentDAO"%>
<%@ page import="in.sp.dao.EventDAO"%>
<%@ page import="in.sp.model.PaymentModel"%>

<!DOCTYPE html>
<html>
<head>
<title>User Bookings</title>
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
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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

.cancel-btn {
	padding: 5px 10px;
	background-color: #f44336;
	color: white;
	border: none;
	cursor: pointer;
}

/* Modal styling */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fff;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 30%;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
}

.modal-header {
	font-size: 18px;
	margin-bottom: 15px;
	text-align: center;
}

.modal-buttons {
	text-align: center;
	margin-top: 20px;
}

.confirm-btn {
	background-color: #f44336;
	color: white;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	margin-right: 10px;
}

.cancel-btn-modal {

		background-color: #7848f4;
	color: white;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
}
</style>
</head>

<body>
	<div class="container">
		<h2>My Bookings</h2>

		<table>
			<thead>
				<tr>
					<th>Booking ID</th>
					<th>Venue Name</th>
					<th>Date</th>
					<th>Total Payment</th>
					<th>Status</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				String userEmail = (String) session.getAttribute("userEmail");

				if (userEmail == null) {
					out.println("No user email found in session.");
				} else {
					BookingDAO bookingDAO = new BookingDAO();
					PaymentDAO paymentDAO = new PaymentDAO();
					EventDAO eventDAO = new EventDAO(); 

					List<Booking> bookings = bookingDAO.retrieveBookingsByEmail(userEmail);

					if (bookings != null && bookings.size() > 0) {
						for (Booking booking : bookings) {
							PaymentModel paymentModel = paymentDAO.getPaymentByBookingId(booking.getBooking_id());
							String venueName = bookingDAO.getVenueNameByVenueId(booking.getVenue_id());
							String status = getStatus(booking.getDate());
				%>

				<tr>
					<td><%=booking.getBooking_id()%></td>
					<td><%=venueName != null ? venueName : "N/A"%></td>
					<td><%=booking.getDate()%></td>
					<td><%=paymentModel != null ? paymentModel.getPaymentAmount() : "N/A"%></td>
					<td><%=status%></td>
					<td>
						<button class="cancel-btn" onclick="openModal('<%=booking.getBooking_id()%>')">Cancel Event</button>
					</td>
				</tr>
				<%
						}
					} else {
				%>
				<tr>
					<td colspan="6" style="text-align: center;">No bookings found for user: <%=userEmail%></td>
				</tr>
				<%
					}
				}
				%>
			</tbody>
		</table>
	</div>

	<!-- Modal HTML -->
	<div id="confirmationModal" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<p>Are you sure you want to cancel this booking?</p>
			</div>
			<div class="modal-buttons">
				<form id="cancelForm" action="cancel-booking" method="get">
					<input type="hidden" id="modalBookingId" name="bookingId" value="">
					<button type="submit" class="confirm-btn">Yes, Cancel Booking</button>
				</form>
				<br>
				<button class="cancel-btn-modal" onclick="closeModal()">No, Go Back</button>
			</div>
		</div>
	</div>

	<script>
		// Function to open the modal with the specific booking ID
		function openModal(bookingId) {
			document.getElementById('modalBookingId').value = bookingId;
			document.getElementById('confirmationModal').style.display = 'block';
		}

		// Function to close the modal
		function closeModal() {
			document.getElementById('confirmationModal').style.display = 'none';
		}

		// Check for URL parameters for messages
		const urlParams = new URLSearchParams(window.location.search);
		const status = urlParams.get('status');
		const message = urlParams.get('message');

		if (status && message) {
			alert(decodeURIComponent(message));
		}
	</script>
</body>
</html>

<%!// Method to calculate booking status based on date
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