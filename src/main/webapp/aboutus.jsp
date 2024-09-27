<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Event Management</title>
    <style>
        body {
            font-family: 'Product Sans', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8fa;
        }

        header {
         
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            color: black;
            font-size: 25px;
            font-weight: bold;
             top: 20px;
            left: 30px;
            color: #000;
            padding: 20px;
        }
        
        .logo a {
            text-decoration: none;
            color: inherit;
        }

        .logo .wave {
            color: #7848f4;
        }

       
        .about-section {
            padding: 20px 20px;
            text-align: center;
            background-color: #ffffff;
        }

        .about-section h1 {
            font-size: 36px;
            margin-bottom: 30px;
            color: #000000;
        }

        .about-section .tagline {
            font-size: 16px;
            color: #131315;
        }

        .about-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 40px;
            padding: 20px;
        }

        .about-content .about-text {
            width: 60%;
            text-align: left;
        }

        .about-content .about-text h2 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #000000;
        }

        .about-content .about-text p {
            font-size: 16px;
            color: #687c94;
        }

        .about-content .about-image {
            width: 35%;
            text-align: center;
        }

        .image-placeholder {
            width: 100%;
            height: 250px;
            background-color: #ccc;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Ensuring the image fits within the placeholder */
        .image-placeholder img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .stats-section {
            display: flex;
            justify-content: space-around;
            background-color: #f0f0f0;
            padding: 20px 0;
            margin-top: 40px;
        }

        .stats-section .stat-item h3 {
            font-size: 28px;
            color: #000000;
            margin: 0;
        }

        .stats-section .stat-item p {
            font-size: 16px;
            color: #687c94;
        }
        
        .footer {
            background-color: #0A0F34;
            color: white;
            padding: 20px 20px;
            text-align: center;
        }

        .footer .logo {
            font-size: 28px;
            font-weight: bold;
            color: white;
            margin-bottom: 30px;
        }

        .footer .highlight {
            color: #6A3DF0;
        }

        .footer .newsletter {
            margin-bottom: 30px;
        }

        .footer .newsletter form {
            display: flex;
            justify-content: center;
            align-items: center;
            max-width: 500px;
            margin: 0 auto;
            flex-direction: row;
        }

        .footer .newsletter input {
            flex-grow: 1;
            padding: 10px;
            border: none;
            border-radius: 5px;
            width: 70%;
            margin: 0;
            box-sizing: border-box;
        }

        .footer .newsletter button {
            padding: 10px 20px;
            margin-left: 10px; /* Add space between input and button */
            background-color: #6A3DF0;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            white-space: nowrap;
            flex-grow: 0;
        }

        .footer .footer-lower-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #AAA;
        }

        .footer .language-links {
            display: flex;
            justify-content: left;
        }

        .footer .language-links a {
            margin: 0 10px;
            color: white;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 5px;
            text-align: left;
        }

        .footer .language-links a:first-child {
            color: #6A3DF0;
            font-weight: bold;
        }

        .footer .footer-note {
            font-size: 14px;
            color: #AAA;
            text-align: right;
        }
        .back{
          color:#6A3DF0;
          padding: 25px;
        }
    </style>
</head>
<body>
    <header>
        <nav>
            <div class="logo">
    <a href="index.jsp">Event <span class="wave">Wave</span></a>
</div>
          <a href="index.jsp" class = "back">Back to Home</a>
               
          
        </nav>
    </header>
    
    <section class="about-section">
        <h1>About Event Wave</h1>
        <p class="tagline">We bring <strong>dream events</strong> to life!</p>
        
        <div class="about-content">
            <div class="about-text">
                <h2>About Us</h2>
                <p>Welcome to Event Wave, your go-to platform for event planning and execution. We understand that organizing an event, whether big or small, can be a daunting task. That's why we're here to simplify the process, giving you all the tools you need to plan, manage, and execute your event effortlessly.
                   Our platform is designed with you in mind, offering a user-friendly interface that allows you to handle everything from guest lists to seating arrangements, from ticket sales to post-event feedback in one place. Whether you're organizing a corporate conference, a wedding, or a private party, Event Wave provides the flexibility and functionality to meet your specific needs.</p>
            </div>
            <div class="about-image">
                <!-- Placeholder for an image -->
                <div class="image-placeholder">
                    <img src="assets/party.jpeg" alt="image1">
                </div>
            </div>
        </div>
        
        <div class="stats-section">
            <div class="stat-item">
                <h3>10,000</h3>
                <p>Event Vendors</p>
            </div>
            <div class="stat-item">
                <h3>20,000</h3>
                <p>Annual Events</p>
            </div>
            <div class="stat-item">
                <h3>1,000</h3>
                <p>Wedding Events</p>
            </div>
            <div class="stat-item">
                <h3>1.5 M</h3>
                <p>Monthly Followers</p>
            </div>
        </div>
        
        <div class="about-content">
            <div class="about-image">
                <!-- Placeholder for an image -->
                <div class="image-placeholder">
                    <img src="assets/conference meeting.jpeg" alt="image2">
                </div>
            </div>
            <div class="about-text">
                <h2>Our Mission</h2>
                <p>At Event Wave, our mission is to make event management stress-free and enjoyable. We are committed to delivering innovative solutions that empower our users to create memorable experiences without the hassle.</p>
            </div>
        </div>
        
        <div class="about-content">
            <div class="about-text">
                <h2>Why Choose Us?</h2>
                <p>Our platform offers a suite of features to cover every aspect of event planning.
                   We prioritize ease of use, ensuring that our system is accessible to everyone, from seasoned event planners to first-timers.
                   Tailor our tools to fit the unique requirements of your event.
                   Our dedicated support team is always available to assist you, ensuring your event runs smoothly from start to finish.
                   Join us at Event Wave and experience the future of event management. We're here to turn your vision into reality, making your event one to remember.</p>
            </div>
            <div class="about-image">
                <!-- Placeholder for an image -->
                <div class="image-placeholder">
                    <img src="assets/weeding.jpeg" alt="image3">
                </div>
            </div>
        </div>
    </section>
    
    <footer class="footer">
        <div class="logo">
            Event <span class="highlight">Wave</span>
        </div>
        
        <div class="newsletter">
            <form>
                <input type="email" placeholder="Enter your mail">
                <button type="submit">Subscribe</button>
            </form>
        </div>
        
        <div class="footer-lower-section">
            <div class="language-links">
                <a href="#">English</a>
                <a href="#">French</a>
                <a href="#">Hindi</a>
            </div>
            
            <div class="footer-note">
                <p>Non Copyrighted © 2023 Upload by rich technologies</p>
            </div>
        </div>
    </footer>
    
</body>
</html>
