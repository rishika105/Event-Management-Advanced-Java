<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Event Wave - Register</title>
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
            height: 100vh;
            overflow: hidden;
        }
        .container {
            width: 100%;
            display: flex;
            position: relative; /* Added to make sure the logo positioning works correctly */
        }
        .logo {
            position: absolute;
            top: 20px;
            left: 30px;
            font-size: 25px;
            font-weight: bold;
            color: #000;
            z-index: 10; /* Ensures the logo is on top */
        }
        .wave {
            color: #7848f4;
        }
        .left-panel {
            width: 55%; /* Left panel wider */
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f8f8fa; /* Match the background color */
            position: relative;
        }
        .register-container {
            width: 80%;
            z-index: 1; /* Ensures the registration form is on top */
        }
        .register-container h1 {
            text-align: center;
            font-size: 36px;
            margin-bottom: 40px;
            color: #000000;
        }
        .register-container form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .register-container label {
            font-size: 16px;
            color: #000000;
            margin-bottom: 5px;
        }
        .register-container input[type="text"],
        .register-container input[type="password"],
        .register-container select {
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #ffffff;
            font-size: 14px;
            color: #687c94;
        }
        .register-container a {
            text-decoration: none;
            color: #7848f4;
            font-size: 14px;
            align-self: flex-end;
            margin-top: -10px;
            margin-bottom: 20px;
        }
        .register-container input[type="submit"] {
            padding: 15px;
            border: none;
            border-radius: 5px;
            background-color: #7848f4;
            color: #ffffff;
            font-size: 16px;
            cursor: pointer;
        }
        .divider {
            text-align: center;
            margin: 20px 0;
            position: relative;
        }
        .divider::before,
        .divider::after {
            content: '';
            position: absolute;
            width: 45%;
            height: 1px;
            background-color: #7e7e7e;
            top: 50%;
        }
        .divider::before {
            left: 0;
        }
        .divider::after {
            right: 0;
        }
        .divider span {
            color: #7e7e7e;
            font-size: 16px;
            background-color: #f8f8fa;
            padding: 0 10px;
        }
        .google-button {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #ffffff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            gap: 10px;
        }
        .google-button img {
            width: 20px;
            height: 20px;
        }
        .google-button span {
            font-size: 16px;
            color: #131315;
        }
        .right-panel {
            width: 45%; /* Right panel narrower */
            background: url('${pageContext.request.contextPath}/assets/unsplash_ucb_mz_0_sw_28.jpeg') no-repeat center center;
            background-size: cover;
            position: relative;
            background-position: center center; /* Adjust to cover the image properly */
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(19, 19, 21, 0.3);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: #ffffff;
            text-align: center;
            padding: 0 20px;
        }
        .overlay h1 {
            font-size: 40px;
            margin-bottom: 20px;
        }
        .overlay p {
            font-size: 16px;
            margin-bottom: 40px;
        }
        .overlay .signup-button {
            background-color: rgba(255, 255, 255, 0.4);
            padding: 15px 40px;
            border: none;
            border-radius: 5px;
            color: #ffffff;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
        }
        @media (max-width: 768px) {
            .left-panel {
                width: 100%;
                display: block; /* Ensure the form displays properly on small screens */
            }
            .right-panel {
                width: 100%;
                height: auto; /* Adjust height for smaller screens */
            }
            .register-container {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Logo -->
        <div class="logo">
            Event <span class="wave">Wave</span>
        </div>
        <!-- Left Panel (Register Form) -->
        <div class="left-panel">
            <div class="register-container">
                <h1>Register</h1>
                
                <%-- Display error message if present --%>
                <c:if test="${not empty errorMessage}">
                    <div class="error-message" style="color: red; text-align: center; margin-bottom: 20px;">
                        ${errorMessage}
                    </div>
                </c:if>
                
                <form action="regForm3" method="post">
                    <!-- Your form elements -->
                      <div>
                        <label for="name1">Name:</label>
                        <input type="text" id="name1" name="name1" placeholder="Enter your name" required />
                    </div>
                    <div>
                        <label for="email1">Email:</label>
                        <input type="text" id="email1" name="email1" placeholder="Enter your email" required />
                    </div>
                    <div>
                        <label for="pass1">Password:</label>
                        <input type="password" id="pass1" name="pass1" placeholder="Enter your password" required />
                    </div>
                    <div>
                        <label>Gender:</label>
                        <input type="radio" id="male" name="gender1" value="male" /><label for="male">Male</label>
                        <input type="radio" id="female" name="gender1" value="female" /><label for="female">Female</label>
                        <input type="radio" id="other" name="gender1" value="other" /><label for="other">Others</label>
                    </div>
                    <div>
                        <label for="city1">City:</label>
                        <select id="city1" name="city1">
                            <option>Select City</option>
                            <option>Odisha</option>
                            <option>Mumbai</option>
                            <option>Delhi</option>
                            <option>Kolkata</option>
                            <option>Pune</option>
                        </select>
                    </div>
                    <input type="submit" value="Register" />
                </form>
            </div>
        </div>
        <!-- Right Panel (Image) -->
        <div class="right-panel">
            <div class="overlay">
                <h1>Explore More!</h1>
                <p>Join us today and explore amazing events</p>
                <a href="login.jsp" class="signup-button">Sign in</a>
            </div>
        </div>
    </div>
</body>
</html>
