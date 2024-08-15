package in.sp.backend;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AuthenticationFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code if needed
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        boolean loggedIn = (session != null) && (session.getAttribute("session_user") != null);

        if (loggedIn) {
            chain.doFilter(request, response); // User is logged in, continue request
        } else {
            httpResponse.sendRedirect("login.jsp"); // Redirect to login page if not logged in
        }
        
       
    }

    public void destroy() {
        // Cleanup code if needed
    }
}
