<%--

  Created by IntelliJ IDEA.
  User: Administrator
  Date: 1/30/2025
  Time: 11:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Send Money</title>
  <style>

    body {
      background-image: url("https://i.imgur.com/IrztXiL.jpeg");
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      font-family: 'Roboto', sans-serif;
      background-color: #f8f9fa;
      color: #333;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      padding: 1rem;
    }

    .container {
      background: rgba(225,225,225,0.8);
    /*background-color: #fff;*/
    margin-top: 1rem;
      margin-bottom: 1rem;
      padding: 0 5rem 0 5rem;
      border-radius: 10px;
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 480px;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .container:hover {
      transform: translateY(-5px);
      box-shadow: 0 12px 32px rgba(0, 0, 0, 0.15);
    }

    header {
      text-align: center;
      margin-bottom: 2rem;
    }

    header h1 {
      font-size: 2rem;
      font-weight: 700;
      color: #007bff;
      margin-bottom: 0.5rem;
    }

    header p {
      font-size: 0.9rem;
      color: #666;
    }

    .form-group {
      margin-bottom: 1.5rem;
    }

    .form-group label {
      display: block;
      margin-bottom: 0.5rem;
      font-weight: 500;
      color: #444;
    }

    .form-group input,
    .form-group textarea {
      width: 100%;
      padding: 0.75rem;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-size: 1rem;
      transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    .form-group input:focus,
    .form-group textarea:focus {
      border-color: #007bff;
      box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
      outline: none;
    }

    .form-group textarea {
      resize: vertical;
      min-height: 100px;
    }

    .button-group {
      display: flex;
      justify-content: space-between;
      gap: 1rem;
      margin-top: 2rem;
    }

    .btn-back,
    .btn-send {
      flex: 1;
      padding: 0.75rem;
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      font-weight: 500;
      cursor: pointer;
      transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .btn-back {
      background-color: #6c757d;
      color: #fff;
    }

    .btn-back:hover {
      background-color: #5a6268;
      transform: translateY(-2px);
    }

    .btn-send {
      background-color: #007bff;
      color: #fff;
    }

    .btn-send:hover {
      background-color: #0056b3;
      transform: translateY(-2px);
    }
  </style>
  <script>
    function goBack() {
      window.history.back(); // Navigates back in browser history
    }
  </script>
</head>

<body>
<%--<%@ include file="/header.html"%>--%>

<div class="container">
  <header>
    <h1>Send Money</h1>
    <p>Transfer funds securely to any account.</p>
  </header>
  <main>
    <form action="/f/sendMoney">
      <div class="form-group">
        <label for="recipient-name">Recipient's Account Name</label>
        <input type="text" id="recipient-name" name="recipientName" placeholder="John Doe" required>
      </div>
      <div class="form-group">
        <label for="recipient-account">Recipient's Account Number</label>
        <input type="text" id="recipient-account" name="recipientNo" placeholder="1234 5678 9012 3456" required>
      </div>
      <div class="form-group">
        <label for="bank-name">Bank Name</label>
        <input type="text" id="bank-name" name="bankName" value="DiSEP Bank" readonly required>
      </div>
      <div class="form-group">
        <label for="amount">Amount</label>
        <input type="number" id="amount" name="amount" placeholder="0.00" required>
      </div>
      <div class="form-group">
        <label for="description">Description</label>
        <textarea id="description" name="description" placeholder="Enter a description (optional)" rows="3"></textarea>
      </div>
      <div class="button-group">
        <button type="button" class="btn-back" onclick="goBack()">Back</button>
        <button type="submit" class="btn-send">Send Money</button>
      </div>
    </form>
  </main>
</div>
<%--<%@ include file="/footer.html"%>--%>
</body>
</html>