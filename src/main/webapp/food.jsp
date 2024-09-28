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
        }

        .container {
            width: 100%;
            max-width: 720px;
            margin: 50px auto;
            background-color: #fff;
            padding: 40px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
        }

        .logo {
            position: absolute;
            top: 20px;
            left: 30px;
            font-size: 25px;
            font-weight: bold;
            color: #000;
        }

        .logo .wave {
            color: #7848f4;
        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 1.8em;
            margin-bottom: 20px;
        }

        label {
            font-size: 1.1em;
            color: #555;
            font-weight: bold;
            margin-bottom: 10px;
            display: block;
        }

        select, input[type="text"], input[type="number"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
            width: 100%;
            margin-bottom: 15px;
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

        .food-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .food-item img {
            width: 160px;
            height: 120px;
            border-radius: 5px;
        }

        .food-item label {
            flex: 1;
            text-align: left;
            margin-left: 20px;
        }

        .food-item input[type="checkbox"] {
            margin-right: 15px;
            transform: scale(1.5);
            cursor: pointer;
        }

        .total-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .total-section input[type="text"] {
            width: auto;
            padding: 10px;
            font-size: 1.2em;
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
        <h1>Food Booking</h1>

        <form action="FoodBooking" method="post">
            <!-- Use EL to retrieve booking_id and event_price from request parameters -->
            <input type="hidden" name="booking_id" value="${param.booking_id}">
            <input type="hidden" name="event_price" value="${param.event_price}">

            <label for="food_provider_name">Food Provider Name:</label>
            <select id="food_provider_name" name="food_provider_name" required>
                <option value="Bharat Caterers">Bharat Caterers</option>
                <option value="Ravi Caterers">Ravi Caterers</option>
                <option value="Kailash Caterers">Kailash Caterers</option>
                <option value="Sanjay Caterers">Sanjay Caterers</option>
                <option value="Gourmet Caterers">Gourmet Caterers</option>
                <!-- Add more providers as needed -->
            </select>
            <br><br>

            <label class="items">Food Items:</label>

            <!-- Food Item 1 -->
            <div class="food-item">
                <input type="checkbox" name="food_items" value="Veg Item 1" data-cost="750" id="veg_item_1" onchange="updateTotalCost()">
                <img src="assets/veg.webp" alt="Veg Item 1">
                <label for="veg_item_1">
                    Veg Cuisine - 750/-
                </label>
            </div>

            <!-- Food Item 2 -->
            <div class="food-item">
                <input type="checkbox" name="food_items" value="Non-Veg Item 1" data-cost="1250" id="non_veg_item_1" onchange="updateTotalCost()">
                <img src="assets/non veg.jpg" alt="Non-Veg Item 1">
                <label for="non_veg_item_1">
                    Non-Veg Cuisine - 1250/-
                </label>
            </div>

            <!-- Food Item 3 -->
            <div class="food-item">
                <input type="checkbox" name="food_items" value="Snacks" data-cost="500" id="snacks" onchange="updateTotalCost()">
                <img src="assets/snacks.avif" alt="Snacks">
                <label for="snacks">
                    Snacks - 500/-
                </label>
            </div>

            <!-- Food Item 4 -->
            <div class="food-item">
                <input type="checkbox" name="food_items" value="Desserts" data-cost="800" id="desserts" onchange="updateTotalCost()">
                <img src="assets/desert.jpg" alt="Desserts">
                <label for="desserts">
                    Desserts - 800/-
                </label>
            </div>

            <div class="total-section">
                <label for="total_cost">Total Cost:</label>
                <input type="text" id="total_cost" name="total_cost" readonly>
            </div>

            <input type="submit" value="Book Food">
        </form>
    </div>
</body>
</html>
    
