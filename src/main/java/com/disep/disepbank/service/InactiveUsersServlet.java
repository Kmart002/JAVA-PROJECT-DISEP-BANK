package com.disep.disepbank.service;

import com.disep.disepbank.db.DBConnection;
import com.disep.disepbank.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/f/inactiveusers")
public class InactiveUsersServlet extends HttpServlet
{
    
    private Connection connection;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            connection = DBConnection.getConnection();
            
            Statement stat = connection.createStatement();
            ResultSet rs = stat.executeQuery("SELECT * FROM accounts where status=0;");
            
            List<User> inactiveusers = new ArrayList<>();
            
            while(rs.next())
            {
                
                String email = rs.getString("email");
                String firstName = rs.getString("firstname");
                String lastName = rs.getString("lastname");
                String phoneNo = rs.getString("phone_no");
                String accountNo = rs.getString("account_no");
                String accountType = rs.getString("account_type");
                double balance = rs.getDouble("balance");
                String gender = rs.getString("gender");
                boolean status = rs.getBoolean("status");
                
                User user = User.builder().email(email).firstName(firstName).lastName(lastName).phoneNo(phoneNo).accountNo(accountNo)
                                .balance(balance).gender(gender).status(status).accountType(accountType).build();
                inactiveusers.add(user);
            }
            
            request.setAttribute("inactiveUsers", inactiveusers);
            
            request.getRequestDispatcher("/f/verifyusers.jsp").forward(request, response);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
                connection.close();
            }
            catch (SQLException e)
            {
                System.out.println("Connection closed");
            }
        }
    }
}
