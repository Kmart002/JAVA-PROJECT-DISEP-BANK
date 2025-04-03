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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@Service
@WebServlet(name = "loginServlet", value = "/loginServlet")
public class LoginServlet extends HttpServlet
{
    /*@Autowired
    @Qualifier("getConnection")
    private Connection connection;
    
    public LoginServlet(Connection connection)
    {
        this.connection = connection;
    }
    
    public LoginServlet()
    {
    }*/
    
    @Override
    public void init(ServletConfig config) throws ServletException
    {
    
    }
    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        boolean isValid = false;
        
        if (username != null && password != null)
        {
            // get only verified users
            String query = "select * from accounts where email='" + username + "' and password='" + password + "' and status=1";
            try
            {
                Connection connection = DBConnection.getConnection();
                if (connection == null)
                {
                    throw new RuntimeException("No connection to DB");
                }
                Statement stat = connection.createStatement();
                ResultSet rs = stat.executeQuery(query);
                HttpSession session = req.getSession();
                
                String role = null;
                
                User currentUser = null;
                
                while (rs.next())
                {
                    isValid = true;
                    
                    role = rs.getString("role");
                    double balance = rs.getDouble("balance");
                    String firstName = rs.getString("firstName");
                    String lastName = rs.getString("lastName");
                    String email = rs.getString("email");
                    String phoneNo = rs.getString("phone_no");
                    String gender = rs.getString("gender");
                    String accountNo = rs.getString("account_no");

                    currentUser = User.builder().balance(balance).firstName(firstName).lastName(lastName).email(email).accountNo(accountNo).phoneNo(phoneNo).gender(gender).build();
                    
                    session.setAttribute("currentUser", currentUser);
                    break;
                }
                
                if (isValid)
                {
                    // Store the value in the session
                    session.setAttribute("username", username);
                    
                    // Optionally, redirect or forward the user
                    if (role.equals("ADMIN"))
                    {
                        resp.sendRedirect("/f/admindashboard.jsp");
                    }
                    else
                    {
                        req.setAttribute("balance", currentUser == null ? 0 : currentUser.getBalance());
                        req.getRequestDispatcher("/f/userdashboard.jsp").forward(req, resp);
                        // resp.sendRedirect("/f/userdashboard.jsp");
                    }
                }
                else
                {
                    req.setAttribute("errorMessage", "Invalid Login. Try again");
                    resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Login. Try again");
                    req.getRequestDispatcher("/login.jsp").forward(req, resp);
                }
                
            }
            catch (SQLException e)
            {
                throw new RuntimeException(e);
            }
            catch (ClassNotFoundException e)
            {
                System.out.println(e.getMessage());
            }
        }
    }
}
