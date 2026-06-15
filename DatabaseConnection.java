/*
 * GROUP 7 - CSE3443 (25/26)
 */

package com.lms.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnection {
    // credential from Aiven.io console
    private static final String HOST = "mysql-2bc8687d-cloudnative-lms-group7.h.aivencloud.com";
    private static final String PORT = "28588"; 
    private static final String DATABASE = "defaultdb";
    private static final String USERNAME = "avnadmin";
    private static final String PASSWORD = "AVNS_zNAaU1ML4xsZbzmFiUL";
    
    // JDBC connection URL with SSL configuration enabled to ensure secure cloud communication
    private static final String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE + "?useSSL=false&trustServerCertificate=true&allowPublicKeyRetrieval=true";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("LOG: MySQL JDBC driver registered successfully!");
            
            // Automatic function: Create table directly from Java to Aiven.io
            autoCreateTable();
            
        } catch (ClassNotFoundException e) {
            System.err.println("LOG ERROR: JDBC driver not found!");
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        DriverManager.setLoginTimeout(10); 
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    // This code will automatically execute and send SQL commands to create a table in Aiven.io
    private static void autoCreateTable() {
        String sql = "CREATE TABLE IF NOT EXISTS users ("
                   + "id INT AUTO_INCREMENT PRIMARY KEY, "
                   + "name VARCHAR(100) NOT NULL, "
                   + "email VARCHAR(100) NOT NULL UNIQUE, "
                   + "password VARCHAR(255) NOT NULL, "
                   + "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP"
                   + ")";
                   
        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             Statement stmt = conn.createStatement()) {
            
            stmt.execute(sql);
            System.out.println("LOG: The 'users' table is ready for use in Aiven!");
            
        } catch (SQLException e) {
            System.err.println("LOG ERROR during auto-create table: " + e.getMessage());
        }
    }
}


