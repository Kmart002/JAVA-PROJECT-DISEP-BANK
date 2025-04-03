<%@ page import="com.disep.disepbank.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            min-height: 100vh;
            margin: 0;
            background-color: #f4f4f9;
            /*display: flex;*/
            justify-content: center;
            align-items: center;
            padding: 20px;
            box-sizing: border-box;
        }

        .form-container {
            background: #fff;
            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        input, select {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[readonly] {
            background-color: #e9ecef; /* Light gray background for read-only fields */
            color: #6c757d; /* Text color for read-only fields */
        }

        button {
            padding: 10px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%@ include file="/header.html" %>
<div class="form-container">
    <h2>Edit User Details</h2>
    <form action="" method="post">
        <%
            User currentUser = (User) session.getAttribute("currentUser");
        %>
        <label for="email">Email (Read-Only)</label>
        <input type="email" id="email" name="email" value="<%= currentUser.getEmail() %>" readonly/>

        <label for="firstName">First Name</label>
        <input type="text" id="firstName" name="firstName" value="<%= currentUser.getFirstName() %>" required/>

        <label for="lastName">Last Name</label>
        <input type="text" id="lastName" name="lastName" value="<%= currentUser.getLastName() %>" required/>

        <label for="gender">Gender</label>
        <select id="gender" name="gender" required>
            <option value="Male" <%= "Male".equals(request.getAttribute("gender")) ? "selected" : "" %>>Male</option>
            <option value="Female" <%= "Female".equals(request.getAttribute("gender")) ? "selected" : "" %>>Female
            </option>
        </select>

        <label for="phoneNo">Phone Number</label>
        <input type="tel" id="phoneNo" name="phoneNo" value="<%= currentUser.getPhoneNo() %>" pattern="[0-9]{11}"
               placeholder="Enter 10-digit phone number" required/>

<%--        <%--%>
<%--            User user = new User();--%>
<%--            user.setEmail(request.getAttribute("email").toString());--%>
<%--            user.setFirstName(request.getAttribute("firstName").toString());--%>
<%--            user.setLastName(request.getAttribute("LastName").toString());--%>
<%--            user.setPhoneNo(request.getAttribute("phoneNo").toString());--%>
<%--            user.setGender(request.getAttribute("gender").toString());--%>

<%--            request.setAttribute("user", user);--%>
<%--        %>--%>

        <button type="submit">Update Details</button>
    </form>
</div>
<%@ include file="/header.html" %>
</body>
</html>
