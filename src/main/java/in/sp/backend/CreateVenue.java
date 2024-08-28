package in.sp.backend;

import java.io.File;
import java.io.IOException;
import in.sp.dao.EventDAO;
import in.sp.model.Event;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/insertEvent")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class CreateVenue extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "assets"; // Directory for uploaded images

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleInsertOrUpdate(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equalsIgnoreCase(action)) {
            handleDelete(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }

    private void handleInsertOrUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String venueName = request.getParameter("venue_name");
        String location = request.getParameter("location");
        String time = request.getParameter("time");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));

        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String imagePath = "";
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            if (fileName != null && !fileName.isEmpty()) {
                imagePath = UPLOAD_DIRECTORY + File.separator + fileName;
                part.write(uploadPath + File.separator + fileName);
            }
        }

        EventDAO eventDAO = new EventDAO();

        String eventIdParam = request.getParameter("eventId");
        int eventId = eventIdParam != null && !eventIdParam.isEmpty() ? Integer.parseInt(eventIdParam) : 0;

        if (eventId > 0) {
            // Update existing event
            eventDAO.updateEvent(eventId, venueName, location, time, description, price, imagePath);
        } else {
            // Insert new event
            Event event = new Event();
            event.setVenueName(venueName);
            event.setLocation(location);
            event.setTime(time);
            event.setDescription(description);
            event.setPrice(price);
            event.setImagePath(imagePath);
            eventDAO.insertEvent(event);
        }

        response.sendRedirect("venueTypes.jsp");
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String eventIdStr = request.getParameter("eventId");
            int eventId = Integer.parseInt(eventIdStr);
            System.out.println("Deleting event with ID: " + eventId);
            EventDAO eventDAO = new EventDAO();
            eventDAO.deleteEvent(eventId);
            response.sendRedirect("venueTypes.jsp"); // Redirect to eventFront.jsp after deletion
        } catch (NumberFormatException e) {
            System.out.println("Invalid event ID: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid event ID.");
        }
    }


    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1).replace("\"", "");
            }
        }
        return "";
    }
}