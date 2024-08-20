package in.sp.backend;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.SQLException;
import in.sp.dao.EventDAO;
import in.sp.model.Event;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/InsertEventServlet3")
@MultipartConfig
public class CreateEvent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Creating an Event object from the request parameters
        Event event = new Event();
        event.setEventTitle(request.getParameter("eventTitle"));
        event.setEventVenue(request.getParameter("eventVenue"));
        event.setEventDescription(request.getParameter("eventDescription"));

        // Handling the file upload
        Part filePart = request.getPart("eventImage");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "assets";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        filePart.write(uploadPath + File.separator + fileName);

        event.setEventImage(fileName);

        // Call the DAO and insert data into the database
        EventDAO eventDAO = new EventDAO();
        String message;
        try (Connection connection = EventDAO.getConnection()) {
            eventDAO.insertEvent(event);
            message = "Event created successfully!";
        } catch (SQLException | ClassNotFoundException e) {
            // Capture the stack trace as a String
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
            String stackTrace = sw.toString();

            // Set the stack trace as the message to be displayed
            message = "An error occurred while creating the event: <br><pre>" + stackTrace + "</pre>";
        }

        // Forward the request and response to the JSP page with the message
        request.setAttribute("MESSAGE", message);
        request.getRequestDispatcher("eventTypes.jsp").forward(request, response);
    }
}
