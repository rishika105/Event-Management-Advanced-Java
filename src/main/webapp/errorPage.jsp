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
	align-items: center; /* Ensures vertical alignment */
	padding: 20px;
}

.logo {
	font-size: 26px;
	font-weight: bold;
	color: #000;
}

.highlight {
	color: #6A3DF0;
}

.nav-links {
	display: flex;
	align-items: center;
}

.nav-links a {
	margin-left: 26px;
	text-decoration: none;
	color: #6A3DF0;
	padding: 10px 15px; /* Optional: Adds padding to links */
}

.nav-links .signup-btn {
	background-color: #6A3DF0;
	color: white;
	padding: 10px 20px;
	border-radius: 5px;
	margin-left: 20px;
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
	margin-top: 40px; /* Adds space between Oops! and the text */
}

.btn {
	display: inline-block;
	padding: 15px 30px;
	margin-top: 40px;
	/* Adds space between the text and the Back to Homepage button */
	background-color: #6A3DF0;
	color: white;
	text-decoration: none;
	border-radius: 5px;
}

.follow-us-text {
	margin-top: 30px;
	font-size: 18px;
	color: #333;
	font-weight: bold;
}

.social-media {
	margin-top: 20px;
	/* Adds space between 'Follow us on' and the social media icons */
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

.footer {
	background-color: #0A0F34;
	color: white;
	padding: 20px 30px;
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
	max-width: 400px;
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
	border-radius: 5px;
	margin-left: 10px;
	display: inline-block;
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
			<h1 class="logo">
				Event <span class="highlight">Wave</span>
			</h1>
			<nav class="nav-links">
				<a href="#" class="login-btn">Login</a> <a href="#"
					class="signup-btn">Signup</a>
			</nav>
		</header>

		<main class="error-section">
			<div class="error-image">
				<img src="assets/error page.png" alt="404">
			</div>
			<h2>Oops!</h2>
			<h1>Access Denied!</h1>
			<p>You do not have permission to access this page.</p>
			<p>
				<a href="login.jsp">Click here to log in</a>
			</p>
			<p>We can't seem to find the page you are looking for</p>
			<a href="index.html" class="btn">Back to Homepage</a>

			<div class="follow-us-text">Follow us on</div>

			<!-- Social Media Icons -->
			<div class="social-media">
				<a href="#"><img src="assets/instagramicon.jfif" alt="Instagram"></a>
				<a href="#"><img src="assets/facebook.png" alt="Facebook"></a>
				<a href="#"><img src="assets/linkedin.png" alt="LinkedIn"></a>
				<a href="#"><img src="assets/twitter.png" alt="Twitter"></a> <a
					href="#"><img src="assets/youtube.png" alt="YouTube"></a>
			</div>
		</main>

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
					<a href="#">English</a> <a href="#">French</a> <a href="#">Hindi</a>
				</div>

				<div class="footer-note">
					<p>Non Copyrighted © 2023 Upload by rich technologies</p>
				</div>
			</div>
		</footer>
	</div>