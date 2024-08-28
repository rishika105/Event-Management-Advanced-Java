package in.sp.backend;

import java.io.IOException;


import java.sql.SQLException;

import in.sp.dao.UserDAO;
import in.sp.dao.impl.UserDAOImpl;
import in.sp.model.UserModel;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginForm3")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public Login() {
        super();
        userDAO = new UserDAOImpl(); // Initialize DAO
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String myemail = request.getParameter("email1").trim();
        String mypass = request.getParameter("pass1").trim();

        try {
            // Authenticate user using email and password
            UserModel user = userDAO.getUserByEmailAndPassword(myemail, mypass);
            
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("session_user", user); // Store the entire user object in session

                // Check if the user is an admin
                if (myemail.equals("admi2n106@gmail.com") && mypass.equals("event@8910013793")) {
                    // Redirect to admin profile page
                    request.setAttribute("user", user); // Set the user object in request scope
                    request.getRequestDispatcher("/adminProfile.jsp").forward(request, response);
                } else {
                    // Redirect to user profile page
                    request.setAttribute("user", user); // Set the user object in request scope
                    request.getRequestDispatcher("/userProfile.jsp").forward(request, response);

                }
            } else {
                // Set error message and forward to login page
                request.setAttribute("error", "Email or Password is incorrect");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Set error message and forward to login page
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        }
    }
}
