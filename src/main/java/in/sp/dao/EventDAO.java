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
    private static final String USER = System.getenv("DB_USERNAME");
    private static final String PASS = System.getenv("DB_PASSWORD");

    // Establishes a connection to the database
    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(DB_URL, USER, PASS);
        if (connection != null) {
            System.out.println("Connected to MySQL database!");
        } else {
            System.out.println("Failed to connect to MySQL database.");
        }
        return connection;
    }

    // Retrieves an event by ID
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
                    event.setDate(rs.getString("date"));
                    event.setTime(rs.getString("time"));
                    event.setDescription(rs.getString("description"));
                    event.setImagePath(rs.getString("imagePath"));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return event;
    }

    // Retrieves all events
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
                event.setDate(rs.getString("date"));
                event.setTime(rs.getString("time"));
                event.setDescription(rs.getString("description"));
                event.setImagePath(rs.getString("imagePath"));
                events.add(event);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return events;
    }

    // Inserts an event into the database
    public boolean insertEvent(Event event) {
        String query = "INSERT INTO events (title, location, date, time, description, imagePath) VALUES (?, ?, ?, ?, ?, ?)";
        boolean flag = false;
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            conn.setAutoCommit(false);
            ps.setString(1, event.getTitle());
            ps.setString(2, event.getLocation());
            ps.setString(3, event.getDate());
            ps.setString(4, event.getTime());
            ps.setString(5, event.getDescription());
            ps.setString(6, event.getImagePath());
            
            int value = ps.executeUpdate();
            
            if (value == 1) {
                conn.commit();
                flag = true;
            } else {
                conn.rollback();
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return flag;
    }
}
