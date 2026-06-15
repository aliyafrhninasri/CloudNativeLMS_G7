/*
 * GROUP 7 - CSE3443 (25/26)
 */

package com.lms.controller;

import com.lms.dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterController")
public class AuthServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Receives input data from the JSP form (Presentation Layer)
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            boolean result = userDAO.registerUser(name, email, password);
            if (result) {
                response.sendRedirect("login.jsp?status=success");
            } else {
                response.sendRedirect("register.jsp?status=failed");
            }
        } catch (Exception e) {
            // If an error occurs, display the Aiven/SQL error message directly on the browser screen
            response.setContentType("text/html");
            response.getWriter().println("<h2>System Error (Prototype Debug Mode)</h2>");
            response.getWriter().println("<p><b>Mesej Ralat Sebenar:</b> " + e.getMessage() + "</p>");
            response.getWriter().println("<p>Sila semak sama ada internet anda stabil atau maklumat hos Aiven salah.</p>");
        }
    }
}