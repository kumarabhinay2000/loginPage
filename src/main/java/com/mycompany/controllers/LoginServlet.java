package com.mycompany.controllers;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    private final String JDBC_URL = "jdbc:mysql://localhost:3306/demo_db";
    private final String JDBC_USER = "root";
    private final String JDBC_PASS = "abhinay";

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || username.trim().length() < 3 ||
            password == null || password.trim().length() < 5) {
            response.sendRedirect("login.jsp?error=true");
            return;
        }

        boolean validUser = false;
        String name = null, email = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS)) {
                String sql = "SELECT * FROM usern1 WHERE username = ? AND password = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, username);
                    stmt.setString(2, password);
                    try (ResultSet rs = stmt.executeQuery()) {
                        if (rs.next()) {
                            validUser = true;
                            name = rs.getString("name");
                            email = rs.getString("email");
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return;
        }

        if (validUser) {
            HttpSession session = request.getSession();
            session.setAttribute("name", name);
            session.setAttribute("email", email);
            session.setAttribute("username", username);
            response.sendRedirect("welcome.jsp");
        } else {
            response.sendRedirect("login.jsp?error=true");
        }
    }
}