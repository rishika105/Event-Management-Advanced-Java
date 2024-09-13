package in.sp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import in.sp.model.Event;

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
        String query = "SELECT * FROM events WHERE venue_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    event = new Event();
                    event.setEventId(rs.getInt("venue_id"));
                    event.setVenueName(rs.getString("venue_name"));
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

    // Method to get an event by venue name
    public Event getEventByVenueName(String venueName) {
        Event event = null;
        String query = "SELECT * FROM events WHERE venue_name = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, venueName);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    event = new Event();
                    event.setEventId(rs.getInt("venue_id"));
                    event.setVenueName(rs.getString("venue_name"));
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

    public String getVenueNameById(int venueId) {
        String venueName = null;
        String query = "SELECT venue_name FROM events WHERE venue_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, venueId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    venueName = rs.getString("venue_name");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return venueName;
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
                event.setEventId(rs.getInt("venue_id"));
                event.setVenueName(rs.getString("venue_name"));
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
        String query = "INSERT INTO events (venue_name, location, time, description, price, imagePath) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, event.getVenueName());
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
    public void updateEvent(int eventId, String venueName, String location, String time, String description, double price, String imagePath) {
        String sql = "UPDATE events SET venue_name = ?, location = ?, time = ?, description = ?, price = ?, imagePath = ? WHERE venue_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, venueName);
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
        String query = "DELETE FROM events WHERE venue_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, eventId);
            ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
