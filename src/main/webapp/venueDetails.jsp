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
    <title><%= event.getVenueName() %> - Event Details</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .event-hero {
            width: 100%;
            height: 50vh;
            overflow: hidden;
            position: relative;
            margin-bottom: 20px;
        }

        .event-hero img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .event-title {
            position: absolute;
            left: 20px;
            bottom: 20px;
            color: white;
            background-color: rgba(0, 0, 0, 0.6);
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 28px; 
            font-weight: bold; 
            max-width: 50%;
        }

        .back-link {
            position: absolute;
            top: 20px;
            left: 20px;
            text-decoration: none;
            color: #fff;
            background-color: #6a0dad; 
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 18px;
            transition: background-color 0.3s;
            z-index: 2;
        }

        .back-link:hover {
            background-color: #4b0082; 
        }

        .book-now-button {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #fff;
            background-color: #6a0dad; 
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .book-now-button:hover {
            background-color: #4b0082; 
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

        .event-info {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            padding: 20px;
        }

        .info-left, .info-right {
            width: 48%;
            box-sizing: border-box;
        }

        .info-left p, .info-right p {
            font-size: 18px;
            margin-bottom: 10px;
            color: #333;
        }

        .info-left p strong, .info-right p strong {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .info-left p span {
            color: #6a0dad; 
            font-weight: bold; 
        }

        .footer {
            background-color:#6a0dad;
            color: white;
            padding: 20px 0;
            text-align: center;
            margin-top: 40px;
        }
    </style>
    </style>
</head>
<body>
    <div class="container">
        <div class="event-hero">
            <a href="venueTypes.jsp" class="back-link">&lt; Back</a>
            <img src="<%= request.getContextPath() + "/" + event.getImagePath() %>" alt="Event Image">
            <div class="event-title"><%= event.getVenueName() %></div>
        </div>
        <div class="event-info">
            <div class="info-left">
                <p><strong>Description:</strong> <%= event.getDescription() %></p>
                <p><strong>Time:</strong> <span><%= event.getTime() %></span></p>
            </div>
            <div class="info-right">
                <p><strong>Location:</strong> <%= event.getLocation() %></p>
                <p><strong>Price:</strong> ₹<%= event.getPrice() %></p>
            </div>
        </div>
        <a href="booking.jsp?eventId=<%= event.getEventId()%>" class="book-now-button">Book Now</a>
    </div>
    <div class="footer">
        <p>&copy; 2024 Event Wave. All rights reserved.</p>
    </div>
</body>
</html>
