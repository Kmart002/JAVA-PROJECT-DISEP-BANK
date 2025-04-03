package com.disep.disepbank.serviceImpl;

import com.disep.disepbank.db.DBConnection;
import com.disep.disepbank.model.User;
import com.disep.disepbank.service.AdminService;
import org.springframework.stereotype.Service;

import java.sql.*;

@Service
public class AdminServiceImpl implements AdminService
{
    private Connection connection;
    
    @Override
    public boolean fundAccount(double amount, String accountNo)
    {
        try
        {
            connection = DBConnection.getConnection();
            
            Statement stat = connection.createStatement();
            String fundStat = "update accounts set balance=balance+" + amount + " where account_no='" + accountNo + "';";
            int i = stat.executeUpdate(fundStat);
            if (i > 0)
            {
                return true;
            }
            
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        catch (ClassNotFoundException e)
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
                System.out.println("Could not close database connection");
            }
        }
        
        return false;
    }
    
    @Override
    public int getUserCount()
    {
        try
        {
            connection = DBConnection.getConnection();
            
            Statement stat = connection.createStatement();
            String userCountStat = "select count(*) as 'userCount' from accounts where status=1; ";
            ResultSet rs = stat.executeQuery(userCountStat);
            
            while (rs.next())
            {
                return rs.getInt(1);
            }
            
        }
        catch (SQLException e)
        {
            System.out.println("SQL Exception getting User count");
            ;
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        
        return 0;
    }
    
    @Override
    public double getTransactionsVolume()
    {
        try
        {
            connection = DBConnection.getConnection();
            
            Statement stat = connection.createStatement();
            String transVolume = "select sum(amount) from transactions; ";
            ResultSet rs = stat.executeQuery(transVolume);
            
            while (rs.next())
            {
                return rs.getDouble(1);
            }
            
        }
        catch (SQLException e)
        {
            System.out.println("SQL Exception getting transaction volume");
            ;
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        
        return 0;
    }
    
    @Override
    public boolean verifyUser(String email)
    {
        try
        {
            connection = DBConnection.getConnection();
            
            Statement stat = connection.createStatement();
            int i = stat.executeUpdate("update accounts set status=1 where account_no='" + email + "';");
            if(i>0)
            {
                return true;
            }
        }
        catch (SQLException | ClassNotFoundException e)
        {
        
        }
        
        return false;
    }
    
    @Override
    public User updateUserDetails(User user, String email)
    {
        try
        {
            connection = DBConnection.getConnection();
            
            PreparedStatement stat = connection.prepareStatement("update accounts set firstName=?, lastname=?, phone_no=?" +
                                                                         "gender=? where account_no='" + email + "';");
            
            stat.setString(1, user.getFirstName());
            stat.setString(2, user.getLastName());
            stat.setString(3, user.getPhoneNo());
            stat.setString(4, user.getGender());
            
            int i = stat.executeUpdate();
            
            if(i>0)
            {
                return user;
            }
            
            
        }
        catch (SQLException e)
        {
        
        }
        catch (ClassNotFoundException e)
        {
        
        }
        return null;
    }
}
