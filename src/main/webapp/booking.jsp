<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Book Now</title>
    <style>
    body{
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            color: #333;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
    }
    .form{
            width: 100%;
            max-width: 900px;
            margin: 50px auto;
            background-color: #fff;
            padding: 40px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
        }
    
    }
    h2{
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
        input, textarea {
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
    
    <form action="booking" method="post">
        
     
        <label for="event_id">Event ID:</label>
        <input type="number" id="event_id" name="event_id" required><br><br>
        
        <label for="number_of_tickets">Number of Tickets:</label>
        <input type="number" id="number_of_tickets" name="number_of_tickets" required><br>

        <label for="total_price">Total Price:</label>
        <input type="text" id="total_price" name="total_price" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>
        
        <label for="date">Date:</label>
         <input type="date" id="date" name="date" required><br>
        
        <button type="submit">Book Now</button>
    </form>
    </div>
</body>
</html>
