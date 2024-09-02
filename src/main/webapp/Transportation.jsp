<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transportation Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            width: 50%;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group select, .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .submit-btn {
            display: inline-block;
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            text-align: center;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .submit-btn:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function updatePrice() {
            const vehicleType = document.getElementById("vehicle_type").value;
            let price = 0;

            switch(vehicleType) {
                case "Car":
                    price = 50.00;
                    break;
                case "Bus":
                    price = 150.00;
                    break;
                case "Bike":
                    price = 30.00;
                    break;
                case "Van":
                    price = 80.00;
                    break;
                default:
                    price = 0;
            }

            document.getElementById("price").value = price.toFixed(2);
        }
    </script>
</head>
<body>

<div class="form-container">
    <h2>Transportation Booking</h2>
    <form action="TransportationBooking" method="post">
        <!-- Hidden field for booking ID (Ensure this is pre-filled in backend or frontend) -->
       <input type="hidden" name="booking_id" value="<%= request.getParameter("booking_id") %>">

        <div class="form-group">
            <label for="vehicle_type">Vehicle Type:</label>
            <select id="vehicle_type" name="vehicle_type" onchange="updatePrice()" required>
                <option value="">Select Vehicle Type</option>
                <option value="Car">Car</option>
                <option value="Bus">Bus</option>
                <option value="Bike">Bike</option>
                <option value="Van">Van</option>
            </select>
        </div>
        <div class="form-group">
            <label for="pickup_location">Pickup Location:</label>
            <input type="text" id="pickup_location" name="pickup_location" required>
        </div>
        <div class="form-group">
            <label for="dropoff_location">Dropoff Location:</label>
            <input type="text" id="dropoff_location" name="dropoff_location" required>
        </div>
        <div class="form-group">
            <label for="pickup_time">Pickup Time:</label>
            <input type="datetime-local" id="pickup_time" name="pickup_time" required>
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="text" id="price" name="price" readonly required>
        </div>
        <button type="submit" class="submit-btn">Book Transportation</button>
    </form>
</div>

</body>
</html>