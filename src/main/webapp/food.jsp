<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Food Booking</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            font-weight: 400;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #7848f4;
            position: absolute;
            top: 20px;
            left: 20px;
        }

        .logo span {
            color: black;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-top: 60px;
            font-weight: 600;
        }

        .meal-section {
            margin-bottom: 20px;
        }

        .meal-section h3 {
            color: #7848f4;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .meal-options {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .meal-item {
            flex: 1 1 calc(30% - 10px); /* Three items per row */
            text-align: center;
            background-color: #f9f9f9;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ddd;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
            height: 180px; /* Adjusted height */
        }

        .meal-item img {
            width: 200px; /* Adjusted image size */
            height: 140px;
            object-fit: cover;
            border-radius: 5px;
        }

        .meal-item .meal-checkbox {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }

        .meal-item input[type="checkbox"] {
            margin-right: 5px;
        }

        .meal-item label {
            font-weight: 500;
        }

        .select-all {
            margin: 10px 0;
            display: flex;
            justify-content: flex-end;
        }

        .select-all button {
            background-color: #7848f4;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
        }

        .select-all button:hover {
            background-color: #6633cc;
        }
        .head{
        font-size:25px;
        margin-left: 10px;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="logo">
            <span>Event</span> Wave
        </div>

        <h2>Select Your Food Options</h2>

        <!-- Select All Button -->
        <div class="select-all">
            <button onclick="selectAll()">Select All</button>
        </div>

        <!-- Day 1: Breakfast -->
        <div class="meal-section">
            <h3 class = "head">Breakfast</h3>
            <div class="meal-options">
                <div class="meal-item">
                    <img src="assets/IDLI.jpg" alt="Idli">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="idli1" name="food" value="idli">
                        <label for="idli1">Idli</label>
                    </div>
                </div>
                <div class="meal-item">
                    <img src="assets/paratha.jpg" alt="Paratha">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="paratha1" name="food" value="paratha">
                        <label for="paratha1">Aloo Paratha</label>
                    </div>
                </div>
                <div class="meal-item">
                    <img src="assets/dhokla.jpg" alt="Upma">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="upma1" name="food" value="upma">
                        <label for="upma1">Dhokla</label>
                    </div>
                    
                </div>
                                <div class="meal-item">
                    <img src="assets/upma.jpeg" alt="Upma">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="upma1" name="food" value="upma">
                        <label for="upma1">Upma</label>
                    </div>
                    
                </div>
                                <div class="meal-item">
                    <img src="assets/chole.avif" alt="Upma">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="upma1" name="food" value="upma">
                        <label for="upma1">Chole Bhature</label>
                    </div>
                    
                </div>
                
                                <div class="meal-item">
                    <img src="assets/sand.jpg" alt="Upma">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="upma1" name="food" value="upma">
                        <label for="upma1">Sandwich</label>
                    </div>
                    
                </div>
                
            </div>
        </div>

        <!-- Day 1: Lunch -->
        <div class="meal-section">
            <h3 class = "head">Lunch</h3>
            <div class="meal-options">
                <div class="meal-item">
                    <img src="assets/north.jpeg" alt="Dal Rice">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="dal_rice1" name="food" value="dal_rice">
                        <label for="dal_rice1">North Indian Cuisine</label>
                    </div>
                </div>
                <div class="meal-item">
                    <img src="assets/south.jpg" alt="Biryani">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="biryani1" name="food" value="biryani">
                        <label for="biryani1">South Indian Cuisine</label>
                    </div>
                </div>
                <div class="meal-item">
                    <img src="assets/punjab.jpg" alt="Biryani">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="veg_biryani1" name="food" value="veg_biryani">
                        <label for="veg_biryani1">Punjabi Cuisine</label>
                    </div>
                </div>
                
                 <div class="meal-item">
                    <img src="assets/bengali.webp" alt="Biryani">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="veg_biryani1" name="food" value="veg_biryani">
                        <label for="veg_biryani1">Bengali Cuisine</label>
                    </div>
                </div>
                 <div class="meal-item">
                    <img src="assets/raj.cms" alt="Biryani">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="veg_biryani1" name="food" value="veg_biryani">
                        <label for="veg_biryani1"> Rajasthani Cuisine</label>
                    </div>
                </div>
                 <div class="meal-item">
                    <img src="assets/mugh.jpg" alt="Biryani">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="veg_biryani1" name="food" value="veg_biryani">
                        <label for="veg_biryani1">Mughlai Cuisine</label>
                    </div>
                </div>
                </div>
          
        </div>

        <!-- Day 1: Snacks -->
        <div class="meal-section">
            <h3 class = "head">Snacks</h3>
            <div class="meal-options">
                <div class="meal-item">
                    <img src="assets/chaat.jpg" alt="Chaat">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="chaat1" name="food" value="chaat">
                        <label for="chaat1">Chaat</label>
                    </div>
                </div>
                <div class="meal-item">
                    <img src="assets/pav.jpg" alt="Pizza">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="pizza1" name="food" value="pizza">
                        <label for="pizza1">Pav Bhaji</label>
                    </div>
                </div>
                   <div class="meal-item">
                    <img src="assets/pizza.jpg" alt="Pizza">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="pizza1" name="food" value="pizza">
                        <label for="pizza1">Pizza & Pastas</label>
                    </div>
                </div>
                   <div class="meal-item">
                    <img src="assets/samosa.jpg" alt="Pizza">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="pizza1" name="food" value="pizza">
                        <label for="pizza1">Samosa & pakoras</label>
                    </div>
                </div>
                   <div class="meal-item">
                    <img src="assets/momo.jpg" alt="Pizza">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="pizza1" name="food" value="pizza">
                        <label for="pizza1">Momos</label>
                    </div>
                </div>
                 <div class="meal-item">
                    <img src="assets/chow.jpg" alt="Pizza">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="pizza1" name="food" value="pizza">
                        <label for="pizza1">Chowmein & manchurian</label>
                    </div>
                </div>
            </div>
        </div>

        <!-- Day 1: Dinner -->
        <div class="meal-section">
            <h3 class = "head">Dinner</h3>
            <div class="meal-options">
                <div class="meal-item">
                    <img src="assets/starter.jpg" alt="Paneer Tikka">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="paneer_tikka1" name="food" value="paneer_tikka">
                        <label for="paneer_tikka1">Starters/Appetizers</label>
                    </div>
                </div>
                <div class="meal-item">
                    <img src="assets/veg.jpg" alt="Chicken Tikka">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="chicken_tikka1" name="food" value="chicken_tikka">
                        <label for="chicken_tikka1">Vegetarian Dishes</label>
                    </div>
                </div>
                <div class="meal-item">
                    <img src="assets/nonveg.jpg" alt="Fried Rice">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="fried_rice1" name="food" value="fried_rice">
                        <label for="fried_rice1">Non-Vegetarian Dishes</label>
                    </div>
                </div>
                 <div class="meal-item">
                    <img src="assets/salad.jpg" alt="Fried Rice">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="fried_rice1" name="food" value="fried_rice">
                        <label for="fried_rice1">Salads</label>
                    </div>
                </div>
                 <div class="meal-item">
                    <img src="assets/bev.webp" alt="Fried Rice">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="fried_rice1" name="food" value="fried_rice">
                        <label for="fried_rice1">Beverages</label>
                    </div>
                </div>
                 <div class="meal-item">
                    <img src="assets/des.jpg" alt="Fried Rice">
                    <div class="meal-checkbox">
                        <input type="checkbox" id="fried_rice1" name="food" value="fried_rice">
                        <label for="fried_rice1">Desserts</label>
                    </div>
                </div>
            </div>
        </div>

    </div>

 <script>
    let allSelected = false; // Track whether all are selected

    function selectAll() {
        const checkboxes = document.querySelectorAll('input[name="food"]');
        allSelected = !allSelected; // Toggle the state

        checkboxes.forEach(checkbox => checkbox.checked = allSelected);
    }
</script>

</body>
</html>
