<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Book Now</title>
</head>
<body>
    <h2>Book Now</h2>
    <form action="booking" method="post">
        

        <label for="event_id">Event ID:</label>
        <input type="number" id="event_id" name="event_id" required><br>

        <label for="number_of_tickets">Number of Tickets:</label>
        <input type="number" id="number_of_tickets" name="number_of_tickets" required><br>

        <label for="total_price">Total Price:</label>
        <input type="text" id="total_price" name="total_price" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>
        
        <button type="submit">Book Now</button>
    </form>
</body>
</html>
