<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Booking Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 80%;
            max-width: 600px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .logo {
            width: 150px;
            margin-bottom: 20px;
        }
        h2 {
            color: #7848f4;
        }
        p {
            margin: 10px 0;
            font-size: 18px;
        }
        .button-container {
            margin-top: 20px;
        }
        .button-container a {
            display: inline-block;
            padding: 10px 20px;
            color: #fff;
            background-color: #7848f4;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
        }
        .button-container a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Your booking has been successfully completed!</h2>
        <p>Thank You for Booking with Event Wave!</p>

        <p>We appreciate your choice of Event Wave for your event needs.</p>
        <div class="button-container">
            <a href="bookingHistory.jsp">View Booking History</a>
        </div>
    </div>
</body>
</html>
