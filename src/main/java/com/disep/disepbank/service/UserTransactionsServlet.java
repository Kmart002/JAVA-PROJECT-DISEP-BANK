package com.disep.disepbank.service;

import com.disep.disepbank.db.DBConnection;
import com.disep.disepbank.model.Transaction;
import com.disep.disepbank.model.TransactionTypes;
import com.disep.disepbank.model.User;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Service
@WebServlet("/f/transactionhistory")
public class UserTransactionsServlet extends HttpServlet
{
    private Connection connection;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        HttpSession session = req.getSession();
        
        try
        {
            connection = DBConnection.getConnection();
            
            PreparedStatement pstat = connection.prepareStatement("SELECT * FROM transactions where senderID = ? OR receiverID = ? ");
            
            String currentUserAccountNo = ((User) session.getAttribute("currentUser")).getAccountNo();
            pstat.setString(1, currentUserAccountNo);
            pstat.setString(2, currentUserAccountNo);
            
            ResultSet rs = pstat.executeQuery();
            
            List<Transaction> userTransactions = new ArrayList<>();
            
            while(rs.next())
            {
                int transID = rs.getInt("transactionID");
                String transType = rs.getString("transType");
                String accountNo = rs.getString("accountNo");
                String senderID = rs.getString("senderID");
                String receiverID = rs.getString("receiverID");
                String status = rs.getString("status");
                String dateCreated = rs.getDate("dateCreated").toString();
                double amount = rs.getDouble("amount");
                
                Transaction trans = Transaction.builder().transactionID(transID)
                                               .transType(TransactionTypes.valueOf(transType))
                                                       .accountNo(accountNo).senderID(senderID).receiverID(receiverID)
                                               .status(status).dateCreated(dateCreated).amount(amount).
                                               build();
                userTransactions.add(trans);
            }
            
            req.setAttribute("usertransactions", userTransactions);
            
            req.getRequestDispatcher("/f/transactionhistory.jsp").forward(req, resp);
        }
        catch (SQLException | ClassNotFoundException e)
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
    
    @Override
    public void destroy()
    {
    
    }
}
