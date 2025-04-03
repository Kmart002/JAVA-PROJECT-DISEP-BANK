package com.disep.disepbank.service;

import com.disep.disepbank.db.DBConnection;
import com.disep.disepbank.model.User;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "settings", value = "/f/settings")
public class updateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Settings update initiated");

        // Retrieve parameters from the request
        String email = req.getParameter("email");
        String firstname = req.getParameter("firstname");
        String lastname = req.getParameter("lastname");
        String phone_no = req.getParameter("phone_no");
        String gender = req.getParameter("gender");
        String password = req.getParameter("password");

        // SQL update statement
        String updateSettings = "update accounts set firstname = ?, lastname = ?, phone_no = ?, gender = ?, password = ? where email = ?";

        Connection connection = null;
        PreparedStatement ps = null;

        try {
            // Obtain a connection and disable auto-commit for manual transaction management
            connection = DBConnection.getConnection();

            // Prepare the statement and set parameters
            ps = connection.prepareStatement(updateSettings);
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, phone_no);
            ps.setString(4, gender);
            ps.setString(5, password);
            ps.setString(6, email);

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {

                // Optionally update the user in session if they are logged in
                HttpSession session = req.getSession(false);
                User currentUser = null;

                if (session != null) {
                    currentUser = (User) session.getAttribute("currentUser");

                    if (currentUser != null && currentUser.getEmail().equals(email)) {
                        currentUser.setFirstName(firstname);
                        currentUser.setLastName(lastname);
                        currentUser.setPhoneNo(phone_no);
                        currentUser.setGender(gender);
                        req.setAttribute("balance", currentUser.getBalance());
                        // You can update other fields as needed
                        session.setAttribute("currentUser", currentUser);
                    }
                }
                req.setAttribute("message", "Settings updated successfully.");
                req.setAttribute("currentUser", currentUser);
            } else {
                req.setAttribute("message", "No settings were updated. Please check the email provided.");
            }

            // Forward the request to the user dashboard JSP
            req.getRequestDispatcher("/f/userdashboard.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            // Roll back the transaction if an error occurs
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            req.setAttribute("errorMessage", "An error occurred while updating settings.");
            req.getRequestDispatcher("/f/userdashboard.jsp").forward(req, resp);
        } finally {
            // Clean up resources
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.setAutoCommit(true);  // Reset auto-commit before closing
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
