<!DOCTYPE html>
<html>
<head>
  <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
  <title>Fund Bank Account</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      justify-content: center;
      align-items: center;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
      margin: 0;
      background-color: #f4f4f9;
      height: 100vh;
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

    input {
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 5px;
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

    .error {
      color: red;
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
<%@ include file="/header.html"%>
<div class="form-container flex-1 my-2">
  <h2 class="font-bold text-xl mb-1">Fund Bank Account</h2>

  <!-- Form for funding the account -->
  <form action="/f/fundaccount" method="post">
    <%
      String errorMessage = (String) request.getAttribute("errorMessage");
      if (errorMessage != null)
      {
    %>
    <div class="error"><%= errorMessage %>
    </div>
    <% } %>
    <label for="accountNo">Account Number</label>
    <input type="text" id="accountNo" name="accountNo" placeholder="Enter Account Number" required />

    <label for="amount">Amount</label>
    <input type="number" id="amount" name="amount" placeholder="Enter Amount" step="0.01" required />

    <button type="submit">Fund Account</button>
    <button onclick="goBack()">Back</button>
  </form>
</div>
<%@ include file="/footer.html"%>
</body>
</html>
