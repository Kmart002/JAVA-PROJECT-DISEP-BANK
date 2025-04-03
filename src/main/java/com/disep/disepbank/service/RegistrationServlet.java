package com.disep.disepbank.service;

import com.disep.disepbank.db.DBConnection;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

@Component
@WebServlet(name = "registerServlet", value = "/registerServlet")
public class RegistrationServlet extends HttpServlet
{
    /*@Autowired
    @Qualifier("getConnection")
    Connection connection;*/
    
    @Override
    public void init(ServletConfig config) throws ServletException
    {
    
    }
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        System.out.println("****Registering Account****");
        // Retrieve data from the form
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String phone_no = request.getParameter("phone_no");
        String account_no = generateAccountNo();
        String account_type = request.getParameter("account_type");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");
        
        // SQL query to insert the user data
        String query = "INSERT INTO accounts (firstname, lastname, phone_no, account_no, account_type, email, gender, password) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        
        try
        {
            Connection connection = DBConnection.getConnection();
            if (connection == null)
            {
                throw new RuntimeException("No connection to DB");
            }
            PreparedStatement stmt = connection.prepareStatement(query);
            
            // Set the values for the PreparedStatement
            stmt.setString(1, firstname);
            stmt.setString(2, lastname);
            stmt.setString(3, phone_no);
            stmt.setString(4, account_no);
            stmt.setString(5, account_type);
            stmt.setString(6, email);
            stmt.setString(7, gender);
            stmt.setString(8, password); // Note: In a real app, you should hash the password before storing
            
            // Execute the query
            int result = stmt.executeUpdate();
            
            // Handle success/failure
            if (result > 0)
            {
                // If the user is successfully registered
                // response.getWriter().println("User registered successfully!");
                request.setAttribute("message", "User registered successfully! Login to proceed.");
                // Redirect to a success page or login page
                // response.sendRedirect("/login.jsp");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
            else
            {
                // If something went wrong with the insertion
                response.getWriter().println("Error in registration. Please try again.");
                request.setAttribute("errorMessage", "Error in registration. Please try again." );
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
        catch (RuntimeException ex)
        {
            System.out.println(ex.getMessage());
        }
        catch (ClassNotFoundException e)
        {
            System.out.println(e.getMessage());
        }
    }
    
    private String generateAccountNo()
    {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i <= 10; i++)
        {
            Random random = new Random();
            int num = random.nextInt(9);
            sb.append(num);
        }
        return sb.toString();
    }
    
    
    
    /*@Override
    public void destroy()
    {
        try
        {
            connection.close();
        }
        catch (SQLException e)
        {
            System.out.println("Could not close connection");
        }
    }*/
}
