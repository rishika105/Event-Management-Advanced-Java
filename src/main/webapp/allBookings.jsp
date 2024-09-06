<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>All Bookings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            padding: 20px;
        }
        .container {
            width: 100%;
            max-width: 1000px;
            margin: auto;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #6a5acd;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .status-pending {
            color: orange;
            font-weight: bold;
        }
        .status-confirmed {
            color: green;
            font-weight: bold;
        }
        .status-completed {
            color: blue;
            font-weight: bold;
        }
        .status-cancelled {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>All Bookings</h2>
    <table>
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Venue Name</th>
                <th>Event Date</th>
                <th>Total Payment (₹)</th>
                <th>Status</th>
                <th>User Email</th>
                <th>Created At</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="booking" items="${bookings}">
                <tr>
                    <td>${booking.bookingId}</td>
                    <td>${booking.venueName}</td>
                    <td>
                        <fmt:formatDate value="${booking.eventDate}" pattern="dd MMM yyyy"/>
                    </td>
                    <td>${booking.totalPayment}</td>
                    <td>
                        <c:choose>
                            <c:when test="${booking.status == 'Pending'}">
                                <span class="status-pending">${booking.status}</span>
                            </c:when>
                            <c:when test="${booking.status == 'Confirmed'}">
                                <span class="status-confirmed">${booking.status}</span>
                            </c:when>
                            <c:when test="${booking.status == 'Completed'}">
                                <span class="status-completed">${booking.status}</span>
                            </c:when>
                            <c:otherwise>
                                <span class="status-cancelled">${booking.status}</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${booking.userEmail}</td>
                    <td>
                        <fmt:formatDate value="${booking.createdAt}" pattern="dd MMM yyyy HH:mm:ss"/>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty bookings}">
                <tr>
                    <td colspan="7">No bookings found.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</div>

</body>
</html>
