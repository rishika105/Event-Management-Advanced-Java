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
    private static final String DB_URL = "jdbc:mysql://localhost:3306/eventmanagement";
    private static final String USER = "root";
    private static final String PASS = "123456789";

    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(DB_URL, USER, PASS);
    }

    public Event getEventById(int id) {
        Event event = null;
        String query = "SELECT * FROM events WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    event = new Event();
                    event.setId(rs.getInt("id"));
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

    public List<Event> getAllEvents() {
        List<Event> events = new ArrayList<>();
        String query = "SELECT * FROM events";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Event event = new Event();
                event.setId(rs.getInt("id"));
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
}
