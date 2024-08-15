<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Event Wave - Login</title>
    <!-- Link to Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Product+Sans&display=swap" rel="stylesheet">
    <!-- External CSS -->
    <style>
        /* Your existing CSS */
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
            position: relative;
        }

        .logo {
            position: absolute;
            top: 20px;
            right: 30px;
            font-size: 25px;
            font-weight: bold;
            color: #000;
            z-index: 10;
        }

        .logo .wave {
            color: #7848f4;
        }

        .left-panel {
            width: 45%;
            background: url('${pageContext.request.contextPath}/assets/unsplash_evgs_ab_l_51_rk.jpeg') no-repeat center center;
            background-size: cover;
            position: relative;
            background-position: center right;
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

        .right-panel {
            width: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            background-color: #f8f8fa;
        }

        .login-container {
            width: 60%;
            z-index: 1;
        }

        .login-container h1 {
            text-align: center;
            font-size: 36px;
            margin-bottom: 40px;
            color: #000000;
        }

        .login-container form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .login-container label {
            font-size: 16px;
            color: #000000;
            margin-bottom: 5px;
        }

        .login-container input[type="text"], .login-container input[type="password"] {
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #ffffff;
            font-size: 14px;
            color: #687c94;
        }

        .login-container a {
            text-decoration: none;
            color: #7848f4;
            font-size: 14px;
            align-self: flex-end;
            margin-top: -10px;
            margin-bottom: 20px;
        }

        .login-container input[type="submit"] {
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

        .divider::before, .divider::after {
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

        @media (max-width: 768px) {
            .left-panel {
                display: none;
            }
            .right-panel {
                width: 100%;
            }
            .login-container {
                width: 80%;
            }
        }

        .success-message {
            color: green;
            text-align: center;
            margin-bottom: 20px;
            font-size: 18px;
        }

        .error {
            color: red;
            text-align: center;
            margin-bottom: 20px;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Logo -->
        <div class="logo">
            Event <span class="wave">Wave</span>
        </div>
        <!-- Left Panel -->
        <div class="left-panel">
            <div class="overlay">
                <h1>Welcome Back!</h1>
                <p>To keep connected with us, please login with your personal info</p>
                <a href="register.jsp" class="signup-button">Sign Up</a>
            </div>
        </div>
        <!-- Right Panel -->
        <div class="right-panel">
            <div class="login-container">
                <!-- JSTL for success message -->
                <c:if test="${not empty param.successMessage}">
                    <div class="success-message">${param.successMessage}</div>
                </c:if>

                <!-- JSTL for error message -->
                <c:if test="${not empty param.errorMessage}">
                    <p class="error">${param.errorMessage}</p>
                </c:if>

                <h1>Login</h1>

                <form action="LoginForm3" method="post">
                    <div>
                        <label for="email1">Email:</label> 
                        <input type="text" name="email1" id="email1" placeholder="Enter your email" required />
                    </div>
                    <div>
                        <label for="pass1">Password:</label> 
                        <input type="password" name="pass1" id="pass1" placeholder="Enter your password" required />
                    </div>
                    <a href="forgot_password.jsp">Forgot Password?</a> 
                    <input type="submit" value="Login" />
                </form>
            </div>
        </div>
    </div>
</body>
</html>
