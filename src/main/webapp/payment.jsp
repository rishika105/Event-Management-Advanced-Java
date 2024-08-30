<%@ page import="java.math.BigDecimal" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment</title>
</head>
<body>
    <h1>Payment Details</h1>
    
    <p>Booking ID: ${param.booking_id}</p>
    <p>Event Price: ₹<%= request.getAttribute("eventPrice") != null ? request.getAttribute("eventPrice") : "N/A" %></p>
 <p>Food Price: ₹<%= request.getAttribute("foodPrice") != null ? request.getAttribute("foodPrice") : "N/A" %></p>

    <p>Total Amount: ₹<%= request.getAttribute("totalPrice") != null ? request.getAttribute("totalPrice") : "N/A" %></p>

    <!-- Razorpay Payment Form -->
    <form action="payment" method="POST">
        <%
            BigDecimal totalPrice = (BigDecimal) request.getAttribute("totalPrice");
            if (totalPrice == null) {
                totalPrice = BigDecimal.ZERO;
            }
            int amount = totalPrice.multiply(new BigDecimal(100)).intValue();
        %>
        <input type="hidden" name="amount" value="<%= amount %>"/>
        <input type="hidden" name="order_id" value="<%= request.getAttribute("razorpayOrderId") %>"/>
        <input type="hidden" name="callback_url" value="/paymentSuccess"/>
        <button type="submit">Pay Now</button>
    </form>
</body>
</html>
