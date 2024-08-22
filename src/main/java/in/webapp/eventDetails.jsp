<%@ page import="in.sp.model.Event" %>
<%@ page import="in.sp.dao.EventDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<%
    String eventId = request.getParameter("eventId");
    EventDAO eventDAO = new EventDAO();
    Event event = eventDAO.getEventById(Integer.parseInt(eventId));
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= event.getTitle() %> - Event Details</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .event-hero {
            text-align: center;
            margin-bottom: 20px;
        }

        .event-hero img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .book-now-button {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #fff;
            background-color: #1e90ff;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .book-now-button:hover {
            background-color: #0056a3;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
            z-index: 1;
            position: relative;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .event-info p {
            font-size: 18px;
            margin-bottom: 10px;
            color: #333;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #fff;
            background-color: #6c757d;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .back-link:hover {
            background-color: #5a6268;
        }

        .footer {
            background-color: #2d2d2d;
            color: white;
            padding: 20px 0;
            text-align: center;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<div class="event-hero">
    <img src="<%= request.getContextPath() + "/" + event.getImagePath() %>" alt="Event Image">
</div>

<div class="container">
    <h1><%= event.getTitle() %></h1>
    <div class="event-info">
        <p>
						<strong>Location:</strong>
						<%=event.getLocation()%></p>
					<p>
						<strong>Time:</strong>
						<%=event.getTime()%></p>
					<p>
						<strong>Description:</strong>
						<%=event.getDescription()%></p>
					<p>
						<strong>Price:</strong> ₹<%=event.getPrice()%></p>    </div>
    <a href="eventTypes.jsp" class="back-link">Back to Events</a>
    <a href="eventDetails.jsp?eventId=<%= event.getId() %>" class="book-now-button">Book Now</a>
</div>

<!-- Footer -->
<div class="footer">
    <p>&copy; 2024 Event Hive. All rights reserved.</p>
</div>

</body>
</html>
