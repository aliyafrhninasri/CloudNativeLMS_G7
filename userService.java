package com.cloudlms.service;

/*
 * GROUP 7 - CSE3443 (25/26)
 */

import com.lms.dao.UserDAO;
import java.sql.SQLException;

public class userService {
    private UserDAO userDAO;

    public userService() {
        this.userDAO = new UserDAO();
    }

    // Service layer to handle registration 
    public boolean registerStudent(String name, String email, String password) throws SQLException {
        // Business Logic (eg: check email, password rules)
        // if all systemic rule pass, delegate execution to Data Access Layer (UserDAO)
        return userDAO.registerUser(name, email, password);
    }
}