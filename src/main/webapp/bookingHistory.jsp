<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Booking History</title>
</head>
<body>
    <h2>Your Booking History</h2>
    
    <form action="booking2" method="post">
        <input type="hidden" name="action" value="history"/>
        <label for="email">Enter your email to view booking history:</label>
        <input type="email" name="email" id="email" required>
        <input type="submit" value="View History">
    </form>

    <table border="1">
        <thead>
            <tr>
                <th>Event Type</th>
                <th>Number of Guests</th>
                <th>Event Price</th>
                <th>Date</th>
                <th>Phone</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="booking" items="${bookings}">
                <tr>
                    <td>${booking.event_type}</td>
                    <td>${booking.number_of_guests}</td>
                    <td>${booking.event_price}</td>
                    <td>${booking.date}</td>
                    <td>${booking.phone}</td>
                    <td>
                        <form action="booking2" method="post">
                            <input type="hidden" name="action" value="cancel"/>
                            <input type="hidden" name="email" value="${booking.email}"/>
                            <input type="hidden" name="event_type" value="${booking.event_type}"/>
                            <input type="submit" value="Cancel Booking"/>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
