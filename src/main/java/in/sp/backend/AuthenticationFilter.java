package in.sp.backend;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AuthenticationFilter implements Filter {

    // Admin credentials (consider storing securely)
    private static final String ADMIN_EMAIL = "admi2n106@gmail.com";
    private static final String ADMIN_PASSWORD = "event@8910013793";

    // Admin page URLs (store in configuration for better maintainability)
    private static final String[] ADMIN_PAGES = {"/adminProfile.jsp", "/createVenue.jsp", "/allBookings.jsp", "/venueTypes.jsp"};

    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code if needed
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        // Check if the user is logged in
        boolean loggedIn = (session != null) && (session.getAttribute("session_user") != null);
        String userEmail = (session != null) ? (String) session.getAttribute("email") : null;
        String userPassword = (session != null) ? (String) session.getAttribute("password") : null;

        // Debug statements to ensure the attributes are set correctly
        System.out.println("Logged In: " + loggedIn);
        System.out.println("User Email: " + userEmail);
        System.out.println("User Password: " + userPassword);

        // Get the requested URL
        String requestURI = httpRequest.getRequestURI();

        // Check if the request is for an admin page
        boolean isAdminPage = isAdminPage(requestURI);
//        System.out.println("Request URI: " + requestURI);
        System.out.println("Is Admin Page: " + isAdminPage);

        if (loggedIn) {
            // Admin-only access logic
            if (isAdminPage) {
                // Check if the logged-in user is the admin
                if (isAdmin(userEmail, userPassword)) {
                    chain.doFilter(request, response); // Admin user, allow access
                } else {
                    // Non-admin user, restrict access to admin pages
//                    System.out.println("Redirecting to unauthorized.jsp");
                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/unauthorized.jsp");
                }
            } else {
                // For non-admin pages, allow access for all logged-in users
                chain.doFilter(request, response);
            }
        } else {
            // If not logged in, redirect to the login page or error page
//            System.out.println("Redirecting to errorPage.jsp");
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/errorPage.jsp");
        }
    }

    // Method to check if the requested URI corresponds to an admin page
    private boolean isAdminPage(String requestURI) {
        for (String adminPage : ADMIN_PAGES) {
            if (requestURI.endsWith(adminPage)) {
                return true;
            }
        }
        return false;
    }

    // Method to check if the current user is an admin
    private boolean isAdmin(String userEmail, String userPassword) {
        return ADMIN_EMAIL.equals(userEmail) && ADMIN_PASSWORD.equals(userPassword);
    }

    public void destroy() {
        // Cleanup code if needed
    }
}
