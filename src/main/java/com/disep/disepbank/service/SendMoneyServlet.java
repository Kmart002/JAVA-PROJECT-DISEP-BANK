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
import java.sql.*;

@WebServlet(name = "sendMoney", value = "/f/sendMoney")
public class SendMoneyServlet extends HttpServlet
{
    /**
     * TransactionID
     * Type (CR/DR)
     * AccountNo
     * Amount
     * Sender
     * Receiver
     * Status (Completed)
     * DateCreated
     *
     * */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        System.out.println("Sending money");

        String recipientName = req.getParameter("recipientName");
        String recipientNo = req.getParameter("recipientNo");
        String bankName = req.getParameter("bankName");
        double amount = Double.parseDouble(req.getParameter("amount"));
        String description = req.getParameter("description");
        
        HttpSession session = req.getSession();
        
        // Store the value in the session
        User currentUser = (User)session.getAttribute("currentUser");
        
        // String getSenderInfo = "select * from accounts where email='"+currentUser.getEmail()+"';";
        
        String sendMoney = "update accounts set balance = balance + ? where account_no = ?";
        
        String debitSender = "update accounts set balance = balance - ? where account_no = ?";
        
        String sendTransaction = "insert into transactions (transType, accountNo, amount, receiverID, status ) values (?,?,?,?,?)";
        String receiverTransaction = "insert into transactions (transType, accountNo, amount, senderID, status ) values (?,?,?,?,?)";
        Connection connection = null;
        
        try
        {
            // Connection to FB
            connection = DBConnection.getConnection();
            
            // Starting an SQL transaction by setting commit to false so rollback is possible
            connection.setAutoCommit(false);
            
            if (currentUser!=null && amount > currentUser.getBalance())
            {
                req.setAttribute("errorMessage", "Insufficient Funds");
                resp.sendRedirect("/f/userdashboard.jsp");
            }
            
            // Send money
            PreparedStatement sendMoneyPS = connection.prepareStatement(sendMoney);
            
            sendMoneyPS.setDouble(1, amount);
            sendMoneyPS.setString(2, recipientNo);
            
            int i = sendMoneyPS.executeUpdate();
            
            System.out.println("i = " + i);
            
            PreparedStatement debitSenderPS = connection.prepareStatement( debitSender);
            
            debitSenderPS.setDouble(1, amount);
            debitSenderPS.setString(2, ((User)session.getAttribute("currentUser")).getAccountNo());
            
            debitSenderPS.executeUpdate();
            
            // register the transactions in the transaction table for both db and cr transactions
            PreparedStatement sendTransPS = connection.prepareStatement(sendTransaction);
            
            sendTransPS.setString(1, "Debit");
            sendTransPS.setString(2, ((User)session.getAttribute("currentUser")).getAccountNo());
            sendTransPS.setDouble(3, amount);
            sendTransPS.setString(4, recipientNo);
            sendTransPS.setString(5, "Successful");
            
            sendTransPS.execute();
            
            PreparedStatement receiverTransPS = connection.prepareStatement(receiverTransaction);
            
            receiverTransPS.setString(1, "Credit");
            receiverTransPS.setString(2, recipientNo);
            receiverTransPS.setDouble(3, amount);
            receiverTransPS.setString(4, ((User)session.getAttribute("currentUser")).getAccountNo());
            receiverTransPS.setString(5, "Successful");
            
            receiverTransPS.execute();
            
            connection.setAutoCommit(true);
            
            req.setAttribute("balance", ((User)session.getAttribute("currentUser")).getBalance() - amount);
            req.setAttribute("message", "Money sent to "+recipientName+" successfully.");
            
            req.getRequestDispatcher("/f/userdashboard.jsp").forward(req, resp);
        }
        catch (Exception e)
        {
            try
            {
                assert connection != null;
                connection.rollback();
            }
            catch (SQLException ex)
            {
                System.out.println(e.getMessage());
                ex.printStackTrace();
            }
        }
        
        
    }
    
    @Override
    public void init(ServletConfig config) throws ServletException
    {
        super.init(config);
    }
    
    @Override
    public void destroy()
    {
        super.destroy();
    }
}
