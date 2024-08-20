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
            background-color: #7848f4;
            padding: 10px 20px;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            color: #ffffff;
            font-size: 25px;
            font-weight: bold;
        }

        nav ul {
            list-style-type: none;
            display: flex;
            margin: 0;
            padding: 0;
        }

        nav ul li {
            margin-left: 20px;
        }

        nav ul li a {
            color: #ffffff;
            text-decoration: none;
            font-size: 18px;
        }

        nav ul li a:hover,
        nav ul li.active a {
            text-decoration: underline;
        }

        .about-section {
            padding: 40px 20px;
            text-align: center;
            background-color: #ffffff;
        }

        .about-section h1 {
            font-size: 36px;
            margin-bottom: 10px;
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
            height: 200px;
            background-color: #ccc;
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
    </style>
</head>
<body>
    <header>
        <nav>
            <div class="logo">Event Wave</div>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li class="active"><a href="about.jsp">About Us</a></li>
                <li><a href="contact.jsp">Contact Us</a></li>
            </ul>
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
                <div class="image-placeholder"></div>
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
                <div class="image-placeholder"></div>
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
                <div class="image-placeholder"></div>
            </div>
        </div>
    </section>
</body>
</html>