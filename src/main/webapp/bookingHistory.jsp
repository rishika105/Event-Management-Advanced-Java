<%@ page import="java.util.List" %>
<%@ page import="in.sp.model.Booking" %>
<html>
<head>
    <title>Booking History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            color: #333;
            margin: 0;
            padding: 20px;
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
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .cancel-button {
            background-color: #ff4c4c;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <h2>Your Booking History</h2>

    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
            out.println("<p>" + message + "</p>");
        }

        List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");

        if (bookings != null && !bookings.isEmpty()) {
    %>
        <table>
            <tr>
                <th>Booking ID</th>
                <th>Event ID</th>
                <th>Number of Tickets</th>
                <th>Total Price</th>
                <th>Date</th>
                <th>Action</th>
            </tr>
            <%
                for (Booking booking : bookings) {
            %>
                <tr>
                    <td><%= booking.getBooking_id() %></td>
                    <td><%= booking.getEvent_id() %></td>
                    <td><%= booking.getNumber_of_tickets() %></td>
                    <td><%= booking.getTotal_price() %></td>
                    <td><%= booking.getDate() %></td>
                    <td>
                        <form action="bookingHistory" method="post">
                            <input type="hidden" name="booking_id" value="<%= booking.getBooking_id() %>">
                            <input type="submit" class="cancel-button" value="Cancel">
                        </form>
                   </td>
                   </tr>
                     <%
                         }
                      } else {
                       %>
                    <p>No bookings found.</p>
                      <%
                         }
                      %>
                  </table>

                  </body>
                  </html>

