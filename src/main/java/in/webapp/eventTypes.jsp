<%@ page import="in.sp.model.Event" %>
<%@ page import="in.sp.dao.EventDAO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Available Events</title>
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
    background-color: #ffffff; /* Set sidebar background to white */
    color: #4E4AE8; /* Set the text color to match the image */
    padding: 20px;
    height: 100vh;
    position: fixed;
    top: 0;
    left: 0;
    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
}

.sidebar h2 {
    margin-bottom: 30px;
    color: #4E4AE8; /* Use the purple shade from the image */
}

.sidebar a {
    display: block;
    color: #4E4AE8; /* Set the link color to the same purple */
    padding: 10px 0;
    text-decoration: none;
    transition: 0.3s;
}

.sidebar a:hover {
    color: #fff;
    background-color: #4E4AE8; /* Purple hover background */
    border-radius: 5px;
    padding-left: 10px;
}
.container {
	margin-left: 270px;
	padding: 20px;
	width: calc(100% - 270px);
	box-sizing: border-box;
}

/* Hero Section */
.hero-section {
    background-image: url('images/hero-section.png'); /* Replace with the correct path to your image */
    background-size: cover; /* Ensures the background image covers the entire section */
    background-position: center; /* Centers the background image */
    background-repeat: no-repeat; /* Prevents the image from repeating */
    color: #fff;
    padding: 40px;
    border-radius: 10px;
    text-align: center;
    margin-bottom: 20px;
    position: relative;
    z-index: 1;
    overflow: hidden;
    height: 400px; /* Adjust this value as needed */
}

.hero-section::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* Add a dark overlay */
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
</style>
</head>
<body>
    <div class="sidebar">
        <h2>Event Wave</h2>
        <a href="#">Dashboard</a>
        <a href="#">Events</a>
        <a href="#">Messages</a>
        <a href="#">Profile</a>
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
