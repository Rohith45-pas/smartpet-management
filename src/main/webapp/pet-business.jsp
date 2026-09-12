<%@ page import="java.util.List" %>
<%@ page import="com.smartpet.model.*" %>
<%@ page import="com.smartpet.dao.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setCharacterEncoding("UTF-8"); %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pet Business Hub</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: #f5f7fa;
        }

        .header {
            background: #2c3e50;
            color: white;
            padding: 25px;
            text-align: center;
        }

        .header h1 {
            margin: 0;
        }

        .header p {
            margin-top: 8px;
        }

        .container {
            width: 90%;
            margin: 30px auto;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .icon {
            font-size: 45px;
        }

        .card h3 {
            margin: 12px 0;
        }

        .card p {
            color: #666;
        }

        .btn {
            display: inline-block;
            padding: 10px 18px;
            margin-top: 10px;
            background: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        .btn:hover {
            background: #2980b9;
        }

        .main-buttons {
            text-align: center;
            margin: 30px 0;
        }

        .main-btn {
            display: inline-block;
            padding: 13px 25px;
            margin: 5px;
            background: #27ae60;
            color: white;
            text-decoration: none;
            border-radius: 7px;
        }

        .main-btn:hover {
            background: #219150;
        }

        .back {
            display: block;
            text-align: center;
            margin: 30px;
        }

        @media (max-width: 800px) {
            .cards {
                grid-template-columns: 1fr;
            }
        }
    </style>
    <link rel="stylesheet" href="smartpet.css">
</head>

<body>
<nav class="site-nav">
  <a class="brand" href="dashboard.jsp">🐾 SmartPet</a>
  <div class="links">
    <a href="dashboard.jsp">🏠 Dashboard</a>
    <a href="my-pets.jsp">🐶 Pets</a>
    <a href="appointments.jsp">📅 Appointments</a>
    <a href="medicines.jsp">💊 Medicines</a>
    <a href="ai-pet-assistant.jsp">🤖 AI Assistant</a>
    <a class="logout" href="LogoutServlet">🚪 Logout</a>
  </div>
</nav>


    <div class="header">
        <h1>🐾 Pet Business Hub</h1>
        <p>Discover and manage pet-related businesses and services</p>
    </div>
<div class="page-banner" style="background-image:url('https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&w=1200&q=80')">
  <div class="banner-content">
    <h1>🏪 Pet Business Hub</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>


    <div class="container">

        <div class="main-buttons">

            <a href="add-pet-business.jsp" class="main-btn">
                ➕ Add Business
            </a>

            <a href="pet-businesses.jsp" class="main-btn">
                📋 View All Businesses
            </a>

        </div>

        <div class="cards">

            <div class="card">
                <div class="icon">🛒</div>
                <h3>Pet Shops</h3>
                <p>
                    Find pet food, accessories, toys and other
                    essential pet products.
                </p>
                <a href="pet-businesses.jsp" class="btn">
                    View Shops
                </a>
            </div>


            <div class="card">
                <div class="icon">🏥</div>
                <h3>Veterinary Clinics</h3>
                <p>
                    Find veterinary clinics and professional
                    pet healthcare services.
                </p>
                <a href="pet-businesses.jsp" class="btn">
                    View Clinics
                </a>
            </div>


            <div class="card">
                <div class="icon">✂️</div>
                <h3>Pet Grooming</h3>
                <p>
                    Find grooming centers for bathing,
                    cleaning and grooming your pets.
                </p>
                <a href="pet-businesses.jsp" class="btn">
                    View Grooming
                </a>
            </div>


            <div class="card">
                <div class="icon">🐕</div>
                <h3>Pet Training</h3>
                <p>
                    Find professional pet training and
                    behavior services.
                </p>
                <a href="pet-businesses.jsp" class="btn">
                    View Training
                </a>
            </div>


            <div class="card">
                <div class="icon">🏠</div>
                <h3>Pet Boarding</h3>
                <p>
                    Find safe boarding and temporary
                    accommodation for pets.
                </p>
                <a href="pet-businesses.jsp" class="btn">
                    View Boarding
                </a>
            </div>


            <div class="card">
                <div class="icon">🐾</div>
                <h3>Pet Adoption</h3>
                <p>
                    Explore businesses and organizations
                    supporting pet adoption.
                </p>
                <a href="pet-businesses.jsp" class="btn">
                    View Adoption
                </a>
            </div>

        </div>

    </div>

    <div class="back">
        <a href="dashboard.jsp">← Back to Dashboard</a>
    </div>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>
</html>