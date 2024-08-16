<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="in.sp.dao.EventDAO" %>
<%@ page import="in.sp.model.Event" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Events</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            color: #333;
            margin: 0;
            display: flex;
        }
        .sidebar {
            width: 250px;
            background-color: #3a3a3a;
            color: #fff;
            padding: 20px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
        }
        .sidebar h2 {
            margin-bottom: 30px;
            color: #fff;
        }
        .sidebar a {
            display: block;
            color: #bbb;
            padding: 10px 0;
            text-decoration: none;
            transition: 0.3s;
        }
        .sidebar a:hover {
            color: #fff;
            background-color: #575757;
            border-radius: 5px;
            padding-left: 10px;
        }
        .container {
            margin-left: 270px;
            padding: 20px;
            width: calc(100% - 270px);
            box-sizing: border-box;
        }
        .hero-section {
            background-color: #1e90ff;
            color: #fff;
            padding: 40px;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 20px;
        }
        .hero-section h1 {
            margin: 0;
        }
        .event-card {
            background-color: #f0f8ff;
            padding: 20px;
            margin: 15px 0;
            border-radius: 10px;
            display: flex;
            align-items: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .event-card img {
            width: 150px;
            height: auto;
            border-radius: 10px;
            margin-right: 20px;
        }
        .event-card h3 {
            margin: 0;
            color: #1e90ff;
        }
        .event-card p {
            margin: 5px 0;
            color: #555;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Event Wave</h2>
        <a href="#">Dashboard</a>
        <a href="#">Events</a>
        <a href="#">Messages</a>
        <a href="#">Profile</a>
    </div>

    <!-- Main Container -->
    <div class="container">
        <!-- Hero Section -->
        <div class="hero-section">
            <h1>Discover and experience extraordinary Events</h1>
            <p>Enter the world of events. Discover more!</p>
            <button>Discover now</button>
        </div>

        <!-- Available Events Section -->
        <h2>Available Events</h2>
        <%
            Connection connection = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                connection = EventDAO.getConnection();
                stmt = connection.createStatement();
                rs = stmt.executeQuery("SELECT * FROM events");

                List<Event> events = new ArrayList<>();
                while (rs.next()) {
                    Event event = new Event();
                    event.setEventTitle(rs.getString("title"));
                    event.setEventVenue(rs.getString("venue"));
                    event.setEventImage(rs.getString("image"));
                    event.setEventDescription(rs.getString("description"));
                    events.add(event);
                }

                for (Event event : events) {
        %>
            <div class="event-card">
             <img src="<%= request.getContextPath() %>/assets/<%= event.getEventImage() %>" alt="Event Image">

                <div>
                    <h3><%= event.getEventTitle() %></h3>
                    <p>Venue: <%= event.getEventVenue() %></p>
                    <p>Description: <%= event.getEventDescription() %></p>
                </div>
            </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (connection != null) connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>
</body>
</html>
