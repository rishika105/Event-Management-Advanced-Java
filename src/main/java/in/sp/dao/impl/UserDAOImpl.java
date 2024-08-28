package in.sp.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import in.sp.dao.UserDAO;
import in.sp.model.UserModel;

public class UserDAOImpl implements UserDAO {
    private static final String DB_URL = System.getenv("DB_URL");
    private static final String DB_USER = System.getenv("DB_USERNAME");
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD");

    public UserDAOImpl() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public UserModel getUserByEmailAndPassword(String email, String password) throws SQLException {
        UserModel user = null;
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "SELECT * FROM register WHERE email = ? AND password = ?";
            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setString(1, email);
                ps.setString(2, password);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        user = new UserModel();
                        user.setEmail(rs.getString("email"));
                        user.setPassword(rs.getString("password"));
                        user.setName(rs.getString("name"));
                        user.setGender(rs.getString("gender"));
                        user.setCity(rs.getString("city"));
                    }
                }
            }
        }
        return user;
    }

    @Override
    public boolean registerUser(UserModel user) throws SQLException {
        boolean status = false;
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "INSERT INTO register (name, email, password, gender, city) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setString(1, user.getName());
                ps.setString(2, user.getEmail());
                ps.setString(3, user.getPassword());
                ps.setString(4, user.getGender());
                ps.setString(5, user.getCity());
                int i = ps.executeUpdate();
                status = i > 0;
            }
        }
        return status;
    }
    
    @Override
    public boolean updateUser(UserModel user) throws SQLException {
        boolean status = false;
        String query = "UPDATE register SET name = ?, password = ?, gender = ?, city = ? WHERE email = ?";

        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setString(1, user.getName());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getGender());
            stmt.setString(4, user.getCity());
            stmt.setString(5, user.getEmail()); // Use email as the identifier

            int rowsUpdated = stmt.executeUpdate();
            status = rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error while updating user: " + e.getMessage());
        }
        return status;
    }



    @Override
    public boolean updateResetToken(String email, String token, Timestamp expiration) throws SQLException {
        boolean status = false;
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "UPDATE register SET reset_token = ?, token_expiration = ? WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, token);
            ps.setTimestamp(2, expiration);
            ps.setString(3, email);
            int i = ps.executeUpdate();
            if (i > 0) {
                status = true;
            }
        }
        return status;
    }

    @Override
    public boolean isValidToken(String token) throws SQLException {
        boolean isValid = false;
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "SELECT * FROM register WHERE reset_token = ? AND token_expiration > NOW()";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, token);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                isValid = true;
            }
        }
        return isValid;
    }

    @Override
    public boolean updatePassword(String token, String newPassword) throws SQLException {
        boolean status = false;
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "UPDATE register SET password = ?, reset_token = NULL, token_expiration = NULL WHERE reset_token = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setString(2, token);
            int i = ps.executeUpdate();
            if (i > 0) {
                status = true;
            }
        }
        return status;
    }}

