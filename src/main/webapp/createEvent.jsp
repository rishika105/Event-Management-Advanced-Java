<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="in.sp.dao.EventDAO" %>
<%@ page import="in.sp.model.Event" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Event</title>
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
            max-width: 900px;
            margin: 50px auto;
            background-color: #fff;
            padding: 40px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
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
            width: 100%;
            padding: 30px;
            border: 2px dashed #ddd;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            background-color: #f8f8f8;
            transition: background-color 0.3s ease;
        }
        .file-drop-area:hover {
            background-color: #e6e6e6;
        }
        .file-drop-area img {
            max-width: 100%;
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
    </style>
</head>
<body>
    <div class="container">
        <h2>Create Event</h2>
        <form action="InsertEventServlet3" method="post" enctype="multipart/form-data">
            <label for="eventTitle">Event Title</label>
            <input type="text" name="eventTitle" id="eventTitle" required>
            
            <label for="eventVenue">Event Venue</label>
            <input type="text" name="eventVenue" id="eventVenue" required>
            
            <label for="eventImage">Event Image</label>
            <div class="file-drop-area" id="file-drop-area">
                <span>Drag and drop your image here or click to select</span>
                <input type="file" name="eventImage" id="eventImage" accept="image/*">
                <img id="preview" alt="Image Preview">
            </div>
            
            <label for="eventDescription">Event Description</label>
            <textarea name="eventDescription" id="eventDescription" rows="5" required></textarea>
            
            <button type="submit">Create Event</button>
        </form>
    </div>

    <script>
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
    </script>
</body>
</html>
