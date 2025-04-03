package com.disep.disepbank.db;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@Configuration
public class DBConnection
{
    
    // JDBC URL, username, and password of MySQL server
    private static final String URL = "jdbc:mysql://localhost:3306/dicepbank"; // Replace 'your_database_name' with your database name
    private static final String USER = "root"; // Replace 'your_username' with your MySQL username
    private static final String PASSWORD = "Admin"; // Replace 'your_password' with your MySQL password
    
    // JDBC Driver name
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    
    // Method to establish a connection
    @Bean
    public static Connection getConnection() throws SQLException, ClassNotFoundException
    {
        // Load and register the JDBC driver
        Class.forName(DRIVER);
        // Establish and return a connection
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
    
    // Test the connection
   /* public static void main(String[] args)
    {
        try (Connection connection = DBConnection.getConnection())
        {
            if (connection != null)
            {
                System.out.println("Database connected successfully!");
            }
            else
            {
                System.out.println("Failed to connect to the database.");
            }
        }
        catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
            
        }
    }*/
}
