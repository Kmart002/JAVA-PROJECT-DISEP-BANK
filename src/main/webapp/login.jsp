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
    <title>Login to DISEP Bank</title>
    <style>
        body {
            background-image: url("https://i.postimg.cc/bNDC9s7F/loggg.webp");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            /*background-color: #2563EB;*/
            margin: 0;
            padding: 0;
            display: block;
            /*flex-basis: 100%;*/
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container{
            display: flex;
            justify-content: center;
            background-blend-mode: overlay;
            padding: 0 5rem 0 5rem;
            width: 100%;
        }

        .login-container {
            justify-content: center;
            /*background: #ffffff;*/
            padding: 20px;
            background: rgba(225,225,225,0.8);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-top: 200px;
            margin-bottom: 140px;
            width: 300px;
        }

        .login-container h2 {
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

        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-group input:focus {
            border-color: #007bff;
            outline: none;
        }

        .login-btn {
            width: 100%;
            padding: 10px;
            background-color:  #1877F2;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .login-btn:hover {
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
<%@ include file="header.html" %>

<div class="container">
    <div class="login-container" style="text-align: center;">
        <h2>Login to DISEP Bank</h2>
        <form action="loginServlet">
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
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="login-btn">Login</button>
        </form>
    </div>
</div>
<%@ include file="footer.html" %>
</body>
</html>