<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile - Event Wave</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Product Sans', sans-serif;
            background-color: #ffffff;
            color: #131315;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            overflow: hidden;
        }

        .profile-edit-container {
            display: flex;
            width: 100%;
            height: 100%;
        }

        .sidebar {
            background-color: #7848f4;
            width: 250px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100vh;
        }

        .sidebar-header {
            text-align: center;
        }

        .logo {
            font-size: 25px;
            color: white;
            font-weight: bold;
            margin-bottom: 40px;
        }

        .sidebar-menu {
            list-style: none;
            padding: 0;
            margin: 0;
            flex-grow: 1;
        }

        .sidebar-menu li {
            margin: 20px 0;
            color: white;
            font-size: 18px;
            cursor: pointer;
            display: flex;
            align-items: center;
        }

        .sidebar-menu li i {
            margin-right: 10px;
        }

        .sidebar-menu li.active {
            font-weight: bold;
            background-color: #563ebf;
            padding: 10px;
            border-radius: 5px;
        }

        .main-content {
    padding: 40px;
    background-color: #f5f5f5;
    flex: 1;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    overflow-y: auto;
    position: relative;
}

.profile-picture {
    position: absolute;
    top: 80px;
    right: 230px;
    width: 250px;
    height: 250px;
    border-radius: 50%;
    background-image: url('${pageContext.request.contextPath}/assests/admin profile 2.jpeg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}
        

        .header {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .profile-form{
        margin-left: 180px;
        }

        .form-group {
            margin-bottom: 30px;
            max-width: 400px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .form-group input {
            width: 180%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .button-group {
            display: flex;
            justify-content: flex-end; /* Aligns buttons to the right */
            gap: 10px; /* Adds space between the buttons */
            margin-top: 20px; /* Adds space above the buttons */
            max-width: 700px; /* Align with the form fields */
        }

        .edit-btn {
           padding: 10px 20px;
           background-color: #ffffff;
           color: #000000; /* Changed text color to black */
        
           border-radius: 4px;
           cursor: pointer;
        }
        

        .update-btn {
            padding: 10px 20px;
            background-color: #7848f4;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .update-btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
        
       
    </style>
</head>
<body>
    <div class="profile-edit-container">
        <div class="sidebar">
            <div class="sidebar-header">
                <div class="logo">Event Wave</div>
            </div>
            <ul class="sidebar-menu">
                <li class="active"><i class="fas fa-user"></i> Profile</li>
                <li><i class="fas fa-calendar-alt"></i> Create Event</li>
                <li><i class="fas fa-envelope"></i> Events</li>
                <li><i class="fas fa-book"></i> All Bookings</li>
                <li><i class="fas fa-sign-out-alt"></i> Logout</li>
            </ul>
        </div>

        <div class="main-content">
            <form class="profile-form" action="updateProfile" method="post">
                <h1 class = "heading">Admin Profile</h1> <br>
                
                 <div class="profile-picture"></div> <!-- Profile Image Container -->

                <div class="form-group">
                    <label for="Name">Name</label>
                    <input type="text" id="Name" name="Name" value="${user.Name}" required>
                </div>

                <div class="form-group">
                    <label for="Username">Username</label>
                    <input type="text" id="Username" name="Username" value="${user.Username}" required>
                </div>

                <div class="form-group">
                    <label for="gender">Gender</label>
                    <input type="text" id="gender" name="gender" value="${user.gender}" readonly>
                </div>

                <div class="form-group">
                    <label for="city">City</label>
                    <input type="text" id="city" name="city" value="${user.city}" required>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" value="${user.password}" required>
                </div>

                <div class="button-group">
                    <button type="button" class="edit-btn" onclick="enableEditing()">Edit</button>
                    <button type="submit" class="update-btn" disabled>Update</button>
                </div>
            </form>
           
        </div>
    </div>

    <script>
        function enableEditing() {
            document.querySelectorAll('.profile-form input').forEach(input => {
                input.removeAttribute('readonly');
            });
            document.querySelector('.update-btn').disabled = false;
        }
    </script>

</body>
</html>
