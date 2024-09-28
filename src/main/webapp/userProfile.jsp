<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - Event Wave</title>
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
  .logo a {
            text-decoration: none;
            color: inherit;
        }
        .sidebar-menu {
            list-style: none;
            padding: 0;
            margin: 0;
            flex-grow: 1;
        }

        .sidebar-menu a {
            display: block;
            margin: 20px 0;
            color: white;
            font-size: 18px;
            cursor: pointer;
            text-decoration: none;
            display: flex;
            align-items: center;
            padding: 10px 0;
        }

        .sidebar-menu a i {
            margin-right: 10px;
        }

        .sidebar-menu a.active {
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
            margin-top: 20px;
            height: 180px;
            width: 180px;
            border-radius: 50%;
            background-image: url('assets/unknown.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin-left: 700px;
        }

        .header {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .profile-form {
            margin-left: 60px;
            margin-top: -230px;
        }

        .form-group {
            margin-bottom: 20px;
            max-width: 300px;
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
            justify-content: flex-end;
            gap: 10px;
            margin-top: 20px;
            max-width: 550px;
        }

        .edit-btn {
            padding: 10px 20px;
            background-color: #ffffff;
            color: #000000;
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

        /* Logout Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            width: 300px;
            text-align: center;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
        }

        .modal-content h2 {
            margin-bottom: 20px;
        }

        .modal-content button {
            padding: 10px 20px;
            margin: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .logout-btn {
            background-color: #7848f4;
            color: white;
        }

        .cancel-btn {
            background-color: #ccc;
        }
    </style>
</head>

<body>

    <div class="profile-edit-container">
        <div class="sidebar">
            <div class="sidebar-header">
               <div class="logo">
    <a href="index.jsp">Event <span class="wave">Wave</span></a>
</div>

            </div>
            <ul class="sidebar-menu">
                <a href="#" class="active"><i class="fas fa-user"></i> Profile</a>
                <a href="venueTypesUser.jsp"><i class="fas fa-calendar-alt"></i> Events</a>
                <a href="bookingHistory.jsp"><i class="fas fa-book"></i> Booking History</a>
                <a href="feedback.jsp"><i class="fas fa-envelope"></i> Feedback</a>
                <a href="javascript:void(0);" onclick="openLogoutModal()"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </ul>
        </div>
        <div class="main-content">
            <div class="profile-picture">
            </div>

            <form class="profile-form" action="updateProfile" method="post">
                <h1 class="heading">User Profile</h1> <br>

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

    <!-- Logout Modal -->
    <div id="logoutModal" class="modal">
        <div class="modal-content">
            <h2>Confirm Logout</h2>
            <p>Are you sure you want to logout?</p>
            <button class="logout-btn" onclick="confirmLogout()">Logout</button>
            <button class="cancel-btn" onclick="closeLogoutModal()">Cancel</button>
        </div>
    </div>

    <script>
        function enableEditing() {
            document.querySelectorAll('.profile-form input').forEach(input => {
                input.removeAttribute('readonly');
            });
            document.querySelector('.update-btn').disabled = false;
        }

        function openLogoutModal() {
            document.getElementById('logoutModal').style.display = 'flex';
        }

        function closeLogoutModal() {
            document.getElementById('logoutModal').style.display = 'none';
        }

        function confirmLogout() {
            // Perform logout action (e.g., redirect to logout page)
            window.location.href = 'logout3'; // Replace with your logout URL
        }
    </script>

</body>

</html>
