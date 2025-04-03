<%@ page import="com.disep.disepbank.model.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
    <title>Verify Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            margin: 0;
            background-color: #f9f9f9;
            height: 100vh;
        }
        .flexClass {
            flex: 1 1 0%;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .verify-btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
        }

        .verify-btn:hover {
            background-color: #218838;
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
<body class="">
<%@ include file="/header.html" %>
<div class="flexClass w-full flex flex-col items-center justify-center">
<h1 class="text-2xl font-bold w-full text-center">Verify Users</h1>
<%
    String message = (String) request.getAttribute("message");
    if (message != null)
    {
%>
<div class="success"><%= message %>
</div>
<% } %>
<table>
    <thead>
    <tr>
        <th>Email</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Phone No</th>
        <th>Verify</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<User> inactiveUsers = (List<User>) request.getAttribute("inactiveUsers");

        if (inactiveUsers != null) {
            for (User user : inactiveUsers) {
    %>
    <tr>
        <td><%= user.getEmail() %></td>
        <td><%= user.getFirstName() %></td>
        <td><%= user.getLastName() %></td>
        <td><%= user.getPhoneNo() %></td>
        <td>
            <form action="verifyUserServlet" method="post">
                <input type="hidden" name="email" value="<%= user.getEmail() %>" />
                <button type="submit" class="verify-btn">Verify</button>
            </form>
        </td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="5" style="text-align: center;">No inactive users found.</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
    <button  onclick="goBack()" class="mx-auto mt-5 justify-self-center px-3 py-2 border border-blue-600 rounded-xl bg-blue-600 text-white hover:bg-white hover:text-blue-600 hover:scale-95 transition-all duration-300 cursor-pointer">Back</button>
</div>
<%@ include file="/footer.html" %>
</body>
</html>
