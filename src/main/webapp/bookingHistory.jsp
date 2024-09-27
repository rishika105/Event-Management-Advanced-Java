
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Booking History</title>
</head>
<body>
    <h2>Your Booking History</h2>
    
    <form action="booking2" method="post">
        <input type="hidden" name="action" value="history"/>
        <label for="booking_id">Enter your booking ID to view booking history:</label>
        <input type="number" name="booking_id" id="booking_id" required>
        <input type="submit" value="View History">
    </form>

    <c:if test="${not empty booking}">
        <table border="1">
            <thead>
                <tr>
                    <th>Event Type</th>
                    <th>Number of Guests</th>
                    <th>Event Price</th>
                    <th>Date</th>
                    <th>Phone</th>
                    <th>Pickup Location</th>
                    <th>Dropoff Location</th>
                    <th>Pickup Time</th>
                    <th>Vehicle Type</th>
                    <th>Food Provider</th>
                    <th>Food Items</th>
                    <th>Total Food Cost</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${booking.event_type}</td>
                    <td>${booking.number_of_guests}</td>
                    <td>${booking.event_price}</td>
                    <td><fmt:formatDate value="${booking.date}" pattern="yyyy-MM-dd"/></td>
                    <td>${booking.phone}</td>
                    <td>${booking.pickupLocation}</td>
                    <td>${booking.dropoffLocation}</td>
                    <td>${booking.pickupTime}</td>
                    <td>${booking.vehicleType}</td>
                    <td>${booking.foodProviderName}</td>
                    <td>${booking.foodItems}</td>
                    <td>${booking.totalCost}</td>
                    <td>
                        <form action="booking2" method="post">
                            <input type="hidden" name="action" value="cancel"/>
                            <input type="hidden" name="booking_id" value="${booking.booking_id}"/>
                            <input type="submit" value="Cancel Booking"/>
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>
    </c:if>
    
    <c:if test="${empty booking}">
        <p>No booking found with the provided ID.</p>
    </c:if>
</body>
</html>