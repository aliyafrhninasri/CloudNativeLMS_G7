<%-- 
    Document   : DataView
    Created on : 2 Jun 2026, 9:01:28 pm
    Author     : Group 7 CSE3443 (25/26)
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.lms.config.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Aiven Cloud - Database Viewer</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 40px; background-color: #f8f9fa; color: #333; }
        .container { max-width: 1000px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
        h2 { margin-top: 0; color: #2c3e50; font-size: 24px; border-bottom: 2px solid #ecf0f1; padding-bottom: 15px; }
        .status-bar { margin: 15px 0 25px 0; font-size: 14px; }
        .badge { background-color: #2ecc71; color: white; padding: 6px 12px; border-radius: 20px; font-weight: bold; font-size: 12px; display: inline-block; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th, td { padding: 14px 16px; text-align: left; border-bottom: 1px solid #eef2f3; }
        th { background-color: #1abc9c; color: white; font-weight: 600; text-transform: uppercase; font-size: 13px; letter-spacing: 0.5px; }
        tr:hover { background-color: #fcfcfc; }
        .text-bold { font-weight: 600; color: #2c3e50; }
        .error-msg { color: #e74c3c; background: #fde8e7; padding: 15px; border-radius: 6px; border-left: 4px solid #e74c3c; }
    </style>
</head>
<body>

    <div class="container">
        <h2>☁️ Cloud Database Live Data Viewer (Aiven.io)</h2>
        
        <div class="status-bar">
            <strong>Connection Status:</strong> <span class="badge">CONNECTED TO LIVE DATABASE</span>
        </div>

        <table>
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Email Address</th>
                    <th>Registration Timestamp (UTC)</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        conn = DatabaseConnection.getConnection();
                        String sql = "SELECT id, name, email, created_at FROM users";
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);
                        
                        boolean hasData = false;
                        while(rs.next()) {
                            hasData = true;
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td class="text-bold"><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getTimestamp("created_at") %></td>
                </tr>
                <%
                        }
                        if (!hasData) {
                            out.println("<tr><td colspan='4' style='text-align:center; color:#7f8c8d;'>No records found in 'users' table.</td></tr>");
                        }
                    } catch(Exception e) {
                        out.println("<tr><td colspan='4'><div class='error-msg'><strong>Database Error:</strong> " + e.getMessage() + "</div></td></tr>");
                    } finally {
                        if(rs != null) rs.close();
                        if(stmt != null) stmt.close();
                        if(conn != null) conn.close();
                    }
                %>
            </tbody>
        </table>
    </div>

</body>
</html>