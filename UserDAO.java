/*
 * GROUP 7 - CSE3443 (25/26)
 */

package com.lms.dao;

import com.lms.config.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAO {
    
    // Function to insert new user data into the Aiven database
    public boolean registerUser(String name, String email, String password) throws SQLException {
        String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
        boolean isSuccess = false;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            // Maps input parameters to '?' placeholders to prevent SQL injection
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, password); 

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                isSuccess = true;
            }
        } catch (SQLException e) {
            System.err.println("LOG ERROR: Failed to execute the SQL registration operation!" + e.getMessage());
            // Throws the exception upward so that the Servlet and browser can identify what went wrong
            throw e;
        }
        return isSuccess;
    }
}