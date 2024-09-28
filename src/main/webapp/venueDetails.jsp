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
            background-color: #0A0F34;
            color: white;
            padding: 20px 20px;
            text-align: center;
        }

        .footer .logo {
            font-size: 28px;
            font-weight: bold;
            color: white;
            margin-bottom: 30px;
        }

        .footer .highlight {
            color: #6A3DF0;
        }

        .footer .newsletter {
            margin-bottom: 30px;
        }

        .footer .newsletter form {
            display: flex;
            justify-content: center;
            align-items: center;
            max-width: 500px;
            margin: 0 auto;
            flex-direction: row;
        }

        .footer .newsletter input {
            flex-grow: 1;
            padding: 10px;
            border: none;
            border-radius: 5px;
            width: 70%;
            margin: 0;
            box-sizing: border-box;
        }

        .footer .newsletter button {
            padding: 10px 20px;
            margin-left: 10px; /* Add space between input and button */
            background-color: #6A3DF0;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            white-space: nowrap;
            flex-grow: 0;
        }

        .footer .footer-lower-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #AAA;
        }

        .footer .language-links {
            display: flex;
            justify-content: left;
        }

        .footer .language-links a {
            margin: 0 10px;
            color: white;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 5px;
            text-align: left;
        }

        .footer .language-links a:first-child {
            color: #6A3DF0;
            font-weight: bold;
        }

        .footer .footer-note {
            font-size: 14px;
            color: #AAA;
            text-align: right;
        }

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
    <footer class="footer">
        <div class="logo">
            Event <span class="highlight">Wave</span>
        </div>
        
        <div class="newsletter">
            <form>
                <input type="email" placeholder="Enter your mail">
                <button type="submit">Subscribe</button>
            </form>
        </div>
        
        <div class="footer-lower-section">
            <div class="language-links">
                <a href="#">English</a>
                <a href="#">French</a>
                <a href="#">Hindi</a>
            </div>
            
            <div class="footer-note">
                <p>Non Copyrighted © 2023 Upload by rich technologies</p>
            </div>
        </div>
    </footer>
</body>
</html>