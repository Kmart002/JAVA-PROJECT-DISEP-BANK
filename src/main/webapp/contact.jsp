<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact Us - DISEP Bank</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    body {
      font-family: 'Poppins', Arial, sans-serif;
      background-color: #f8f9fa;
    }

    .hero-section {
      background: linear-gradient(to right, rgba(0, 123, 255, 0.8), rgba(0, 71, 171, 0.8)),
      url('https://cdn.pixabay.com/photo/2023/11/07/22/56/skyscraper-8373617_1280.jpg') no-repeat center center/cover;
      color: white;
      height: 350px;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      position: relative;
    }

    .hero-section .content {
      z-index: 1;
    }

    .contact-info {
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
      text-align: center;
    }

    .contact-info i {
      font-size: 2rem;
      color: #f36f21;
      margin-bottom: 10px;
    }

    .map-container {
      margin-top: 40px;
      border-radius: 10px;
      overflow: hidden;
    }

    .faq-section {
      background: linear-gradient(135deg, #f7f7f7 50%, #f1f1f1 50%);
      padding: 50px 20px;
      border-radius: 15px;
      box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
      margin-top: 50px;
    }

    .faq-section h2 {
      text-align: center;
      color: #343a40;
    }

    .accordion-button {
      background-color: #2563eb;
      color: white;
      font-weight: bold;
    }

    .accordion-button:not(.collapsed) {
      color: white;
      background-color: #2563eb;
    }

    .accordion-body {
      background-color: #fff;
    }
  </style>
</head>
<body>
<%@ include file="header.html"%>

<!-- ✅ Hero Section -->
<div class="hero-section">
  <div class="content text-center">
    <h1>Contact Us</h1>
    <p class="lead">We are here to help you with your banking needs.</p>
  </div>
</div>

<!-- ✅ Contact Information Section -->
<div class="container my-5">
  <div class="row text-center">
    <div class="col-md-4">
      <div class="contact-info p-4">
        <i class="bi bi-telephone-fill"></i>
        <h4>Phone</h4>
        <p>+234 700 909 909 909</p>
      </div>
    </div>
    <div class="col-md-4">
      <div class="contact-info p-4">
        <i class="bi bi-envelope-fill"></i>
        <h4>Email</h4>
        <p>support@disepbank.com</p>
      </div>
    </div>
    <div class="col-md-4">
      <div class="contact-info p-4">
        <i class="bi bi-geo-alt-fill"></i>
        <h4>Head Office</h4>
        <p>DISEP Bank Head Office, Walter Carrington Crescent, Victoria Island, Lagos.</p>
      </div>
    </div>
  </div>
</div>

<!-- ✅ Google Map Section -->
<div class="container map-container">
  <h3 class="text-center mb-3">Find Us Here</h3>
  <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3939.9185831938955!2d3.4186026740301797!3d6.431339093504244!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x103bf52d9d4de6b1%3A0x21e716e2c1c84c96!2sStanbic%20IBTC%20Bank%20Head%20Office!5e0!3m2!1sen!2sng!4v1707570000000!5m2!1sen!2sng"
          width="100%" height="400" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
</div>

<!-- ✅ FAQ Section (Extended) -->
<div class="container faq-section">
  <h2>Frequently Asked Questions</h2>
  <div class="accordion mt-4" id="faqAccordion">
    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
          How can I open an account with DISEP Bank?
        </button>
      </h2>
      <div id="faq1" class="accordion-collapse collapse show">
        <div class="accordion-body">
          You can open an account online through our website or visit any of our branches with a valid ID and proof of address.
        </div>
      </div>
    </div>

    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
          Where are your branches located?
        </button>
      </h2>
      <div id="faq2" class="accordion-collapse collapse">
        <div class="accordion-body">
          We have multiple branches across Nigeria. You can use our branch locator on the website to find the nearest branch.
        </div>
      </div>
    </div>

    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq3">
          What are the banking hours?
        </button>
      </h2>
      <div id="faq3" class="accordion-collapse collapse">
        <div class="accordion-body">
          Our branches operate Monday to Friday from 8:00 AM to 4:00 PM. Online banking is available 24/7.
        </div>
      </div>
    </div>

    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq4">
          Can i transfer money using mobile banking?
        </button>
      </h2>
      <div id="faq4" class="accordion-collapse collapse">
        <div class="accordion-body">
          Yes, you can transfer funds between DISEP Bank accounts or to other banks using the mobile app.
        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file="/footer.html" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>