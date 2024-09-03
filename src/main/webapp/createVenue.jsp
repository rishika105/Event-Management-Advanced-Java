<%@ page import="in.sp.model.Event"%>
<%@ page import="in.sp.dao.EventDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Create Event</title>
<link rel="stylesheet" href="styles.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f8f8;
	color: #333;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.container {
	width: 100%;
	max-width: 720px;
	margin: 50px auto;
	background-color: #fff;
	padding: 40px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	border-radius: 15px;
	box-sizing: border-box; /* Include padding and border in width */
}
        .logo {
            position: absolute;
            top: 20px;
            left: 30px;
            font-size: 25px;
            font-weight: bold;
            color: #000;
            z-index: 10;
        }

        .logo .wave {
            color: #7848f4;
        }

        
h2 {
	text-align: center;
	color: #333;
	font-size: 2em;
	margin-bottom: 20px;
}

form {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

label {
	font-size: 1.1em;
	color: #555;
	font-weight: bold;
}

input, textarea {
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 1em;
	width: 100%;
	box-sizing: border-box;
}

input[type="file"] {
	padding: 0;
	display: none;
}

.file-drop-area {
	position: relative;
	width: 100%; /* Ensure it stays within its parent */
	padding: 30px;
	border: 2px dashed #ddd;
	border-radius: 5px;
	text-align: center;
	cursor: pointer;
	background-color: #f8f8f8;
	transition: background-color 0.3s ease;
	box-sizing: border-box; /* Include padding and border in width */
	margin: 0; /* Remove any default margin */
}

.file-drop-area:hover {
	background-color: #e6e6e6;
}

.file-drop-area img {
	max-width: 100%;
	max-height: 200px; /* Set a maximum height */
	width: auto; /* Maintain aspect ratio */
	height: auto;
	display: none;
	margin-top: 20px;
	border-radius: 5px;
}

button {
	padding: 15px;
	background-color: #6a5acd;
	border: none;
	border-radius: 5px;
	color: white;
	font-size: 1.2em;
	cursor: pointer;
	width: 100%;
}

button:hover {
	background-color: #483d8b;
}

.file-drop-area span {
	color: #999;
	font-size: 1em;
}

#additional-charges-message {
	color: #555;
	font-size: 0.9em;
	display: none;
}
</style>
</head>
<body>
	<%
	// Initialize variables for event details
	String eventId = request.getParameter("eventId");
	EventDAO eventDAO = new EventDAO();
	Event event = null;

	// Check if an event ID is provided to edit an existing event
	if (eventId != null && !eventId.trim().isEmpty()) {
		try {
			event = eventDAO.getEventById(Integer.parseInt(eventId));
		} catch (NumberFormatException e) {
			event = null; // Handle invalid eventId scenario
			System.out.println("Invalid eventId provided: " + e.getMessage());
		} catch (Exception e) {
			event = null;
			System.out.println("Error fetching event: " + e.getMessage());
		}
	}
	%>
  <div class="logo">
            Event <span class="wave">Wave</span>
        </div>
	<div class="container">
		<h2><%=(event != null) ? "Edit Event" : "Create New Event"%></h2>
		<form action="insertEvent" method="post" enctype="multipart/form-data">
			<!-- Hidden input to store event ID if editing -->
			<input type="hidden" name="eventId"
				value="<%=(event != null) ? event.getEventId() : ""%>">

			<!-- Event title input, pre-filled if editing -->
			<label for="venue_name">Venue Name:</label> <input type="text"
				id="venue_name" name="venue_name"
				value="<%=(event != null) ? event.getVenueName() : ""%>"
				required>

			<!-- Other form fields -->
			<label for="location">Location:</label> <input type="text"
				id="location" name="location"
				value="<%=(event != null) ? event.getLocation() : ""%>" required>

			<label for="time">Time:</label> <input type="text" id="time"
				name="time" placeholder="e.g., 2:00pm-5:00pm, 6:00pm-9:00pm"
				value="<%=(event != null) ? event.getTime() : ""%>" required>

			<label for="description">Description:</label>
			<textarea id="description" name="description" required><%=(event != null) ? event.getDescription() : ""%></textarea>

			<label for="price">Price:</label> <input type="number" id="price"
				name="price" value="<%=(event != null) ? event.getPrice() : ""%>"
				required oninput="showAdditionalChargesMessage()">
			<p id="additional-charges-message">You may pay additional charges
				for transportation and food.</p>

			<label for="eventImage">Event Image</label>
			<div class="file-drop-area" id="file-drop-area">
				<span>Drag and drop your image here or click to select</span> <input
					type="file" name="eventImage" id="eventImage" accept="image/*">
				<img id="preview" alt="Image Preview">
			</div>

			<button type="submit"><%=(event != null) ? "Update Event" : "Create Event"%></button>
		</form>
	</div>
	<script>
    // JavaScript for file upload and additional charges message
    const fileDropArea = document.getElementById('file-drop-area');
    const fileInput = document.getElementById('eventImage');
    const preview = document.getElementById('preview');

    fileDropArea.addEventListener('click', () => {
        fileInput.click();
    });

    fileInput.addEventListener('change', (event) => {
        handleFiles(event.target.files);
    });

    fileDropArea.addEventListener('dragover', (event) => {
        event.preventDefault();
        fileDropArea.classList.add('dragover');
    });

    fileDropArea.addEventListener('dragleave', () => {
        fileDropArea.classList.remove('dragover');
    });

    fileDropArea.addEventListener('drop', (event) => {
        event.preventDefault();
        fileDropArea.classList.remove('dragover');
        handleFiles(event.dataTransfer.files);
    });

    function handleFiles(files) {
        const file = files[0];
        if (file) {
            preview.src = URL.createObjectURL(file);
            preview.style.display = 'block';
        }
        fileInput.files = files;
    }
    
    function showAdditionalChargesMessage() {
        const priceField = document.getElementById('price');
        const additionalChargesMessage = document.getElementById('additional-charges-message');
        
        if (priceField.value > 0) {
            additionalChargesMessage.style.display = 'block';
        } else {
            additionalChargesMessage.style.display = 'none';
        }
    }
</script>
</body>
</html>