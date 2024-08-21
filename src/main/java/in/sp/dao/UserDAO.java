//package in.sp.dao;
//
//import in.sp.model.UserModel;
//
//import java.sql.SQLException;
//import java.sql.Timestamp;
//
//public interface UserDAO {
//    UserModel getUserByEmailAndPassword(String email, String password) throws SQLException;
//    boolean registerUser(UserModel user) throws SQLException;
//    boolean updateResetToken(String email, String token, Timestamp expiration) throws SQLException;
//    boolean isValidToken(String token) throws SQLException;
//    boolean updatePassword(String token, String newPassword) throws SQLException;
//}
package in.sp.dao;

import in.sp.model.UserModel;

import java.sql.SQLException;
import java.sql.Timestamp;

public interface UserDAO {
    
    UserModel getUserByEmailAndPassword(String email, String password) throws SQLException;
    
    boolean registerUser(UserModel user) throws SQLException;

    // Add this method to the interface
    boolean updateUser(UserModel user) throws SQLException;

    boolean updateResetToken(String email, String token, Timestamp expiration) throws SQLException;

    boolean isValidToken(String token) throws SQLException;

    boolean updatePassword(String token, String newPassword) throws SQLException;
}