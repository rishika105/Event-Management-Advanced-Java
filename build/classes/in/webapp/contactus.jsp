<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us - Event Management System</title>
    <style>
        body {
            font-family: 'Product Sans', sans-serif;
            background-color: #ffffff;
            margin: 0;
            padding: 0;
            color: #131315;
        }

        header, footer {
            background-color: #fff;
            text-align: center;
            padding: 20px 0;
        }

        header h1 {
            font-size: 36px;
            margin: 0;
            color: #000;
        }

        header p {
            font-size: 18px;
            color: #687c94;
            margin: 10px 0;
        }

        .navbar {
            display: flex;
            justify-content: space-around;
            background-color: #333;
            padding: 14px 0;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 14px 20px;
            font-size: 18px;
        }

        .navbar a:hover {
            background-color: #575757;
            border-radius: 4px;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            max-width: 1200px;
        }

        .content {
            display: flex;
            justify-content: space-between;
            margin-top: 40px;
        }

        .form-section, .contact-info {
            background-color: #fff;
            padding: 30px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .form-section {
            flex: 1;
            margin-right: 20px;
        }

        .contact-info {
            flex: 1;
        }

        h2 {
            font-size: 36px;
            margin-bottom: 20px;
            text-align: center;
            color: #000;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input, textarea {
            font-size: 16px;
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #ffffff;
            color: #687c94;
        }

        button {
            padding: 15px;
            font-size: 16px;
            background-color: #7848f4;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #563ebf;
        }

        .contact-info div {
            margin-bottom: 30px;
        }

        .contact-info div h3 {
            margin-bottom: 10px;
            font-size: 24px;
            color: #000;
        }

        .contact-info div p {
            font-size: 16px;
            color: #687c94;
            margin: 0;
        }

        .contact-info div p a {
            color: #7848f4;
            text-decoration: none;
        }

        footer p {
            margin: 10px 0;
            font-size: 14px;
            color: #687c94;
        }

        footer img {
            width: 24px;
            height: 24px;
            margin: 0 10px;
        }

        .logo {
            font-size: 24px;
            color: #ffffff;
            font-weight: bold;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #7848f4; /* Updated color */
            padding: 14px 20px;
        }

        nav a {
            color: #ffffff;
            text-decoration: none;
            padding: 14px 20px;
            font-size: 18px;
        }

        nav a:hover {
            background-color: #ffffff;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <nav>
        <div class="logo">Event Wave</div>
        <div>
            <a href="index.jsp">Home</a>
            <a href="about.jsp">About Us</a>
            <a href="contact.jsp">Contact Us</a>
        </div>
    </nav>
    
    <header>
        <div class="container">
            <h1>Contact Event Wave</h1>
            <p>We bring <strong>dream events</strong> to life!</p>
        </div>
    </header>

    <div class="container">
        <!-- Content Section -->
        <div class="content">
            <!-- Contact Form -->
            <section class="form-section">
                <h2>Say Hello!</h2>
                <form action="submitContactForm.jsp" method="post">
                    <input type="text" name="fullName" placeholder="Full Name" required>
                    <input type="text" name="contactNumber" placeholder="Contact Number" required>
                    <input type="email" name="emailAddress" placeholder="Email Address" required>
                    <textarea name="message" placeholder="Enter Your Message" required></textarea>
                    <button type="submit">Submit</button>
                </form>
            </section>

            <!-- Additional Contact Information -->
            <section class="contact-info">
                <div>
                    <h3>General Inquiries</h3>
                    <p>If you have any general questions about our services or how to use our platform, feel free to reach out to us. We aim to respond to all inquiries within 24 hours at <a href="mailto:info@eventwave.com"> info@eventwave.com</a>.</p>
                </div>
                
                <div>
                    <h3>Vendors</h3>
                    <p> If you're a vendor looking to collaborate or showcase your service on our platform, contact us at <a href="mailto:vendors@eventwave.com">vendors@eventwave.com</a>.</p>
                </div>

                <div>
                    <h3>Marketing Collaborations</h3>
                    <p>For marketing collaborations, sponsorships, or media inquiries, please contact our marketing team. We’re always excited to explore new opportunities to expand our brand at <a href="mailto:partnerships@eventwave.com">partnerships@eventwave.com</a>.</p>
                </div>

                <div>
                    <h3>Careers</h3>
                    <p>Interested in joining our team? Explore career opportunities with us at <a href="mailto:hr@eventwave.com">hr@eventwave.com</a>.</p>
                </div>

                <div>
                    <h3>Customer Support</h3>
                    <p>Our customers are our top priority. If you need help with your event planning or have feedback about our platform, our customer support team is here to assist you <a href="mailto:support@eventwave.com">support@eventwave.com</a>.</p>
                </div>
            </section>
        </div>
    </div>

    <footer>
        <div class="container">
            <p>&copy; 2024 Event Management System. All rights reserved.</p>
            <p>Follow us on:</p>
            <a href="#"><img src="facebook-icon.png" alt="Facebook"></a>
            <a href="#"><img src="twitter-icon.png" alt="Twitter"></a>
            <a href="#"><img src="instagram-icon.png" alt="Instagram"></a>
            <a href="#"><img src="linkedin-icon.png" alt="LinkedIn"></a>
        </div>
    </footer>
</body>
</html>
