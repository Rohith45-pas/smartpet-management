<%@ page import="java.util.List" %>
<%@ page import="com.smartpet.model.*" %>
<%@ page import="com.smartpet.dao.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Smart Pet Management</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f5f7fa;
            color: #222;
        }

        nav {
            background: #ffffff;
            padding: 18px 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .nav-buttons a {
            text-decoration: none;
            margin-left: 20px;
            color: #333;
        }

        .hero {
            min-height: 500px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 60px 10%;
        }

        .hero-content {
            max-width: 600px;
        }

        .hero h1 {
            font-size: 52px;
            margin-bottom: 20px;
        }

        .hero h1 span {
            color: #2e7d32;
        }

        .hero p {
            font-size: 18px;
            line-height: 1.7;
            margin-bottom: 30px;
            color: #555;
        }

        .btn {
            display: inline-block;
            padding: 14px 28px;
            background: #2e7d32;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
        }

        .features {
            padding: 50px 10%;
            background: white;
            text-align: center;
        }

        .features h2 {
            font-size: 32px;
            margin-bottom: 35px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .card {
            padding: 25px;
            background: #f5f7fa;
            border-radius: 12px;
        }

        .card h3 {
            margin-bottom: 10px;
        }

        .card p {
            color: #666;
            line-height: 1.5;
        }

        footer {
            text-align: center;
            padding: 25px;
            background: #222;
            color: white;
        }

        @media(max-width: 800px) {
            .hero {
                flex-direction: column;
                text-align: center;
            }

            .cards {
                grid-template-columns: 1fr 1fr;
            }
        }
    </style>
    <link rel="stylesheet" href="smartpet.css">
</head>

<body>

<nav>
    <div class="logo">🐾 SmartPet</div>

    <div class="nav-buttons">
        <a href="#">Home</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
    </div>
</nav>

<section class="hero">

    <div class="hero-content">

        <h1>
            Smart Care for Your
            <span>Pets</span>
        </h1>

        <p>
            Manage your pet's health, medicines, nutrition,
            vaccination, grooming, appointments and daily care
            from one simple platform.
        </p>

        <a href="login.jsp" class="btn">
            Get Started
        </a>

    </div>

    <img class="index-image" src="images/pet-care-banner.svg" alt="SmartPet pet care">

</section>

<section class="features">

    <h2>Everything Your Pet Needs</h2>

    <div class="cards">

        <div class="card">
            <h3>❤️ Pet Health</h3>
            <p>Maintain health records and important information.</p>
        </div>

        <div class="card">
            <h3>💊 Medicines</h3>
            <p>Track medicines and medication schedules.</p>
        </div>

        <div class="card">
            <h3>🥗 Nutrition</h3>
            <p>Manage food and nutrition information.</p>
        </div>

        <div class="card">
            <h3>🤖 AI Assistant</h3>
            <p>Get general pet-care guidance from our AI assistant.</p>
        </div>

    </div>

</section>

<footer>
    <p>© 2026 SmartPet Management System</p>
</footer>

</body>
</html>