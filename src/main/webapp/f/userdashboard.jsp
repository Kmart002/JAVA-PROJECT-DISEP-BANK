<%--

  Created by IntelliJ IDEA.
  User: Ngo
  Date: 1/29/2025
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.disep.disepbank.model.User" %>
<html>
<head>
    <title>Account Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header, footer {
            background-color: #007BFF;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: sticky;
            z-index: 1000;
        }

        header {
            top: 0;
        }
        .dynamicName{
            font-size: 30px;
            font-weight: bolder;
            line-height: 4rem;
        }
        .dynamic{
            font-size: 22px;
            font-weight: bold;
            line-height: 2.4rem;
        }

        footer {
            bottom: 0;
        }
        h1 {
            text-align: center;
            color: #007BFF;
        }
        .dashboard {
            flex: 1; /* Expands to fill the vertical space between header and footer */
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            width: 100%; /* Make the dashboard span the full width */
            padding: 20px;
            box-sizing: border-box; /* Include padding in the total width/height */
            background-color: #ffffff;
            text-align: center;
        }

        .profile-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding: 0 20px;
        }

        .profile-picture {
            position: relative;
            width: 100px;
            height: 100px;
            border: 2px solid #ccc;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            color: #555;
            background-color: #f2f2f2;
        }
        .picture{
            width: 100px;
            height: 100px;
            object-fit: contain;
            object-position: center;
            border-radius: 50%;
        }

        .edit-profile-button {
            border: 2px solid blue;
            color: blue;
            background: none;
            padding: 10px 15px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
        }

        .edit-profile-button:hover {
            background-color: blue;
            color: #fff;
        }

        .logout-button {
            border: 2px solid red;
            color: red;
            background: none;
            padding: 10px 15px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
        }

        .logout-button:hover {
            background-color: red;
            color: #fff;
        }

        .balance-section {
            height: 180px;
            margin: 20px 20px;
            padding: 20px;
            background-color: #f2f2f2;
            border-radius: 10px;
            font-size: 15px;
            color: #333;
        }

        .action-buttons {
            height: 100px;
            display: flex;
            justify-content: space-around;
            margin: 20px 0;
            padding: 0 20px;
        }

        .action-button {
            flex: 1; /* Ensure equal button sizes */
            max-width: 150px; /* Optional: Limit button width */
            margin: 0 10px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .action-button:hover {
            background-color: #0056b3;
        }

        .footer-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            padding: 0 20px;
        }

        .footer-button {
            padding: 10px 15px;
            border: none;
            background-color: #ddd;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .footer-button:hover {
            background-color: #bbb;
        }

        .settings-button {
            background-color: #007BFF;
            color: #fff;
        }

        .settings-button:hover {
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
<%
    User currentUser = (User) session.getAttribute("currentUser");
    Double balance = (Double) request.getAttribute("balance");
%>
<h1 class="dynamicName">Welcome <%= currentUser.getFirstName() %></h1>
<div class="dashboard">

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
    <div class="profile-section">
        <div class="profile-picture">
            <img class="picture" src="https://i.pinimg.com/736x/d6/30/8a/d6308a0357b762ee72b49b482f125ef7.jpg" alt="Profile Picture">
        </div>
        <button class="edit-profile-button" onclick="location.href='/f/settings.jsp'">Edit Profile</button>
    </div>

    <div class="balance-section">

        <h2 class="dynamic">Account Number: <%= currentUser.getAccountNo() %></h2>
        <h2 class="dynamic">Avalaible Balance: <%= balance != null ? balance.toString() : 0.00 %></h2>
        <h2 class="dynamic">Savings Account</h2>
        <h2 class="dynamic">Balance last updated on 12:30 PM</h2>
    </div>


    <div class="action-buttons">
        <button class="action-button"  onclick="location.href='/f/sendmoney.jsp'">Send Money</button>
        <button class="action-button">Airtime / Data Bundle</button>
        <button class="action-button">Bill Payments</button>
        <button class="action-button"  onclick="location.href='/f/transactionhistory'">Transaction History</button>
    </div>

    <div class="footer-buttons">
        <button class="logout-button" onclick="location.href='/f/logout'">Logout</button>
        <button class="footer-button settings-button" onclick="location.href='/f/settings.jsp'">Settings</button>
    </div>
</div>
<%--<%@ include file="../footer.html" %>--%>
</body>
</html>
