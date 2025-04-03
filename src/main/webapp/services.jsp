<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
  <title>Our Services - DISEP Bank</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
  <style>
    body {
      font-family: 'Poppins', Arial, sans-serif;
      display: flex;
      flex-direction: column;
    }

    .hero-section {
      background: linear-gradient(to right, rgba(0, 123, 255, 0.8), rgba(0, 71, 171, 0.8)),
      url('https://cdn.pixabay.com/photo/2023/11/07/22/56/skyscraper-8373617_1280.jpg') no-repeat center center/cover;
      color: white;
      height: 400px;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      padding-top: 80px;
      position: relative;
    }

    .hero-section .content {
      z-index: 1;
    }

    .service-card img {
      border-radius: 10px;
    }

    .cta-section {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      background: linear-gradient(135deg, #f7f7f7 50%, #f1f1f1 50%);
      padding: 50px 20px;
      border-radius: 15px;
      box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
      margin-top: 50px;
    }

    .cta-section .text-content {
      flex: 1;
      padding-right: 20px;
    }

    .cta-section .text-content h2 {
      font-size: 2.5rem;
      margin-bottom: 15px;
      color: #343a40;
    }

    .cta-section .text-content p {
      font-size: 1.1rem;
      margin-bottom: 15px;
      color: #6c757d;
    }

    .cta-section .features {
      margin-top: 20px;
    }

    .cta-section .features li {
      font-size: 1rem;
      color: #6c757d;
      margin-bottom: 10px;
      display: flex;
      align-items: center;
    }

    .cta-section .features li i {
      color: #f36f21;
      margin-right: 10px;
    }

    .cta-section .action-button {
      background-color: #007bff;
      color: white;
      padding: 12px 25px;
      border: none;
      border-radius: 5px;
      font-size: 1.1rem;
      cursor: pointer;
      transition: background-color 0.3s, transform 0.2s;
    }

    .cta-section .action-button:hover {
      background-color: #0056b3;
      transform: translateY(-2px);
    }

    .cta-section .image-container {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .cta-section .image-container img {
      width: 100%;
      max-width: 500px;
      border-radius: 15px;
      box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.2);
    }
  </style>
</head>
<body class="">
<div>
  <%@ include file="header.html"%>
</div>
<div>
  <!-- ✅ Hero Section -->
  <div class="hero-section">
    <div class="content text-center">
      <h1>Our Services</h1>
      <p class="lead">Explore a world of possibilities with our tailored banking solutions.</p>
    </div>
  </div>

  <!-- ✅ Services Section -->
  <div class="container my-5">
    <div class="row text-center">
      <div class="col-md-4">
        <div class="card service-card p-3 shadow">
          <img src="https://cdn.pixabay.com/photo/2019/09/30/15/16/online-banking-4516007_1280.jpg" alt="Online Banking" class="img-fluid">
          <h4 class="mt-3">Online Banking</h4>
          <p>Bank from anywhere, anytime, with our secure online banking platform.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card service-card p-3 shadow">
          <img src="https://cdn.pixabay.com/photo/2018/01/30/13/17/currency-3118767_1280.jpg" alt="Business Loans" class="img-fluid">
          <h4 class="mt-3">Business Loans</h4>
          <p>Empowering your business with flexible loan options and financial support.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card service-card p-3 shadow">
          <img src="https://cdn.pixabay.com/photo/2023/07/25/18/00/man-8149563_1280.jpg" alt="Investment Services" class="img-fluid">
          <h4 class="mt-3">Investment Services</h4>
          <p>Plan for a brighter future with our expert investment guidance.</p>
        </div>
      </div>
    </div>
  </div>

  <!-- ✅ Enhanced CTA Section -->
  <div class="container">
    <div class="cta-section">
      <div class="text-content">
        <h2>Simple Banking Solutions for Every Business</h2>
        <p>Whatever your business size, we offer flexible solutions designed to help you thrive.</p>
        <p>Partner with DISEP Bank for tailored support, secure transactions, and cutting-edge tools that empower you to achieve your financial goals.</p>

        <ul class="features">
          <li><i class="bi bi-check-circle-fill"></i> Access your accounts anytime, anywhere.</li>
          <li><i class="bi bi-check-circle-fill"></i> Fast and secure payment processing.</li>
          <li><i class="bi bi-check-circle-fill"></i> Tailored loans and credit lines for businesses.</li>
          <li><i class="bi bi-check-circle-fill"></i> Expert advisors for strategic financial planning.</li>
        </ul>

        <button class="action-button" onclick="location.href='index.jsp'">Get Started →</button>
      </div>
      <div class="image-container">
        <img src="https://cdn.pixabay.com/photo/2017/01/14/10/56/people-1979261_1280.jpg" alt="Banking Solutions">
      </div>
    </div>
  </div>
</div>
<div>
  <%@ include file="/footer.html" %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>