<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <link href="https://fonts.googleapis.com/css2?family=Product+Sans&display=swap" rel="stylesheet">
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
        .wave {
            color: #7848f4;
        }
        .reset-password-box {
            width: 100%;
            max-width: 400px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .reset-password-box h2 {
            font-size: 30px;
            color: #000000;
            margin-bottom: 40px;
        }
        .reset-password-box label {
            font-size: 16px;
            color: #000000;
            margin-bottom: 5px;
            display: block;
            text-align: left;
        }
        .reset-password-box input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            color: #687c94;
            margin-bottom: 15px;
        }
        .reset-password-box button {
            padding: 14px;
            border: none;
            border-radius: 5px;
            background-color: #7848f4;
            color: #ffffff;
            font-size: 16px;
            cursor: pointer;
        }
        .reset-password-box p {
            margin-top: 15px;
        }
        .reset-password-box p.success {
            color: green;
        }
        .reset-password-box p.error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="logo">
        Event <span class="wave">Wave</span>
    </div>
    <div class="reset-password-box">
        <h2>Reset Your Password</h2>
        <form action="${pageContext.request.contextPath}/reset-password3" method="post">
            <input type="hidden" name="token" value="${param.token}">
            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required>
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
            <button type="submit">Reset Password</button>
        </form>
        <c:if test="${not empty requestScope.message}">
            <p class="success">${requestScope.message}</p>
        </c:if>
        <c:if test="${not empty requestScope.error}">
            <p class="error">${requestScope.error}</p>
        </c:if>
    </div>
</body>
</html>
