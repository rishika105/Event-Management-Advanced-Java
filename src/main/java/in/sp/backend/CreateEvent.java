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
public class CreateEvent extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "assets"; // Updated directory

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String location = request.getParameter("location");
        String time = request.getParameter("time");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");

        if (title == null || location == null || time == null || description == null || priceStr == null) {
            throw new ServletException("Missing form parameters");
        }

        double price;
        try {
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            throw new ServletException("Invalid price format", e);
        }

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

        Event event = new Event();
        event.setTitle(title);
        event.setLocation(location);
        event.setTime(time);
        event.setDescription(description);
        event.setPrice(price);
        event.setImagePath(imagePath);

        EventDAO eventDAO = new EventDAO();
        eventDAO.insertEvent(event);

        response.sendRedirect("eventTypes.jsp");
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
