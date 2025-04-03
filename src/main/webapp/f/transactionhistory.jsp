<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
    <title>User Transactions</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            margin: 0;
            height: 100vh;
        }
        .flexClass {
            flex: 1 1 0%;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f4f4f4;
        }
    </style>
    <script>
        function goBack() {
            window.history.back(); // Navigates back in browser history
        }
    </script>
</head>
<body class="">
<%@ include file="/header.html"%>
<div class="flexClass w-full flex flex-col items-center justify-center">
<h1 class="text-2xl font-bold w-full text-center mb-3">Transaction History</h1>

<table>
    <thead>
    <tr>
        <th>Transaction ID</th>
        <th>Transaction Type</th>
        <th>Account No</th>
        <th>Sender ID</th>
        <th>Receiver ID</th>
        <th>Status</th>
        <th>Date Created</th>
        <th>Amount</th>
    </tr>
    </thead>
    <tbody>
    <!-- Check if the transaction list is not empty -->
    <c:choose>
        <c:when test="${not empty usertransactions}">
            <!-- Iterate over the transaction list -->
            <c:forEach var="transaction" items="${usertransactions}">
                <tr>
                    <td>${transaction.transactionID}</td>
                    <td>${transaction.transType}</td>
                    <td>${transaction.accountNo}</td>
                    <td>${transaction.senderID}</td>
                    <td>${transaction.receiverID}</td>
                    <td>${transaction.status}</td>
                    <td>${transaction.dateCreated}</td>
                    <td>${transaction.amount}</td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="8">No transactions available.</td>
            </tr>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>
    <button  onclick="goBack()" class="mx-auto mt-5 justify-self-center px-3 py-2 border border-blue-600 rounded-xl bg-blue-600 text-white hover:bg-white hover:text-blue-600 hover:scale-95 transition-all duration-300 cursor-pointer">Back</button>
</div>
<%@ include file="/footer.html"%>
</body>
</html>
