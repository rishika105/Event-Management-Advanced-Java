package in.sp.backend;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import in.sp.dao.UserDAO;
import in.sp.dao.impl.UserDAOImpl;
import in.sp.model.UserModel;

@WebServlet("/regForm3")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public Register() {
        super();
        userDAO = new UserDAOImpl(); // Initialize DAO
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        
        String myname = request.getParameter("name1");
        String myemail = request.getParameter("email1");
        String mypass = request.getParameter("pass1");
        String mygender = request.getParameter("gender1");
        String mycity = request.getParameter("city1");

        UserModel user = new UserModel();
        user.setName(myname);
        user.setEmail(myemail);
        user.setPassword(mypass);
        user.setGender(mygender);
        user.setCity(mycity);

        try {
            boolean isRegistered = userDAO.registerUser(user);
            if (isRegistered) {
                // Redirect to login page with success message as a query parameter
//                response.sendRedirect("login.jsp?message=User Registered Successfully!");
                request.setAttribute("message", "User Registered Successfully!");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "User Not Registered");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Exception: " + e.getMessage());
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
}
