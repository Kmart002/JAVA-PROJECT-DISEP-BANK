package com.disep.disepbank.service;

import com.disep.disepbank.db.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

@WebServlet("/f/verifyUserServlet")
public class VerifyUserServlet extends HttpServlet
{
    private Connection connection;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        // Get the userId from the request
        String email = request.getParameter("email");
        
        try
        {
            connection = DBConnection.getConnection();
            
            Statement stat = connection.createStatement();
            
            int i = stat.executeUpdate("update accounts set status=1 where email='" + email + "'");
            
            if (i>0)
            {
                System.out.println("User verified");
                request.setAttribute("message", "Verified user with email: " + email);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        
        request.getRequestDispatcher("verifyusers.jsp").include(request, response);
    }
}
