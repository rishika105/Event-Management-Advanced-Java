<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Page</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>
    <h1>Payment Details</h1>
    
    <p>Booking ID: ${bookingId}</p>
    
    <h3>Event Price: ₹${eventPrice}</h3>
    
    <h3>Food Items:</h3>
    <ul>
        <c:forEach items="${foodItems}" var="item">
            <li>${item.name}: ₹${item.price}</li>
        </c:forEach>
    </ul>
    
    <h3>Total Amount: ₹${totalCost}</h3>
    
    <button id="rzp-button">Pay Now</button>

    <script>
        var options = {
            "key": "${razorpayKey}",
            "amount": "${totalCost.multiply(BigDecimal.valueOf(100))}", // Amount is in paise
            "currency": "INR",
            "name": "Event Management System",
            "description": "Event Payment",
            "order_id": "${orderId}",
            "handler": function (response){
                alert("Payment successful!");
                // Handle success scenario, like redirecting to a success page
            },
            "prefill": {
                "name": "",
                "email": ""
            },
            "theme": {
                "color": "#F37254"
            }
        };
        var rzp1 = new Razorpay(options);
        document.getElementById('rzp-button').onclick = function(e){
            rzp1.open();
            e.preventDefault();
        }
    </script>
</body>
</html>
