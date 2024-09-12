<%@ page import="in.sp.model.Booking" %>
<%@ page import="in.sp.model.FoodModel" %>
<%@ page import="in.sp.model.TransportationModel" %>
<%@ page import="in.sp.model.PaymentModel" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Booking History</title>
    <link rel="stylesheet" href="styles.css"> <!-- Optional CSS file for styling -->
</head>
<body>
    <h1>Booking History</h1>

    <!-- Assuming a list of bookings is passed from the Createbooking servlet -->
   <%
    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
    if (bookings == null || bookings.isEmpty()) {
%>
    <p>No bookings found.</p>
<%
    } else {
        for (Booking booking : bookings) {
            FoodModel food = booking.getFoodDetails(); 
            TransportationModel transport = booking.getTransportationDetails();
            PaymentModel payment = booking.getPaymentDetails();
%>
            <tr>
                <td><%= booking.getEvent_type() %></td>
                <td><%= booking.getEvent_price() %></td>
                <td><%= booking.getDate() %></td>

                <!-- Food Details -->
                <td><%= food != null ? food.getFoodItems() : "N/A" %></td>
                <td><%= food != null ? food.getTotalCost() : "N/A" %></td>

                <!-- Transportation Details -->
                <td><%= transport != null ? transport.getVehicleType() : "N/A" %></td>
                <td><%= transport != null ? transport.getPickupLocation() : "N/A" %></td>
                <td><%= transport != null ? transport.getDropoffLocation() : "N/A" %></td>

                <!-- Payment Details -->
                <td><%= payment != null ? payment.getPaymentStatus() : "Pending" %></td>
                
                <!-- Cancel Booking -->
                <td>
                    <form action="booking2" method="post">
                        <input type="hidden" name="booking_id" value="<%= booking.getBooking_id() %>">
                        <input type="hidden" name="action" value="cancel">
                        <input type="submit" value="Cancel">
                    </form>
                </td>
            </tr>
<%
        }
    }
%>

            </tbody>
        </table>
</body>
</html>
