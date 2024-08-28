<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - Event Wave</title>
 <style>
    body {
            font-family: 'Product Sans', sans-serif;
            background-color: #ffffff;
            color: #131315;
            margin: 0;
            padding: 0;
        }

        .profile-edit-container {
            display: flex;
            height: 100vh;
            background-color: #f5f5f5;
        }
         .sidebar {
            background-color: #7848f4;
            width: 250px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            margin-bottom: 40px;
        }

        .sidebar-header {
            text-align: center;
        }

        .logo {
            font-size: 24px;
            color: white;
            font-weight: bold;
            margin-top: 10px;
        }
        
         .sidebar-menu {
            list-style: none;
            padding: 0;
            margin: 0;
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
            background-color: #ffffff;
            flex: 1;
            position: relative;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .profile-picture {
            position: absolute;
            top: -50px;
            right: 40px;
        }
        
         .profile-picture img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            object-fit: cover;
            border: 2px solid #7848f4;
        }

        .profile-form h2 {
            margin-bottom: 30px;
            font-size: 36px;
            font-weight: 500;
            text-align: center;
            color: #000;
        }

        .form-group {
            margin-bottom: 20px;
        }
        
         .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #000;
        }

        .form-group input {
            width: calc(50% - 10px);
            padding: 15px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #ffffff;
            color: #687c94;
        }

        .form-group input[type="password"],
        .form-group input[type="email"] {
            width: 100%;
        }
        
        .button-group {
            display: flex;
            justify-content: flex-end;
            margin-top: 30px;
        }

        .edit-btn, .update-btn {
            padding: 15px 20px;
            font-size: 16px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .edit-btn {
            background-color: #f5f5f5;
            color: #7848f4;
            margin-right: 10px;
        }
        
        .update-btn {
            background-color: #7848f4;
            color: white;
        }

        .update-btn:hover {
            background-color: #563ebf;
        }

        @media (max-width: 768px) {
            .form-group input {
                width: 100%;
            }
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
            <li><i class="fas fa-bell"></i> Events</li>
            <li><i class="fas fa-lock"></i> Booking History</li>
            <li><i class="fas fa-paint-brush"></i> Feedback</li>
            <li><i class="fas fa-question-circle"></i> Logout</li>
        </ul>
    </div>
    <div class="main-content">
        <div class="profile-picture">
            <img src="path_to_profile_picture.png" alt="Profile Picture">
        </div>
        <form class="profile-form" action="updateProfile" method="post">
            <h2>User Profile</h2>
            
            <input type="hidden" id="id" name="id" value="${user.id}">
            
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" value="${user.name}" readonly>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="${user.email}" readonly>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" value="${user.password}" readonly>
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <input type="text" id="gender" name="gender" value="${user.gender}" readonly>
            </div>
            <div class="form-group">
                <label for="city">City</label>
                <input type="text" id="city" name="city" value="${user.city}" readonly>
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