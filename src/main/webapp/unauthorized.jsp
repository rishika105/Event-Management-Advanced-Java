<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unauthorized Access</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    
    .container {
        background-color: #fff;
        border-radius: 8px;
        padding: 20px 30px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    h2 {
        color: #d9534f;
        margin-bottom: 20px;
        font-size: 24px;
    }

    p {
        font-size: 18px;
        color: #333;
        margin-bottom: 30px;
    }

    a {
        background-color: #5bc0de;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    a:hover {
        background-color: #31b0d5;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Unauthorized Access</h2>
        <p>You do not have permission to access this page.</p>
        <a href="login.jsp">Login as Admin</a>
    </div>
</body>
</html>
