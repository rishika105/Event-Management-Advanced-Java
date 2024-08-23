<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Hive - 404 Page Not Found</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }
        .container {
            text-align: center;
            position: relative;
            width: 100%;
        }
        /* Adjusted logo positioning */
        .logo {
            position: absolute;
            top: 20px;
            left: 20px;
        }
        .logo img {
            width: 120px;
        }
        .error-code {
            font-size: 6rem; /* Made smaller */
            margin: 0;
            color: #6a1b9a; /* Purple color */
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .message {
            font-size: 1.2rem;
            margin: 10px 0;
        }
        .btn {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #6a1b9a;
            color: white;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #501a7b; /* Darker purple */
        }
        .social-icons {
            margin-top: 30px;
        }
        .social-icons img {
            width: 2rem;
            margin: 0 10px;
            opacity: 0.7;
        }
        .footer {
            margin-top: 40px;
            padding: 20px;
            background-color: #2c2c54; /* Dark blue color */
            color: white;
            width: 100%;
            text-align: center;
        }
        .footer a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
        }
        .footer .subscribe {
            margin-top: 10px;
        }
        .footer input[type="email"] {
            padding: 10px;
            border-radius: 5px;
            border: none;
            margin-right: 10px;
        }
        .footer input[type="submit"] {
            padding: 10px 20px;
            background-color: #6a1b9a;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <!-- Added logo at the top left corner -->
    <div class="logo">
        <a href="homepage.jsp">
            <img src="https://via.placeholder.com/150x50.png?text=Event+Wave" alt="Event Wave">
        </a>
    </div>

    <div class="container">
        <div class="error-code">
            <span>404</span>
        </div>
        <div class="message">
            <p>Oops! We can't seem to find the page you are looking for.</p>
        </div>
        <a href="homepage.jsp" class="btn">Back to Homepage</a>
        <div class="social-icons">
            <img src="icon-instagram.png" alt="Instagram">
            <img src="icon-facebook.png" alt="Facebook">
            <img src="icon-linkedin.png" alt="LinkedIn">
            <img src="icon-twitter.png" alt="Twitter">
            <img src="icon-youtube.png" alt="YouTube">
        </div>
    </div>

    <div class="footer">
        <div class="subscribe">
            <input type="email" placeholder="Enter your email">
            <input type="submit" value="Subscribe">
        </div>
        <p>&copy; 2023 Upload by rich technologies</p>
        <p>
            <a href="#">English</a> | 
            <a href="#">French</a> | 
            <a href="#">Hindi</a>
        </p>
    </div>
</body>
</html>
