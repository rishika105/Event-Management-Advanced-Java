<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Event Wave - Feedback</title>
    <link href="https://fonts.googleapis.com/css2?family=Product+Sans&display=swap" rel="stylesheet">
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
            position: relative;
            justify-content: center;
            align-items: center;
        }

        .logo {
            position: absolute;
            top: 20px;
            left: 30px;
            font-size: 25px;
            font-weight: bold;
            color: #000;
            z-index: 10;
        }

        .logo .wave {
            color: #7848f4;
        }
        
          .logo a {
            text-decoration: none;
            color: inherit;
        }

        .form-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 500px;
        }

        .form-container h1 {
            text-align: center;
            font-size: 36px;
            margin-bottom: 40px;
            color: #000000;
        }

        .form-container form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .form-container label {
            font-size: 16px;
            color: #000000;
        }

        .form-container input[type="text"], 
        .form-container input[type="email"],
        .form-container textarea {
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #f0f0f0;
            font-size: 14px;
            color: #000;
            width: 100%;
        }

        .form-container input[type="submit"] {
            padding: 15px;
            border: none;
            border-radius: 5px;
            background-color: #7848f4;
            color: #ffffff;
            font-size: 16px;
            cursor: pointer;
        }

        .success-message {
            color: green;
            text-align: center;
            margin-top: 20px;
            font-size: 18px;
        }
        
        .error-message {
            color: red;
            text-align: center;
            margin-top: 20px;
            font-size: 18px;
        }
        
    </style>
</head>
<body>
    <div class="container">
      <div class="logo">
    <a href="index.jsp">Event <span class="wave">Wave</span></a>
</div>


        <div class="form-container">
            <!-- Display success message -->
            <%
                String successMessage = (String) request.getAttribute("message");
                if (successMessage != null) {
            %>
                <div class="success-message"><%= successMessage %></div>
            <%
                }
            %>
            <!-- Display error message -->
            <%
                String errorMessage = (String) request.getAttribute("error");
                if (errorMessage != null) {
            %>
                <div class="error-message"><%= errorMessage %></div>
            <%
                }
            %>
            
            <h1>Feedback Form</h1>

            <form action="FeedbackServlet" method="post">
                <label for="name">Name:</label>
                <input type="text" name="name" id="name" placeholder="Enter your name" required>

                <label for="email">Email:</label>
                <input type="email" name="email" id="email" placeholder="Enter your email" required>

                <label for="feedback">Feedback:</label>
                <textarea name="feedback" id="feedback" placeholder="Enter your feedback" rows="5" required></textarea>

                <input type="submit" value="Submit">
            </form>
        </div>
    </div>
</body>
</html>
