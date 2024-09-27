<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Payment Refund</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .refund-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            font-size: 16px;
            display: block;
            margin-bottom: 10px;
            color: #555;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .submit-btn {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #45a049;
        }

        .message {
            margin-top: 20px;
            font-size: 18px;
            color: green;
        }
    </style>
</head>
<body>

<div class="refund-container">
    <h1>Request Refund</h1>

    <form id="refundForm">
        <label for="paymentId">Payment Reference ID:</label>
        <input type="text" id="paymentId" name="paymentId" value="<%= request.getParameter("razorpayPaymentId") != null ? request.getParameter("razorpayPaymentId") : "" %>" required>

        <label for="refundAmount">Refund Amount:</label>
        <input type="number" id="refundAmount" name="refundAmount" value="<%= request.getParameter("paymentAmount") != null ? request.getParameter("paymentAmount") : "" %>" required>

        <button type="submit" class="submit-btn">Submit Refund Request</button>
    </form>

    <div id="refundMessage" class="message" style="display:none;">
        Your refund request has been submitted successfully. You can expect the refund within 24 hours.
    </div>
</div>

<script>
    document.getElementById('refundForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent the default form submission

        // Show the refund message
        document.getElementById('refundMessage').style.display = 'block';

        // You can also include code to handle actual form submission here
        // For example, using AJAX to send data to the server
    });
</script>

</body>
</html>
