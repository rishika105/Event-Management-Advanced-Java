<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 100%;
            max-width: 720px;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
            position: relative;
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
        h2 {
            text-align: center;
            color: #333;
            font-size: 1.8em;
            margin-bottom: 20px;
        }
        .details {
            margin-bottom: 20px;
        }
        .details p {
            margin: 5px 0;
            font-size: 1em;
            color: #555;
        }
        .button-container {
            text-align: center;
        }
        button {
            padding: 15px 25px;
            background-color: #6a5acd;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 1.2em;
            cursor: pointer;
            margin-top: 20px;
            text-align: center;
        }
        button:hover {
            background-color: #483d8b;
        }
        .hidden-fields {
            display: none;
        }
    </style>
</head>
<body>

<div class="logo">
    <a href="index.jsp">Event <span class="wave">Wave</span></a>
</div>


<div class="container">
    <h2>Payment Details</h2>
    <% 
        int bookingId = Integer.parseInt(request.getParameter("booking_id"));
        double eventPrice = Double.parseDouble(request.getParameter("event_price"));
        double foodCost = Double.parseDouble(request.getParameter("food_cost"));
        double transportPrice = Double.parseDouble(request.getParameter("transport_price"));
        double totalPrice = eventPrice + foodCost + transportPrice;
    %>
    <div class="details">
        <p>Total Payment Amount: ₹<%= totalPrice %></p>
        <p>Event Price: ₹<%= eventPrice %></p>
        <p>Food Cost: ₹<%= foodCost %></p>
        <p>Transportation Price: ₹<%= transportPrice %></p>
    </div>

    <form id="paymentForm" action="PaymentServlet" method="post">
        <input type="hidden" name="booking_id" value="<%= bookingId %>" class="hidden-fields"/>
        <input type="hidden" name="event_price" value="<%= eventPrice %>" class="hidden-fields"/>
        <input type="hidden" name="food_cost" value="<%= foodCost %>" class="hidden-fields"/>
        <input type="hidden" name="transport_price" value="<%= transportPrice %>" class="hidden-fields"/>
        <input type="hidden" name="razorpay_payment_id" id="razorpay_payment_id" class="hidden-fields"/>
        <input type="hidden" name="razorpay_order_id" id="razorpay_order_id" class="hidden-fields"/>
        <input type="hidden" name="razorpay_signature" id="razorpay_signature" class="hidden-fields"/>
        <div class="button-container">
            <button id="rzp-button" type="button">Pay Now</button>
        </div>
    </form>

    <script>
        var options = {
            "key": "<%=System.getenv("RAZORPAY_KEY") %>", // Enter the Key ID generated from the Dashboard
            "amount": <%= totalPrice * 100 %>, // Amount in paise
            "currency": "INR",
            "name": "Your Company Name",
            "description": "Payment for booking ID: <%= bookingId %>",
            "handler": function (response) {
                // Populate hidden form fields with Razorpay response data
                document.getElementById('razorpay_payment_id').value = response.razorpay_payment_id;
                document.getElementById('razorpay_order_id').value = response.razorpay_order_id;
                document.getElementById('razorpay_signature').value = response.razorpay_signature;
                
                // Submit the form
                document.getElementById('paymentForm').submit();
            },
            "prefill": {
                "name": "John Doe",
                "email": "john.doe@example.com",
                "contact": "9999999999"
            },
            "theme": {
                "color": "#3399cc"
            }
        };

        var rzp1 = new Razorpay(options);

        document.getElementById('rzp-button').onclick = function (e) {
            rzp1.open();
            e.preventDefault();
        }
    </script>
</div>
</body>
</html>
