package in.sp.backend;

import java.io.IOException;

import in.sp.util.EmailSender;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FeedbackServlet")
public class Feedback extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String userName = request.getParameter("name");
        String userEmail = request.getParameter("email");
        String feedback = request.getParameter("feedback");

        // Validate form data (basic validation)
        if (userName == null || userEmail == null || feedback == null ||
            userName.trim().isEmpty() || userEmail.trim().isEmpty() || feedback.trim().isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("/feedback.jsp").forward(request, response);
            return;
        }

        // Send feedback email
        try {
            EmailSender.sendFeedbackEmail(userName, userEmail, feedback);
            request.setAttribute("message", "Feedback sent to admin successfully!");
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
            request.setAttribute("error", "Failed to send feedback. Please try again later.");
        }

        // Forward to feedback.jsp
        request.getRequestDispatcher("/feedback.jsp").forward(request, response);
    }
}
