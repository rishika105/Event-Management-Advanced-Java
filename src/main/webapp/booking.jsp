<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="in.sp.model.Event" %>
<%@ page import="in.sp.dao.EventDAO" %>
<%
    // Get the eventPrice from the request parameter
    String eventPrice = request.getParameter("event_price");

    // Get the eventId from the request parameter
    String eventId = request.getParameter("eventId");
    
    // Fetch the event details using EventDAO
    EventDAO eventDAO = new EventDAO();
    Event event = null;
    if (eventId != null && !eventId.isEmpty()) {
        event = eventDAO.getEventById(Integer.parseInt(eventId));
        if (event != null) {
            // Convert the event price from double to String
            eventPrice = String.valueOf(event.getPrice());
        }
    }
%>

<html>
<head>
    <title>Book Now</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            color: #333;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .logo {
            position: absolute;
            top: 20px;
            left: 30px;
            font-size: 25px;
            font-weight: bold;
            color: #000;
        }

        .logo a {
            text-decoration: none;
            color: inherit;
        }

        .logo .wave {
            color: #7848f4;
        }

        .form {
            width: 100%;
            max-width: 600px; /* Slimmer width */
            margin: 100px auto;
            background-color: #fff;
            padding: 40px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 2em;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        label {
            font-size: 1.1em;
            color: #555;
            font-weight: bold;
        }

        input, textarea, select {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
            width: 100%;
            box-sizing: border-box;
        }

        button {
            padding: 15px;
            background-color: #6a5acd;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 1.2em;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #483d8b;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>

<body>

<div class="logo">
    <a href="index.jsp">Event <span class="wave">Wave</span></a>
</div>

<div class="form">
    <h2>Book Now</h2>
    <form action="booking2" method="post">
        <input type="hidden" name="booking_id" value="<%= request.getParameter("booking_id") %>" />
        <input type="hidden" name="event_price" value="<%= eventPrice %>" />
        <input type="hidden" name="venue_id" value="<%= request.getParameter("eventId") %>">
        
        <label for="event_type">Event Type:</label>
        <select id="event_type" name="event_type" required>
            <option value="Wedding and Reception">Wedding and Reception</option>
            <option value="Wedding">Wedding</option>
            <option value="Reception">Reception</option>
            <option value="Sangeet">Sangeet</option>
            <option value="Ring Ceremony">Ring Ceremony</option>
            <option value="Mehendi">Mehendi</option>
            <option value="Pre wedding photography">Pre wedding photography</option>
            <option value="Anniversary">Anniversary</option>
            <option value="Barat">Barat</option>
            <option value="Birthday">Birthday</option>
            <option value="Conference">Conference</option>
            <option value="Get-together">Get-together</option>
            <option value="Cocktail">Cocktail</option>
            <option value="Thread Ceremony">Thread Ceremony</option>
        </select>
        
        <label for="date">Event Date:</label>
        <input type="date" id="date" name="date" required>
        
        <label for="number_of_guests">Number of Guests:</label>
        <input type="number" id="number_of_guests" name="number_of_guests" required>
        
        <label for="event_price">Event Price:</label>
        <input type="text" id="event_price" name="event_price" value="<%= eventPrice %>" required>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" required>
        
        <button type="submit" name="action" value="book">Book Now</button>
    </form>
    
    <!-- Display error messages if any -->
    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
    <div class="error-message"><%= error %></div>
    <%
        }
    %>
</div>

</body>
</html>