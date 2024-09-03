<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Food Booking</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            color: #333;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            width: 100%;
            max-width: 720px;
            margin: 50px auto;
            background-color: #fff;
            padding: 40px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            box-sizing: border-box; /* Include padding and border in width */
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

        h1 {
            text-align: center;
            color: #333;
            font-size: 1.8em; /* Adjusted heading size */
            margin-bottom: 20px;
        }

        label {
            font-size: 1.1em;
            color: #555;
            font-weight: bold;
            margin-bottom: 10px; /* Added margin below labels */
            display: block; /* Ensures labels are block elements */
        }

        select, input[type="text"], input[type="number"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
            width: 100%;
            box-sizing: border-box;
            margin-bottom: 15px; /* Added margin below inputs */
        }

        input[type="submit"] {
            padding: 15px;
            background-color: #6a5acd;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 1.2em;
            cursor: pointer;
            width: 100%;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #483d8b;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-top: 20px;
        }
      
    </style>
    <script>
        function updateTotalCost() {
            var totalCost = 0;
            var checkboxes = document.querySelectorAll('input[name="food_items"]:checked');
            checkboxes.forEach(function(checkbox) {
                totalCost += parseFloat(checkbox.getAttribute('data-cost'));
            });
            document.getElementById('total_cost').value = totalCost.toFixed(2);
        }
    </script>
</head>
<body>
    <div class="logo">
        Event <span class="wave">Wave</span>
    </div>

    <div class="container">
        <h1>Book Food for Your Event</h1>

        <form action="FoodBooking" method="post">
            <!-- Use EL to retrieve booking_id and event_price from request parameters -->
            <input type="hidden" name="booking_id" value="${param.booking_id}">
            <input type="hidden" name="event_price" value="${param.event_price}">

            <label for="food_provider_name">Food Provider Name:</label>
            <select id="food_provider_name" name="food_provider_name" required>
                <!-- Prepopulate food provider names from the database or static options -->
                <option value="Provider1">Provider1</option>
                <option value="Provider2">Provider2</option>
                <!-- Add more providers as needed -->
            </select>
            <br><br>

            <label class = "items">Food Items:</label>
            <input type="checkbox" name="food_items" value="Veg Item 1" data-cost="10.00" onchange="updateTotalCost()"> Veg Item 1 - $10.00<br><br>
            <input type="checkbox" name="food_items" value="Veg Item 2" data-cost="15.00" onchange="updateTotalCost()"> Veg Item 2 - $15.00<br><br>
            <input type="checkbox" name="food_items" value="Non-Veg Item 1" data-cost="20.00" onchange="updateTotalCost()"> Non-Veg Item 1 - $20.00<br><br>
            <input type="checkbox" name="food_items" value="Non-Veg Item 2" data-cost="25.00" onchange="updateTotalCost()"> Non-Veg Item 2 - $25.00<br><br>

           <br><label for="total_cost">Total Cost:</label>
            <input type="text" id="total_cost" name="total_cost" readonly>

            <input type="submit" value="Book Food">
        </form>

      
    </div>
</body>
</html>
