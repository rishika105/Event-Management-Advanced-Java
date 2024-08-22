<%@ page import="in.sp.model.Event" %>
<%@ page import="java.util.List" %>
<%@ page import="in.sp.dao.EventDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Available Events</title>
    <link rel="stylesheet" href="styles.css">
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
        .events-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }
        .event-card {
            background-color: #f0f8ff;
            padding: 20px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .event-card img {
            width: 100%;
            height: 150px;
            border-radius: 10px;
            object-fit: cover;
        }
        .event-card h3 {
            margin: 0;
            color: #1e90ff;
        }
        .event-card p {
            margin: 5px 0;
            color: #555;
        }
        .event-card a {
            display: inline-block;
            margin-top: 10px;
            color: #fff;
            background-color: #1e90ff;
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
            transition: 0.3s;
        }
        .event-card a:hover {
            background-color: #555;
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

        <h1>Available Events</h1>
        <div class="events-grid">
            <%
                EventDAO eventDAO = new EventDAO();
                List<Event> events = eventDAO.getAllEvents();

                for (Event event : events) {
            %>
                <div class="event-card">
                    <img src="<%= event.getImagePath() %>" alt="Event Image">
                    <div>
                        <h2><%= event.getTitle() %></h2>
                        <p><%= event.getLocation() %></p>
                        <p><%= event.getDate() %> at <%= event.getTime() %></p>
                        
                        <a href="eventDetails.jsp?eventId=<%= event.getId() %>" class="book-now-link">Book Now</a>
                    </div>
                </div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
