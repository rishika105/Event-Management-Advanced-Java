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
            position: relative;
            background-image: url('<%= event.getImagePath() %>');
            background-size: cover;
            background-position: center;
            height: 50vh; /* Set the height to 50% of the viewport height */
            width: 100%;
        }

        .book-now-button {
            position: absolute;
            top: 20px;
            right: 20px;
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
            margin-top: -50px; /* Adjusted margin to overlap with the hero section */
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
        <a href="eventDetails.jsp?eventId=<%= event.getId() %>" class="book-now-button">Book Now</a>
    </div>

    <div class="container">
        <h1><%= event.getTitle() %></h1>
        <div class="event-info">
            <p><strong>Location:</strong> <%= event.getLocation() %></p>
            <p><strong>Date:</strong> <%= event.getDate() %></p>
            <p><strong>Time:</strong> <%= event.getTime() %></p>
            <p><strong>Description:</strong> <%= event.getDescription() %></p>
        </div>
        <a href="eventFront.jsp" class="back-link">Back to Events</a>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Event Wave. All rights reserved.</p>
    </div>

</body>
</html>
