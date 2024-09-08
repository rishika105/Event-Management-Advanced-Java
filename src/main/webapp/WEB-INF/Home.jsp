<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Wave</title>
    <style>
        body {
            font-family: 'Product Sans', sans-serif;
            background-color: #f8f8fa;
            overflow-x: hidden;
            margin-left: -50px;
        }

        .container {
            height: 40px;
            width: 1470px;
            margin-top: 20px;
        }

        .logo {
            right: 20px;
            font-size: 25px;
            font-weight: bold;
            color: #000;
            z-index: 10;
            padding-top: 5px;
            margin-left: 90px;
            margin-top: -20px;
        }

        .logo .wave {
            color: #7848f4;
        }

        /* Navbar */
        .navbar {
            height: 40px;
            width: 1470px;
            background-color: white;
            padding-left: 150px;
            display: flex;
            align-items: center;
        }

        .navbar a {
            text-decoration: none;
            color: blue;
            margin-left: 40px;
            font-size: 1.2em;
        }

        .login-btn, .signup-btn {
            height: 25px;
            width: 110px;
            text-align: center;
            line-height: 25px;
            border-radius: 3px;
            font-size: 1em;
            margin-left: 25px;
        }

        .login-btn {
            background-color: whitesmoke;
            border: 1px solid grey;
        }

        .signup-btn {
            background-color: blueviolet;
            color: white;
        }

        /* Main banner */
        .main-banner {
            height: 450px;
            width: 1150px;
            background-image: url('assets/head1.jpg');
            margin: 5px 150px;
            border-radius: 20px;
            color: white;
            text-align: center;
            padding-top: 60px;
            font-size: 1.5em;
        }

        /* Event filters */
        .event-filters {
            height: 100px;
            width: 1000px;
            background-color: blueviolet;
            margin: 25px auto;
            border-radius: 20px;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .event-filters div {
            color: white;
            font-size: 1.2em;
        }

        .event-filters select {
            height: 30px;
            width: 170px;
            border-radius: 4px;
            border: 1px solid blue;
            color: blue;
        }

        /* Event cards */
        .event-cards {
            height: 450px;
            width: 1000px;
            margin: 25px auto;
            display: flex;
            justify-content: space-between;
        }

        .event-card {
            height: 450px;
            width: 333px;
        }

        .event-card img {
            height: 320px;
            width: 100%;
            border-radius: 20px;
        }

        .event-info {
            background-color: white;
            height: 100px;
            border-radius: 20px;
            padding: 10px;
            margin-top: 10px;
            text-align: center;
        }

        .event-info p {
            margin: 5px 0;
        }

        .event-info .date {
            color: greenyellow;
        }

        /* Load more button */
        .load-more {
            display: block;
            margin: 20px auto;
            background-color: blueviolet;
            height: 30px;
            width: 100px;
            border-radius: 4px;
            color: white;
            text-align: center;
            line-height: 30px;
            text-decoration: none;
        }

        /* Footer */
        .footer {
            height: 200px;
            width: 1000px;
            margin: 65px auto;
            background-color: #52B2C0;
            border-radius: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .footer img {
            height: 200px;
            width: 300px;
        }

        .footer div {
            color: white;
            padding-right: 30px;
        }

        .footer button {
            height: 30px;
            width: 120px;
            background-color: blueviolet;
            color: white;
            border: none;
            border-radius: 4px;
        }

        .brands, .blogs {
            width: 1000px;
            margin: 70px auto;
        }

        .brands img, .blogs img {
            height: 50px;
            width: 130px;
            margin: 30px 50px;
            border-radius: 2px;
        }

        .trending, .our-blogs {
            font-size: 1.2em;
            margin-left: 225px;
            margin-top: 60px;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <a href="#">Home</a>
        <a href="aboutus.jsp">About us</a>
        <a href="contactus.jsp">Contact us</a>
        <a href="login.jsp" class="login-btn">Login</a>
        <a href="register.jsp" class="signup-btn">Signup</a>
    </div>

    <!-- Logo -->
    <div class="container">
        <div class="logo">Event <span class="wave">Wave</span></div>
    </div>

    <!-- Main banner -->
    <div class="main-banner">
        MADE FOR THOSE WHO DO EVENT WAVE
    </div>

    <!-- Event filters -->
    <div class="event-filters">
        <div>
            Looking for
            <select>
                <option>Choose event type</option>
                <option>Wedding</option>
            </select>
        </div>
        <div>
            Location
            <select>
                <option>Choose location</option>
                <option>Bhubaneswar</option>
                <option>Delhi</option>
            </select>
        </div>
        <div>
            When
            <select>
                <option>Choose date and time</option>
            </select>
        </div>
        <div>
            <img src="assets/search_icon2.jpg" alt="Search" style="height:90px;width:90px;border-radius:20px;">
        </div>
    </div>

    <!-- Event cards -->
    <div class="event-cards">
        <div class="event-card">
            <img src="assets/diwali1.jpg" alt="Event 1">
            <div class="event-info">
                <p>BestSeller Book Bootcamp - Write, Market & Publish Your Book - Lucknow</p>
                <p class="date">Saturday, August 12, 9:30 PM</p>
                <p>ONLINE EVENT - Attend anywhere</p>
            </div>
        </div>
        <div class="event-card">
            <img src="assets/holi1.jpg" alt="Event 2">
            <div class="event-info">
                <p>BestSeller Book Bootcamp - Write, Market & Publish Your Book - Lucknow</p>
                <p class="date">Saturday, August 12, 9:30 PM</p>
                <p>ONLINE EVENT - Attend anywhere</p>
            </div>
        </div>
        <div class="event-card">
            <img src="assets/holi1.jpg" alt="Event 3">
            <div class="event-info">
                <p>BestSeller Book Bootcamp - Write, Market & Publish Your Book - Lucknow</p>
                <p class="date">Saturday, August 12, 9:30 PM</p>
                <p>ONLINE EVENT - Attend anywhere</p>
            </div>
        </div>
    </div>

    <a href="#" class="load-more">Load more...</a>

    <!-- Footer -->
    <div class="footer">
        <img src="assets/image_4.jpg" alt="Event Creation">
        <div>
            <h3>Make your own Event</h3>
            <h6>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h6>
            <button>Create account</button>
        </div>
    </div>

    <!-- Brands section -->
    <div class="brands">
        <h4>Join these brands</h4>
        <p>We've had the pleasure of working with industry-defining brands. These are just some of them.</p>
        <img src="assets/spotify.jpg" alt="Spotify">
        <img src="assets/google.jpg" alt="Google">
        <img src="assets/stripe.jpg" alt="Stripe">
        <img src="assets/youtube.jpg" alt="YouTube">
        <img src="assets/microsoft.jpg" alt="Microsoft">
        <img src="assets/airbnb.jpg" alt="Airbnb">
    </div>

    <!-- Blogs section -->
    <div class="blogs">
        <h4>Our Blogs</h4>
        <img src="assets/blog_image.jpg" alt="Blog 1">
        <img src="assets/blog_image.jpg" alt="Blog 2">
        <img src="assets/blog_image.jpg" alt="Blog 3">
    </div>
</body>
</html>
