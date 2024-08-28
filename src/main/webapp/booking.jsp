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
    </style>
</head>
<body>
<div class="form">
    <h2>Book Now</h2>
    <form action="bookingg" method="post">
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
        <input type="text" id="event_price" name="event_price" required>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" required>
        
        <button type="submit" name="action" value="book">Book Now</button>
    </form>
</div>
</body>
</html>
