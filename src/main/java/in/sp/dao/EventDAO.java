package in.sp.dao;

import in.sp.model.Event;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EventDAO {
	private static final String DB_URL = System.getenv("DB_URL");
    private static final String DB_USER = System.getenv("DB_USERNAME");
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD");

    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    // Method to get an event by its ID
    public Event getEventById(int id) {
        Event event = null;
        String query = "SELECT * FROM events WHERE eventid = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    event = new Event();
                    event.setEventId(rs.getInt("eventid"));
                    event.setTitle(rs.getString("title"));
                    event.setLocation(rs.getString("location"));
                    event.setTime(rs.getString("time"));
                    event.setDescription(rs.getString("description"));
                    event.setPrice(rs.getDouble("price"));
                    event.setImagePath(rs.getString("imagePath"));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return event;
    }

    // Method to get all events
    public List<Event> getAllEvents() {
        List<Event> events = new ArrayList<>();
        String query = "SELECT * FROM events";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Event event = new Event();
                event.setEventId(rs.getInt("eventid"));
                event.setTitle(rs.getString("title"));
                event.setLocation(rs.getString("location"));
                event.setTime(rs.getString("time"));
                event.setDescription(rs.getString("description"));
                event.setPrice(rs.getDouble("price"));
                event.setImagePath(rs.getString("imagePath"));
                events.add(event);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return events;
    }

    // Method to insert a new event
    public boolean insertEvent(Event event) {
        String query = "INSERT INTO events (title, location, time, description, price, imagePath) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, event.getTitle());
            ps.setString(2, event.getLocation());
            ps.setString(3, event.getTime());
            ps.setString(4, event.getDescription());
            ps.setDouble(5, event.getPrice());
            ps.setString(6, event.getImagePath());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to update an existing event
    public void updateEvent(int eventId, String title, String location, String time, String description, double price, String imagePath) {
        String sql = "UPDATE events SET title = ?, location = ?, time = ?, description = ?, price = ?, imagePath = ? WHERE eventid = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, title);
            pstmt.setString(2, location);
            pstmt.setString(3, time);
            pstmt.setString(4, description);
            pstmt.setDouble(5, price);
            pstmt.setString(6, imagePath);
            pstmt.setInt(7, eventId);
            pstmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Method to delete an event by its ID
    public void deleteEvent(int eventId) {
        String query = "DELETE FROM events WHERE eventid = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, eventId);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}