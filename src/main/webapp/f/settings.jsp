<%--
  Created by IntelliJ IDEA.
  User: Ngo
  Date: 1/29/2025
  Time: 10:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.disep.disepbank.model.User" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <style>
        body {
            background-image: url("https://i.imgur.com/MjgVwgH.jpeg");
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container{
            background: rgba(225,225,225,0.8);
            background-blend-mode: overlay;
            padding: 0 5rem 0 5rem;
            width: 100%;
        }



        .registration-form {
        /background: #fff;/
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

        .btn-back:hover {
            background-color: #B0B0B0;
        }


        .submit-btn {
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 45%;
        }

        .submit-btn:hover {
            background-color: #A7C7E7;
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
    <script>
        function goBack() {
            window.history.back(); // Navigates back in browser history
        }
    </script>
</head>
<body>
<%--<%@ include file="header.html" %>--%>


<form class="registration-form container" action="/f/settings">
    <%
        User currentUser = (User) session.getAttribute("currentUser");

        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null)
        {
    %>
    <div class="error"><%= errorMessage %>
    </div>
    <% } %>



    <h2>Account Settings</h2>

    <div class="form-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" value="<%= currentUser.getEmail() %>" readonly required>
    </div>

    <div class="form-group">
        <label for="firstname">First Name</label>
        <input type="text" id="firstname" name="firstname" value="<%= currentUser.getFirstName() %>" required>
    </div>

    <div class="form-group">
        <label for="lastname">Last Name</label>
        <input type="text" id="lastname" name="lastname" value="<%= currentUser.getLastName() %>" required>
    </div>

    <div class="form-group">
        <label for="phone_no">Phone Number</label>
        <input type="text" id="phone_no" name="phone_no" value="<%= currentUser.getPhoneNo() %>"  required>
    </div>

    <div class="form-group">
        <label for="gender">Gender</label>
        <select id="gender" name="gender" required>
            <option value="Male" <%= "Male".equals(currentUser.getGender()) ? "selected" : "" %>>Male</option>
            <option value="Female"  <%= "Female".equals(currentUser.getGender()) ? "selected" : "" %>>Female</option>
        </select>
    </div>

    <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>
    </div>

    <div class=" button button-wrapper">
        <button type="button" class="btn-back" onclick="goBack()">Back</button>
        <button type="submit" class="submit-btn">Update Profile</button>
    </div>

</form>


<%--<%@ include file="footer.html" %>--%>
</body>
</html>