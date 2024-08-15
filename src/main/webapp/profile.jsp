<%@page import="in.sp.model.UserModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
</head>
<body>
<div class="container">
    <%
        HttpSession usersession = request.getSession(false);
        UserModel user = (UserModel) usersession.getAttribute("session_user");
        String name = "";
        if (user != null) {
            name = user.getName();
        }
    %>
    <h3>Welcome, <%= name %>!</h3>
    <a href="logout3">Logout</a>
</div>
</body>
</html>
