<%@ page import="in.sp.model.Event" %>
<%@ page import="in.sp.dao.EventDAO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Available Events</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="styles.css">
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f4f4f8;
        color: #333;
        margin: 0;
        display: flex;
    }

    /* Sidebar */
    .sidebar {
        width: 250px;
        background-color: #ffffff;
        color: #4E4AE8;
        padding: 20px;
        height: 100vh;
        position: fixed;
        top: 0;
        left: 0;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    }

    .sidebar h2 {
        margin-bottom: 30px;
        color: #4E4AE8; /* Changed to the desired color */
    }

    .sidebar a {
        display: block;
        color: #000; /* Changed to black text color */
        padding: 10px 0;
        text-decoration: none;
        transition: 0.3s;
    }

    .sidebar a:hover {
        color: #fff;
        background-color: #4E4AE8;
        border-radius: 5px;
        padding-left: 10px;
    }

    /* Main Container */
    .container {
        margin-left: 300px; /* Starts after the sidebar */
        padding: 20px;
        flex-grow: 1; /* Takes the remaining width */
        box-sizing: border-box;
    }

    /* Hero Section */
    .hero-section {
        background-image: url('images/hero-section.png'); /* Replace with the correct path to your image */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        color: #fff;
        padding: 40px;
        border-radius: 10px;
        text-align: center;
        margin-bottom: 20px;
        position: relative;
        z-index: 1;
        overflow: hidden;
        height: 400px;
    }

    .hero-section::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* Dark overlay */
        z-index: -1;
    }

    .hero-section h1 {
        margin: 0;
        font-size: 32px;
        font-weight: bold;
    }

    .hero-section p {
        margin: 10px 0 20px;
        font-size: 18px;
    }

    .hero-section button {
        padding: 10px 20px;
        background-color: #fff;
        color: #4E4AE8;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: 0.3s;
    }

    .hero-section button:hover {
        background-color: #eaeaea;
    }

    h1 {
        font-size: 28px;
        margin-bottom: 20px;
        color: #4E4AE8;
    }

    /* Events Grid */
    .events-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
    }

    .event-card {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        transition: 0.3s;
    }

    .event-card:hover {
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    }

    .event-card img {
        width: 100%;
        height: 150px;
        border-radius: 10px;
        object-fit: cover;
        margin-bottom: 15px;
    }

    .event-card h2 {
        margin: 0 0 10px;
        font-size: 20px;
        color: #333;
    }

    .event-card p {
        margin: 5px 0;
        color: #666;
        font-size: 16px;
    }

    .event-card a {
        display: inline-block;
        margin-top: 10px;
        color: #fff;
        background-color: #4E4AE8;
        padding: 10px 15px;
        border-radius: 5px;
        text-decoration: none;
        font-size: 16px;
        transition: 0.3s;
    }

    .event-card a:hover {
        background-color: #3a3a3a;
    }

    .edit-btn, .delete-btn {
        display: inline-block;
        padding: 10px 15px;
        margin: 5px;
        border-radius: 5px;
        text-decoration: none;
        cursor: pointer;
        font-size: 16px;
        transition: 0.3s;
    }

    .edit-btn {
        background-color: #4E4AE8;
        color: white;
    }

    .delete-btn {
        background-color: #ff4c4c;
        color: white;
    }

    .edit-btn:hover {
        background-color: #3a3a3a;
    }

    .delete-btn:hover {
        background-color: #d32f2f;
    }
</style>
</head>
<body>
    <div class="sidebar">
        <h2>Event Wave</h2>
        <a href="#" class="active"><i class="fas fa-user"></i> Profile</a>
        <a href="#"><i class="fas fa-calendar-alt"></i> Create Event</a>
        <a href="#"><i class="fas fa-envelope"></i> Events</a>
        <a href="#"><i class="fas fa-book"></i> All Bookings</a>
        <a href="#"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <div class="container">
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
                    <p><strong>Location:</strong> <%= event.getLocation() %></p>
                    <p><strong>Time:</strong> <%= event.getTime() %></p>
                    <p><strong>Description:</strong> <%= event.getDescription() %></p>
                    <p><strong>Price:</strong> ₹<%= event.getPrice() %></p>
                    <a href="venueDetails.jsp?eventId=<%= event.getEventId() %>" class="book-now-link">Book Now</a>
                    <!-- Edit Button -->
                    <a href="createVenue.jsp?eventId=<%= event.getEventId() %>" class="edit-btn">Edit</a>
                    <!-- Delete Button with JavaScript Confirmation -->
                    <button onclick="confirmDelete('<%= event.getEventId() %>')" class="delete-btn">Delete</button>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <script>
    function confirmDelete(eventId) {
        const confirmation = confirm("Are you sure you want to delete this event?");
        if (confirmation) {
            window.location.href = 'insertEvent?action=delete&eventId=' + eventId;
        }
    }
</script>

</body>
</html>
