<%--

  Created by IntelliJ IDEA.
  User: Ngo
  Date: 1/29/2025
  Time: 10:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <style>
        body {
            background-image: url("https://i.postimg.cc/90M8wY4M/baccck.webp");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            /*background-color: #f9f9f9;*/
            margin: 0;
            padding: 0;
            display: block;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container{

            display: flex;
            justify-content: center;
            margin-top: 1rem;
            margin-bottom: 1rem;
            padding: 0 5rem 0 5rem;
        }
        .heading{
            font-weight: bold;
            color: #1877F2;
            text-align: center;
            font-size: 25px;
        }

        .registration-form {

            background: rgba(225,225,225,0.7);
            /*background: #fff;*/
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 400px;
        }

        .registration-form h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #007bff;
            outline: none;
        }

        .button {
            flex: 1;
            padding: 10px;
            border: none;
            cursor: pointer;
            text-align: center;
        }

        .button-wrapper{
            display: flex;
            gap: 10px;
            justify-content: space-between;
            margin-top: 20px;
        }

        .btn-back {
            width: 45%;
            background-color: #6c757d;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn-back:hover{
            background-color: #000000;
        }

        .submit-btn {
            width: 45%;
            padding: 10px;
            background-color: #1877F2;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
            text-align: center;
        }
        /*.success {*/
        /*    color: green;*/
        /*    font-size: 14px;*/
        /*    margin-bottom: 10px;*/
        /*    text-align: center;*/
        /*}*/


    </style>
</head>
<body>
<%@ include file="header.html" %>

<div class="container">
    <form class="registration-form" action="registerServlet">
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null)
            {
        %>
        <div class="error"><%= errorMessage %>
        </div>
        <% } %>

        <h1 class="heading">Account Registration</h1>

        <div class="form-group">
            <label for="firstname">First Name</label>
            <input type="text" id="firstname" name="firstname" required>
        </div>

        <div class="form-group">
            <label for="lastname">Last Name</label>
            <input type="text" id="lastname" name="lastname" required>
        </div>

        <div class="form-group">
            <label for="phone_no">Phone Number</label>
            <input type="text" id="phone_no" name="phone_no" required>
        </div>

        <%--<div class="form-group">
            <label for="account_no">Account Number</label>
            <input type="text" id="account_no" name="account_no" required>
        </div>--%>

        <div class="form-group">
            <label for="account_type">Account Type</label>
            <select id="account_type" name="account_type" required>
                <option value="Savings">Savings</option>
            </select>
        </div>

        <%--<div class="form-group">
            <label for="balance">Balance</label>
            <input type="number" id="balance" name="balance" step="0.01" required>
        </div>--%>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
        </div>

        <div class="form-group">
            <label for="gender">Gender</label>
            <select id="gender" name="gender" required>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
        </div>

        <%-- <div class="form-group">
             <label for="date_created">Date Created</label>
             <input type="datetime-local" id="date_created" name="date_created" required>
         </div>--%>
        <div class=" button button-wrapper">
            <button type="button" class="btn-back" onclick="location.href='/index.jsp'">Back</button>

            <button type="submit" class="submit-btn">Register</button>
        </div>
    </form>
</div>

<%@ include file="footer.html" %>
</body>
</html>