<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Food Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .meal-section {
            margin-bottom: 20px;
        }
        .meal-section h3 {
            color: #7848f4;
            margin-bottom: 10px;
        }
        .meal-options {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }
        .meal-item {
            flex: 1 1 calc(33.333% - 10px);
            text-align: center;
            background-color: #f9f9f9;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ddd;
        }
        .meal-item img {
            width: 100%;
            max-width: 100px;
            height: auto;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        .meal-item input[type="checkbox"] {
            margin-right: 8px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Select Your Food Options</h2>

        <!-- Day 1: Breakfast -->
        <div class="meal-section">
            <h3>Breakfast</h3>
            <div class="meal-options">
            
                <div class="meal-item">
                    <img src="path-to-idli-image.jpg" alt="Idli">
                    <input type="checkbox" id="idli1" name="day1_breakfast" value="idli">
                    <label for="idli1">Idli</label>
                </div>
                
                <div class="meal-item">
                    <img src="path-to-paratha-image.jpg" alt="Paratha">
                    <input type="checkbox" id="paratha1" name="day1_breakfast" value="paratha">
                    <label for="paratha1">Aloo Paratha</label>
                </div>
                
                <div class="meal-item">
                    <img src="path-to-upma-image.jpg" alt="Upma">
                    <input type="checkbox" id="upma1" name="day1_breakfast" value="upma">
                    <label for="upma1">Upma</label>
                </div>
                
                    <div class="meal-item">
                    <img src="path-to-upma-image.jpg" alt="Dhokla">
                    <input type="checkbox" id="upma1" name="day1_breakfast" value="dhokla">
                    <label for="upma1">Dhokla</label>
                </div>
               
                   <div class="meal-item">
                    <img src="path-to-upma-image.jpg" alt="Dhokla">
                    <input type="checkbox" id="upma1" name="day1_breakfast" value="dosa">
                    <label for="upma1">Masala Dosa</label>
                </div>

                    <div class="meal-item">
                    <img src="path-to-upma-image.jpg" alt="Dhokla">
                    <input type="checkbox" id="upma1" name="day1_breakfast" value="sandwich">
                    <label for="upma1">Sandwich</label>
                </div>
                
            </div>
            </div>
           
       

        <!-- Day 1: Lunch -->
        <div class="meal-section">
        
            <h3>Lunch</h3>
            
            <div class="meal-options">
            
                <div class="meal-item">
                    <img src="path-to-dal-rice-image.jpg" alt="Dal Rice">
                    <input type="checkbox" id="dal_rice1" name="day1_lunch" value="dal_rice">
                    <label for="dal_rice1">Dal Rice</label>
                </div>
                
                <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Non-Veg Biryani</label>
                </div>
                
                <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Veg Biryani</label>
                </div>
                
                <div class="meal-item">
                    <img src="path-to-paneer-image.jpg" alt="Paneer">
                    <input type="checkbox" id="paneer1" name="day1_lunch" value="paneer">
                    <label for="paneer1">Paneer Butter Masala</label>
                </div>
                
                  <div class="meal-item">
                    <img src="path-to-paneer-image.jpg" alt="Paneer">
                    <input type="checkbox" id="paneer1" name="day1_lunch" value="paneer">
                    <label for="paneer1">Chicken Butter Masala</label>
                </div>
               
                
                <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Veg Platter</label>
                </div>
                
                <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Non-Veg Platter</label>
                </div>
                
                <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Tandoori Roti</label>
                </div>
                
                                <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Butter Naan</label>
                </div>
                
                <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Gulab Jamun</label>
                </div>
                
                                <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Kheer</label>
                </div>
                
            </div>
            </div>
       
         
        
        
        <div class="meal-section">
        
            <h3>Snacks</h3>
            <div class="meal-options">
            
             <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Chaat</label>
                </div>
             
                          
                <div class="meal-item">
                    <img src="path-to-dal-rice-image.jpg" alt="Dal Rice">
                    <input type="checkbox" id="dal_rice1" name="day1_lunch" value="dal_rice">
                    <label for="dal_rice1">Pasta</label>
                </div>
                
                <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Pizza</label>
                </div>
                
                <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Pastry</label>
                </div>
                
                <div class="meal-item">
                    <img src="path-to-paneer-image.jpg" alt="Paneer">
                    <input type="checkbox" id="paneer1" name="day1_lunch" value="paneer">
                    <label for="paneer1">Chicken & Egg Pakora</label>
                </div>
                

                        <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Veg Pakoras</label>
                </div>
                
                  <div class="meal-item">
                    <img src="path-to-paneer-image.jpg" alt="Paneer">
                    <input type="checkbox" id="paneer1" name="day1_lunch" value="paneer">
                    <label for="paneer1">Noodles & manchurian</label>
                </div>
                
                <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Momos</label>
              
         </div>
            </div>
        </div>

        <!-- Day 1: Dinner -->
        <div class="meal-section">
        
            <h3>Dinner</h3>
            
            <div class="meal-options">
            
                <div class="meal-item">
                    <img src="path-to-dosa-image.jpg" alt="Dosa">
                    <input type="checkbox" id="dosa1" name="day1_dinner" value="dosa">
                    <label for="dosa1">Paneer Tikka</label>
                </div>
                
                <div class="meal-item">
                    <img src="path-to-pasta-image.jpg" alt="Pasta">
                    <input type="checkbox" id="pasta1" name="day1_dinner" value="pasta">
                    <label for="pasta1">Chicken Tikka</label>
                </div>
                
                <div class="meal-item">
                    <img src="path-to-fried-rice-image.jpg" alt="Fried Rice">
                    <input type="checkbox" id="fried_rice1" name="day1_dinner" value="fried_rice">
                    <label for="fried_rice1">Fried Rice</label>
                </div>
                
                 <div class="meal-item">
                    <img src="path-to-paneer-image.jpg" alt="Paneer">
                    <input type="checkbox" id="paneer1" name="day1_lunch" value="paneer">
                    <label for="paneer1">Paneer Butter Masala</label>
                </div>
                
                  <div class="meal-item">
                    <img src="path-to-paneer-image.jpg" alt="Paneer">
                    <input type="checkbox" id="paneer1" name="day1_lunch" value="paneer">
                    <label for="paneer1">Chicken Butter Masala</label>
                </div>
                
                <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Veg Platter</label>
                </div>
                
                <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Litti Choka</label>
                </div>
               
                <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Non-Veg Platter</label>
                </div>
                
                         <div class="meal-item">
                    <img src="path-to-paneer-image.jpg" alt="Paneer">
                    <input type="checkbox" id="paneer1" name="day1_lunch" value="paneer">
                    <label for="paneer1">Chilli Gobi</label>
                </div>
                
               
                  <div class="meal-item">
                    <img src="path-to-paneer-image.jpg" alt="Paneer">
                    <input type="checkbox" id="paneer1" name="day1_lunch" value="paneer">
                    <label for="paneer1">Soya Chaap</label>
                </div>
                
                                <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Tandoori Roti</label>
                </div>
                                <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Butter Naan</label>
                </div>
                
                 
                   <div class="meal-item">
                    <img src="path-to-biryani-image.jpg" alt="Biryani">
                    <input type="checkbox" id="biryani1" name="day1_lunch" value="biryani">
                    <label for="biryani1">Ice-cream & Desserts</label>
                </div>
               
                   </div>
          
        </div>

        <!-- You can repeat the sections for Day 2, Day 3, etc. -->

    </div>
      

</body>
</html>
