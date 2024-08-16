package in.sp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import in.sp.model.Event;

public class EventDAO {
    // Environment variables for database credentials
    private static final String DB_USERNAME = System.getenv("DB_USERNAME");
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD");

    // Establishes a connection to the database
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection connection = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/eventmanagement", DB_USERNAME, DB_PASSWORD);

        // Check if the connection is successful
        if (connection != null) {
            System.out.println("Connected to MySQL database!");
        } else {
            System.out.println("Failed to connect to MySQL database.");
        }

        return connection;
    }

    // Inserts an event into the database
    public boolean insertEvent(Event event) {
        Connection con = null;
        PreparedStatement stmt = null;
        boolean flag = false;

        try {
            con = EventDAO.getConnection();
            con.setAutoCommit(false);

            String query = "INSERT INTO events (title, venue, image, description) VALUES (?, ?, ?, ?)";
            stmt = con.prepareStatement(query);
            stmt.setString(1, event.getEventTitle());
            stmt.setString(2, event.getEventVenue());
            stmt.setString(3, event.getEventImage());
            stmt.setString(4, event.getEventDescription());

            int value = stmt.executeUpdate();

            if (value == 1) {
                con.commit();
                flag = true;
            } else {
                con.rollback();
            }

        } catch (Exception e) {
            try {
                if (con != null) {
                    con.rollback();
                }
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e2) {
                e2.printStackTrace();
            }
        }

        return flag;
    }
}
