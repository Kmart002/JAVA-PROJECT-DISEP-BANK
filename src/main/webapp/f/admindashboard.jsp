<%--

  Created by IntelliJ IDEA.
  User: Ngo
  Date: 1/29/2025
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.disep.disepbank.serviceImpl.AdminServiceImpl" %>
<%@ page import="com.disep.disepbank.service.AdminService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            background-color: #007BFF;
            color: white;
            text-align: center;
            padding: 15px 0;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: sticky;
            bottom: 0;
        }

        /* Admin Dashboard Layout */
        .admin-dashboard {
            display: flex;
            flex: 1;
            height: calc(100vh - 110px); /* Adjust for header and footer height */
        }

        .sidebar {
            width: 20%;
            background-color: #2c3e50;
            color: white;
            padding: 20px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar li {
            margin: 15px 0;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            font-size: 18px;
        }

        .sidebar a:hover {
            text-decoration: underline;
        }

        main {
            width: 80%;
            padding: 20px;
            background-color: #f1f1f1;
        }

        /* Statistics Section */
        .stats {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .stat-box {
            flex: 1;
            margin: 0 10px;
            padding: 20px;
            background-color: #007BFF;
            color: white;
            border-radius: 5px;
            text-align: center;
        }

        .stat-box h2 {
            margin-bottom: 10px;
            font-size: 20px;
        }

        .stat-box p {
            font-size: 24px;
            font-weight: bold;
        }

        /* Quick Actions Section */
        .actions {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .actions h2 {
            margin-bottom: 20px;
        }

        .action-buttons {
            display: flex;
            justify-content: space-between;
        }

        .action-buttons button {
            flex: 1;
            margin: 0 10px;
            padding: 15px;
            font-size: 16px;
            color: white;
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .action-buttons button:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
            text-align: center;
        }

        .success {
            color: green;
            font-size: 14px;
            margin-bottom: 10px;
            text-align: center;
        }
    </style>
</head>

<body>
<%@ include file="../header.html" %>
<header>
    <h1>Admin Dashboard</h1>
</header>

<!-- Admin Dashboard -->
<div class="admin-dashboard">
    <!-- Sidebar Navigation -->
    <nav class="sidebar">
        <ul>
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Manage Users</a></li>
            <li><a href="#">Reports</a></li>
            <li onclick="location.href='/f/settings.jsp'"><a href="#">Settings</a></li>
            <li><a onclick="location.href='/f/logout'">Logout</a></li>
        </ul>
    </nav>

    <!-- Main Content Area -->
    <main>

        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null)
            {
        %>
        <div class="error"><%= errorMessage %>
        </div>
        <% } %>
        <%
            String message = (String) request.getAttribute("message");
            if (message != null)
            {
        %>
        <div class="success"><%= message %>
        </div>
        <% } %>
        <section class="stats">
            <div class="stat-box">
                <h2>Users</h2>
                <%
                    AdminService adminService = new AdminServiceImpl();
                %>
                <p><%= adminService.getUserCount()%>
                </p>
            </div>
            <div class="stat-box">
                <h2>Transactions</h2>
                <p>₦<%= adminService.getTransactionsVolume()%></p>
            </div>
            <%--<div class="stat-box">
                <h2>Reports</h2>
                <p>23</p>
            </div>--%>
        </section>

        <section class="actions">
            <h2>Quick Actions</h2>
            <div class="action-buttons">
                <button onclick="location.href='inactiveusers'">Verify Users</button>
                <button onclick="location.href='targetPage.jsp'">Add User</button>
                <button onclick="location.href='/f/fundaccount.jsp'">Fund User Account</button>
                <button onclick="location.href='targetPage.jsp'">Manage Settings</button>
            </div>
        </section>
    </main>
</div>

</body>
</html>
