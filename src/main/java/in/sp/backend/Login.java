package in.sp.backend;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import in.sp.dao.UserDAO;
import in.sp.dao.impl.UserDAOImpl;
import in.sp.model.UserModel;

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
        String myemail = request.getParameter("email1");
        String mypass = request.getParameter("pass1");

        try {
            UserModel user = userDAO.getUserByEmailAndPassword(myemail, mypass);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("session_user", user);

                // Redirect to profile page
                response.sendRedirect("profile.jsp");
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
