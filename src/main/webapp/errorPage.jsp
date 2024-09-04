<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Page Not Found</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #F8F8F8;
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .container {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        header {
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }

        .logo {
            font-size: 25px;
            font-weight: bold;
            color: #000;
        }

        .highlight {
            color: #6A3DF0;
        }

        .nav-links a {
            margin-left: 20px;
            text-decoration: none;
            color: #6A3DF0;
        }

        .nav-links .signup-btn {
            background-color: #6A3DF0;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
        }

        .error-section {
            text-align: center;
            padding: 50px 20px;
        }

        .error-image img {
            max-width: 20%;
            height: auto;
        }

        h2 {
            font-size: 32px;
            margin: 20px 0;
        }

        p {
            font-size: 18px;
            color: #777;
        }

        .btn {
            display: inline-block;
            padding: 15px 30px;
            margin-top: 20px;
            background-color: #6A3DF0;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            
        }

        /* Footer Styles */
        .footer {
            background-color: #0A0F34;
            color: white;
            padding: 30px 30px;
            text-align: center;
        }

        .footer .logo {
            font-size: 25px;
            font-weight: bold;
            color: white;
        }

        .footer .highlight {
            color: #6A3DF0;
        }

        .footer .newsletter {
            margin: 30px 0;
        }

        .footer .newsletter form {
            display: flex;
            justify-content: center;
            max-width: 300px;
            margin: 0 auto;
        }

        .footer .newsletter input {
            flex: 1;
            padding: 10px;
            border: none;
            border-radius: 5px 0 0 5px;
        }

        .footer .newsletter button {
            padding: 10px 20px;
            background-color: #6A3DF0;
            color: white;
            border: none;
            border-radius: 0 5px 5px 0;
        }

        .footer .social-media {
            margin: 10px 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .footer .social-media img {
            width: 20px;
            height: 20px;
            margin: 0 10px;
            transition: transform 0.3s ease;
        }

        .footer .social-media a:hover img {
            transform: scale(1.1);
        }

        .footer .language-links {
            margin: 20px 0;
            display: flex;
            justify-content: center;
        }

        .footer .language-links a {
            margin: 0 10px;
            color: white;
            text-decoration: none;
            background-color: #6A3DF0;
            padding: 5px 10px;
            border-radius: 5px;
            text-align: left;
        }

        .footer .footer-note {
            text-align: right;
            margin-top: 20px;
            font-size: 14px;
            color: #AAA;
        }

        .social-media {
            margin-top: 30px;
            display: flex;
            justify-content: center;
        }

        .social-media img {
            width: 30px;
            height: 30px;
            margin: 0 10px;
            transition: transform 0.3s ease;
        }

        .social-media a:hover img {
            transform: scale(1.1);
        }
    </style>
</head>

<body>
    <div class="container">
        <header>
            <h1 class="logo">Event <span class="highlight">Wave</span></h1>
            <nav class="nav-links">
                <a href="#" class="login-btn">Login</a>
                <a href="#" class="signup-btn">Signup</a>
            </nav>
        </header>
        <main class="error-section">
            <div class="error-image">
                <img src="assets/error page.png" alt="404">
            </div>
            <h2>Oops!</h2>
            <p>We can't seem to find the page you are looking for</p>
            <a href="index.html" class="btn">Back to Homepage</a>
            
            <!-- Social Media Icons -->
            <div class="social-media">
                <a href="#"><img src="assets/instagramicon.jfif" alt="Instagram"></a>
                <a href="#"><img src="assets/facebook.png" alt="Facebook"></a>
                <a href="#"><img src="assets/linkedin.png" alt="LinkedIn"></a>
                <a href="#"><img src="assets/twitter.png" alt="Twitter"></a>
                <a href="#"><img src="assets/youtube.png" alt="YouTube"></a>
            </div>
        </main>

        <!-- Footer Section -->
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

            <div class="language-links">
                <a href="#">English</a>
                <a href="#">French</a>
                <a href="#">Hindi</a>
            </div>

            <div class="footer-note">
                <p>Non Copyrighted © 2023 Upload by rich technologies</p>
            </div>
        </footer>
    </div>
</body>

</html>
