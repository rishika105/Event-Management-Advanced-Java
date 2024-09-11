<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Forgot Password</title>
    <!-- Link to Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Product+Sans&display=swap" rel="stylesheet">
    <!-- External CSS -->
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Product Sans', sans-serif;
            background-color: #f8f8fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative;
        }
        .logo {
            position: absolute;
            top: 20px;
            left: 30px;
            font-size: 25px;
            font-weight: bold;
            color: #000;
        }
        
          .logo a {
            text-decoration: none;
            color: inherit;
        }
        .wave {
            color: #7848f4;
        }
        .reset-password-container {
            width: 400px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .reset-password-container h1 {
            font-size: 30px;
            color: #000000;
            margin-bottom: 40px;
        }
        .reset-password-container form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        .reset-password-container label {
            font-size: 16px;
            color: #000000;
            margin-bottom: 5px;
            text-align: left;
        }
        .reset-password-container input[type="email"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            color: #687c94;
        }
        .reset-password-container input[type="submit"] {
            padding: 15px;
            border: none;
            border-radius: 5px;
            background-color: #7848f4;
            color: #ffffff;
            font-size: 16px;
            cursor: pointer;
        }
        .message {
            margin-top: 15px;
        }
        .message.success {
            color: green;
        }
        .message.error {
            color: red;
        }
    </style>
</head>
<body>
    <!-- Logo -->
   <div class="logo">
    <a href="index.jsp">Event <span class="wave">Wave</span></a>
</div>

    <!-- Reset Password Box -->
    <div class="reset-password-container">
        <h1>Reset Password</h1>
        <form action="forgot-password3" method="post">
            <label for="email">Enter your email:</label>
            <input type="email" id="email" name="email" required />
            <input type="submit" value="Submit" />
        </form>

        <!-- Use JSP Scriptlets to display success and error messages -->
        <%
            String message = (String) request.getAttribute("message");
            String error = (String) request.getAttribute("error");

            if (message != null) {
        %>
            <p class="message success"><%= message %></p>
        <%
            } else if (error != null) {
        %>
            <p class="message error"><%= error %></p>
        <%
            }
        %>
    </div>
</body>
</html>
