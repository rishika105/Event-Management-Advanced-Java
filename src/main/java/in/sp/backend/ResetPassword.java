package in.sp.backend;

import java.io.IOException;
import java.sql.SQLException;

import in.sp.dao.UserDAO;
import in.sp.dao.impl.UserDAOImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/reset-password3")
public class ResetPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public ResetPassword() {
        super();
        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle the GET request by displaying the reset password form
        RequestDispatcher rd = request.getRequestDispatcher("/reset_password.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Simple validation check for password and confirm password
        if (newPassword == null || newPassword.isEmpty() || confirmPassword == null || confirmPassword.isEmpty()) {
            request.setAttribute("error", "Password fields cannot be empty.");
            RequestDispatcher rd = request.getRequestDispatcher("/reset_password.jsp");
            rd.forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            RequestDispatcher rd = request.getRequestDispatcher("/reset_password.jsp");
            rd.forward(request, response);
            return;
        }

        try {
            // Validate the token
            boolean isValidToken = userDAO.isValidToken(token);
            if (isValidToken) {
                // Update the password
                boolean isUpdated = userDAO.updatePassword(token, newPassword);
                if (isUpdated) {
                    // Redirect to login page with a success message
                    request.setAttribute("message", "Your Password Reset Successfully!");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Failed to reset password.");
                    RequestDispatcher rd = request.getRequestDispatcher("/reset_password.jsp");
                    rd.forward(request, response);
                }
            } else {
                request.setAttribute("error", "Invalid or expired token.");
                RequestDispatcher rd = request.getRequestDispatcher("/reset_password.jsp");
                rd.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while processing your request.");
            RequestDispatcher rd = request.getRequestDispatcher("/reset_password.jsp");
            rd.forward(request, response);
        }
    }
}
