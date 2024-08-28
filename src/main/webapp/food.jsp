<!DOCTYPE html>
<html>
<head>
    <title>Food Booking</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
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
    <h1>Book Food for Your Event</h1>
    <form action="FoodBooking" method="post">
        <label for="food_provider_name">Food Provider Name:</label>
        <select id="food_provider_name" name="food_provider_name" required>
            <!-- Prepopulate food provider names from the database -->
            <option value="Provider1">Provider1</option>
            <option value="Provider2">Provider2</option>
            <!-- Add more providers as needed -->
        </select><br>

        <label>Food Items:</label><br>
        <input type="checkbox" name="food_items" value="Veg Item 1" data-cost="10.00" onchange="updateTotalCost()"> Veg Item 1 - $10.00<br>
        <input type="checkbox" name="food_items" value="Veg Item 2" data-cost="15.00" onchange="updateTotalCost()"> Veg Item 2 - $15.00<br>
        <input type="checkbox" name="food_items" value="Non-Veg Item 1" data-cost="20.00" onchange="updateTotalCost()"> Non-Veg Item 1 - $20.00<br>
        <input type="checkbox" name="food_items" value="Non-Veg Item 2" data-cost="25.00" onchange="updateTotalCost()"> Non-Veg Item 2 - $25.00<br>

        <label for="total_cost">Total Cost:</label>
        <input type="text" id="total_cost" name="total_cost" readonly><br>

        <input type="submit" value="Book Food">
    </form>
</body>
</html>
