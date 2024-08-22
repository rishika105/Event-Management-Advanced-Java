package in.sp.backend;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.logging.Logger;
import in.sp.dao.UserDAO;
import in.sp.dao.impl.UserDAOImpl;
import in.sp.model.UserModel;

@WebServlet("/updateProfile")
public class UpdateUser extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    private static final Logger logger = Logger.getLogger(UpdateUser.class.getName());

    public UpdateUser() {
        super();
        userDAO = new UserDAOImpl(); // Initialize DAO
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        // Retrieve parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password"); // Consider hashing this before storing
        String gender = request.getParameter("gender");
        String city = request.getParameter("city");

        // Determine if the user is an admin based on email (consider using a better method)
        boolean isAdmin = email.equals("admi2n106@gmail.com");

        UserModel user = new UserModel();
        // Assuming id is an integer field in UserModel
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password); // Consider using a password hashing algorithm
        user.setGender(gender);
        user.setCity(city);

        try {
            boolean isUpdated = userDAO.updateUser(user);
            if (isUpdated) {
                request.setAttribute("message", "Profile updated successfully!");
                request.setAttribute("user", user); // to repopulate the form with updated values
                String redirectPage = isAdmin ? "/adminProfile.jsp" : "/userProfile.jsp";
                request.getRequestDispatcher(redirectPage).forward(request, response);
            } else {
                request.setAttribute("error", "Profile update failed!");
                String redirectPage = isAdmin ? "/adminProfile.jsp" : "/userProfile.jsp";
                request.getRequestDispatcher(redirectPage).forward(request, response);
            }
        } catch (Exception e) {
            logger.severe("Exception while updating user profile: " + e.getMessage());
            request.setAttribute("error", "Exception: " + e.getMessage());
            String redirectPage = isAdmin ? "/adminProfile.jsp" : "/userProfile.jsp";
            request.getRequestDispatcher(redirectPage).forward(request, response);
        }
    }
}