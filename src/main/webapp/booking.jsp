<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
        .form {
            width: 100%;
            max-width: 900px;
            margin: 50px auto;
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
        input, select {
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
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #5a4ecf;
        }
    </style>
</head>

<body>
<div class="form">
    <h2>Book Now</h2>
    <form action="booking2" method="post">
        <label for="event_type">Event Type:</label>
        <select id="event_type" name="event_type" required>
            <option value="<%= request.getParameter("event_type") != null ? request.getParameter("event_type") : "" %>">
                <%= request.getParameter("event_type") != null ? request.getParameter("event_type") : "Select Event Type" %>
            </option>
            <!-- Add other event type options here -->
        </select>

        <label for="date">Event Date:</label>
        <input type="date" id="date" name="date" required>

        <label for="number_of_guests">Number of Guests:</label>
        <input type="number" id="number_of_guests" name="number_of_guests" required>

        <label for="event_price">Event Price:</label>
        <input type="text" id="event_price" name="event_price" value="<%= request.getParameter("event_price") != null ? request.getParameter("event_price") : "" %>" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" required>

        <button type="submit" name="action" value="book">Book Now</button>
    </form>
</div>
</body>
</html>
