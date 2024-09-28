<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transportation Booking</title>
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
            color: #333;
            box-sizing: border-box;
        }

        .form-container {
            width: 50%;
            max-width: 700px;
            padding: 40px;
            border-radius: 15px;
            background-color: #fff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
            position: relative;
            margin-top: 250px;
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

        h1 {
            text-align: center; 
            color: #333;
            font-size: 2em;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 20px;
            font-size: 1.1em;
            color: #000;
        }

        .form-group select,
        .form-group input {
            width: 100%;
            padding: 15px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
        }

        .submit-btn {
            display: inline-block;
            width: 100%;
            padding: 15px;
            background-color: #6a5acd;
            color: white;
            text-align: center;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.2em;
            margin-top: 20px;
        }

        .submit-btn:hover {
            background-color: #483d8b;
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
   
        <div class="logo">
            Event <span class="wave">Wave</span>
        </div>
         <div class="form-container">
        <h1>Transportation Booking</h1>
        <form action="TransportationBooking" method="post">
            <input type="hidden" name="booking_id" value="${param.booking_id}">
            <input type="hidden" name="event_price" value="${param.event_price}">
            <input type="hidden" name="food_cost" value="${param.food_cost}">

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

        <c:if test="${not empty error}">
            <div style="color: red;">${error}</div>
        </c:if>
    </div>
</body>
</html>
