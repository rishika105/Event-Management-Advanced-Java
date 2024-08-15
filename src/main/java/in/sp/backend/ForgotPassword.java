package in.sp.backend;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;
import java.sql.Timestamp;

import in.sp.dao.UserDAO;
import in.sp.dao.impl.UserDAOImpl;
import in.sp.util.EmailSender;

@WebServlet("/forgot-password3")
public class ForgotPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public ForgotPassword() {
        super();
        userDAO = new UserDAOImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String token = UUID.randomUUID().toString();
        Timestamp expiration = new Timestamp(System.currentTimeMillis() + 3600 * 1000); // 1 hour expiration

        try {
            boolean isUpdated = userDAO.updateResetToken(email, token, expiration);
            if (isUpdated) {
                // Update URL to point to the ResetPassword servlet
                String resetLink = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/reset-password3?token=" + token;
                EmailSender.sendResetEmail(email, resetLink);
                request.setAttribute("message", "Password reset link has been sent to your email.");
            } else {
                request.setAttribute("error", "No account found with that email.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while processing your request.");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/forgot_password.jsp");
        rd.forward(request, response);
    }
}
