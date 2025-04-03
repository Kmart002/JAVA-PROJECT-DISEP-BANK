<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - DISEP Bank</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://cdn.pixabay.com/photo/2023/11/07/22/56/skyscraper-8373617_1280.jpg'); /* 🔥 Bank-related background */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #fff;
        }
        .overlay {
            background-color: rgba(0, 0, 0, 0.5);
            min-height: 100vh;
            padding-top: 60px;
        }

        .container {
            margin-top: 30px;
        }
        .card {
            background-color: rgba(255, 255, 255, 0.9);
            color: black;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(255, 255, 255, 0.3);
        }

        /* ✅ Bank Image Section Styling */
        .bank-image-section {
            position: relative;
            width: 100%;
            height: 400px; /* Adjust height */
            overflow: hidden;
        }
        .bank-image-section img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Ensures it fits without distortion */
            transition: transform 0.4s ease-in-out;
        }
        .bank-image-section img:hover {
            transform: scale(1.05); /* Subtle zoom effect on hover */
        }

    </style>
</head>
<body>
<%@ include file="header.html"%>
<div class="overlay">

    <!-- ✅ Main Content -->
    <div class="container">
        <div class="text-center">
            <h2 class="mt-4">About DISEP Bank</h2>
            <p class="lead">Your trusted financial partner for a secure and seamless banking experience.</p>
            <p class="lead">We are a commercial bank that encourages and delivers sustainable economic growth that is profitable, environmentally responsible and socially relevant.</p>
        </div>

        <!-- ✅ Bank Image Section with Stylish Overlay -->
        <div class="bank-image-section">
            <img src="https://cdn.pixabay.com/photo/2017/05/31/11/17/office-2360063_1280.jpg" alt="Modern Bank Office">
        </div>

        <div class="row mt-4">
            <div class="col-md-6">
                <div class="card p-4">
                    <h4>Our Mission</h4>
                    <p>
                        At DISEP Bank, our mission is to provide innovative and customer-centric financial solutions.
                        We are committed to making banking easy, accessible, and secure for everyone.
                    </p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card p-4">
                    <h4>Our Vision</h4>
                    <p>
                        To be the leading digital bank, leveraging technology to enhance financial inclusion
                        and empower individuals and businesses worldwide.
                    </p>
                </div>
            </div>
        </div>

        <!-- ✅ Core Values -->
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="card p-4">
                    <h4>Core Values</h4>
                    <ul>
                        <li><strong>Integrity:</strong> We maintain transparency and honesty in all our operations.</li>
                        <li><strong>Innovation:</strong> We use cutting-edge technology to enhance user experience.</li>
                        <li><strong>Customer First:</strong> Your satisfaction and financial success are our priorities.</li>
                        <li><strong>Security:</strong> We ensure that your transactions and data remain safe.</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- ✅ Why Choose Us -->
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="card p-4">
                    <h4>Why Choose DISEP Bank?</h4>
                    <ul>
                        <li>24/7 online banking with a user-friendly interface.</li>
                        <li>Fast and secure transactions worldwide.</li>
                        <li>Comprehensive loan and investment solutions.</li>
                        <li>Dedicated customer support to assist you anytime.</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="/footer.html" %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>