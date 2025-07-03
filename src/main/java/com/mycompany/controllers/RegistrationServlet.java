package com.mycompany.controllers;

import java.io.IOException;
import java.security.SecureRandom;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "RegistrationServlet", urlPatterns = {"/register"})
public class RegistrationServlet extends HttpServlet {

    private final String JDBC_URL = "jdbc:mysql://localhost:3306/demo_db";
    private final String JDBC_USER = "root";
    private final String JDBC_PASS = "abhinay";

    private String generateRandomPassword(int length) {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@#$";
        SecureRandom rnd = new SecureRandom();
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(chars.charAt(rnd.nextInt(chars.length())));
        }
        return sb.toString();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String fname = request.getParameter("fname");
        String gender = request.getParameter("gender");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");

        String username = contact;
        String password = generateRandomPassword(8);

        if (name == null || name.trim().length() < 2 ||
            fname == null || fname.trim().length() < 2 ||
            (!"Male".equalsIgnoreCase(gender) && !"Female".equalsIgnoreCase(gender)) ||
            contact == null || !contact.matches("\\d{10}") ||
            email == null || !email.matches("^[A-Za-z0-9._%+-]+@gmail\\.com$")) {

            response.sendRedirect("registeration.jsp?error=validation");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS)) {
                String sql = "INSERT INTO usern1 (name, fname, gender, contact_no, email, username, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, name.trim());
                    stmt.setString(2, fname.trim());
                    stmt.setString(3, gender);
                    stmt.setString(4, contact);
                    stmt.setString(5, email);
                    stmt.setString(6, username);
                    stmt.setString(7, password);

                    int rows = stmt.executeUpdate();

                    if (rows > 0) {
                        HttpSession session = request.getSession();
                        session.setAttribute("name", name);
                        session.setAttribute("email", email);
                        session.setAttribute("username", username);
                        session.setAttribute("password", password);

                        response.sendRedirect("RegistrationS.jsp");
                    } else {
                        response.getWriter().println("Registration failed! Try Again...");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}