
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>
    <h2>Review Your Charges</h2>

    <table border="1">
        <tr>
            <th>Item</th>
            <th>Cost (INR)</th>
        </tr>
        <tr>
            <td>Event</td>
            <td>${eventCost}</td>
        </tr>
        <tr>
            <td>Food</td>
            <td>${foodCost}</td>
        </tr>
        <tr>
            <td>Transportation</td>
            <td>${transportationCost}</td>
        </tr>
        <tr>
            <th>Total</th>
            <th>${totalCost}</th>
        </tr>
    </table>

    <h3>Total Amount to be Paid: ₹${totalCost}</h3>

    <form id="paymentForm">
        <input type="hidden" id="amount" value="${totalCost}">
        <input type="hidden" id="bookingId" value="${bookingId}">

        <button type="button" id="rzp-button">Pay Now</button>
    </form>
  <%
    String api_key = System.getenv("RAZORPAY_KEY");
    %>
    <script>
        var options = {
            "key": "YOUR_API_KEY", // Enter the Key ID generated from the Dashboard
            "amount": document.getElementById('amount').value * 100, // Amount in paise
            "currency": "INR",
            "name": "Event Management System",
            "description": "Booking Payment",
            "handler": function (response){
                alert('Payment successful!');
                // Send the response to your server here to save the transaction details
                window.location.href = "confirmation.jsp";
            },
            "prefill": {
                "name": "Customer Name",
                "email": "customer@example.com"
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
