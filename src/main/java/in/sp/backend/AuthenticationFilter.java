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

    // Admin credentials (for this example, hardcoded)
    private static final String ADMIN_EMAIL = "admi2n106@gmail.com";
    private static final String ADMIN_PASSWORD = "event@8910013793";

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

        // Get the requested URL
        String requestURI = httpRequest.getRequestURI();

        // Check if the request is for admin pages
        boolean isAdminPage = requestURI.contains("adminProfile.jsp") || requestURI.contains("createVenue.jsp")
                || requestURI.contains("allBookings.jsp") || requestURI.contains("venueTypes.jsp");

        if (loggedIn) {
            // Admin-only access logic
            if (isAdminPage) {
                // Check if the logged-in user is the admin
                if (ADMIN_EMAIL.equals(userEmail) && ADMIN_PASSWORD.equals(userPassword)) {
                    chain.doFilter(request, response); // Admin user, allow access
                } else {
                    // Non-admin user, restrict access
                    httpResponse.sendRedirect("unauthorized.jsp");
                }
            } else {
                // For non-admin pages, allow access for all logged-in users
                chain.doFilter(request, response);
            }
        } else {
            // If not logged in, redirect to the error page or login page
            httpResponse.sendRedirect("errorPage.jsp");
        }
    }

    public void destroy() {
        // Cleanup code if needed
    }
}
