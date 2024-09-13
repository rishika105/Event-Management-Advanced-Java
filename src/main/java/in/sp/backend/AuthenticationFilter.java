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

    // Admin credentials (store securely in a configuration file or environment variables)
    private static final String ADMIN_EMAIL = "admi2n106@gmail.com";
    private static final String ADMIN_PASSWORD = "event@8910013793";

    // Admin page URLs (store in a configuration file or database for better maintainability)
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

        // Log session and request details
        System.out.println("Session Attributes:");
        System.out.println("Email: " + userEmail);
        System.out.println("Password: " + userPassword);
        System.out.println("Request URI: " + httpRequest.getRequestURI());

        // Get the requested URL
        String requestURI = httpRequest.getRequestURI();

        // Check if the request is for an admin page
        boolean isAdminPage = isAdminPage(requestURI);

        System.out.println("Is Admin Page: " + isAdminPage);

        if (loggedIn) {
            // Admin-only access logic
            if (isAdminPage) {
                // Check if the logged-in user is the admin
                if (isAdmin(userEmail, userPassword)) {
                    System.out.println("Admin access granted.");
                    chain.doFilter(request, response); // Admin user, allow access
                } else {
                    // Non-admin user, restrict access
                    System.out.println("Admin access denied. Redirecting to unauthorized page.");
                    httpResponse.sendRedirect("unauthorized.jsp");
                }
            } else {
                // For non-admin pages, allow access for all logged-in users
                System.out.println("Non-admin page access granted.");
                chain.doFilter(request, response);
            }
        } else {
            // If not logged in, redirect to the error page or login page
            System.out.println("User not logged in. Redirecting to error page.");
            httpResponse.sendRedirect("errorPage.jsp");
        }
    }

    private boolean isAdminPage(String requestURI) {
        // Loop through the array of admin pages and check if the requested URI matches any admin page
        for (String adminPage : ADMIN_PAGES) {
            if (requestURI.contains(adminPage)) {
                return true;
            }
        }
        return false;
    }

    private boolean isAdmin(String userEmail, String userPassword) {
        System.out.println("Admin Credentials:");
        System.out.println("Email: " + ADMIN_EMAIL);
        System.out.println("Password: " + ADMIN_PASSWORD);

        return ADMIN_EMAIL.equals(userEmail) && ADMIN_PASSWORD.equals(userPassword);
    }
}
