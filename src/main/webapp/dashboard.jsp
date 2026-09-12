<%@ page import="java.util.List" %>
<%@ page import="com.smartpet.model.*" %>
<%@ page import="com.smartpet.dao.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setCharacterEncoding("UTF-8"); %>
<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>SmartPet Management System</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: #f1f8f5;
            color: #222;
        }

        /* HEADER */

        .header {
            background: linear-gradient(135deg, #198754, #157347);
            color: white;
            text-align: center;
            padding: 28px 20px;
        }

        .header h1 {
            margin: 0;
            font-size: 32px;
        }

        .header p {
            margin: 8px 0 0;
            font-size: 15px;
        }

        /* MAIN */

        .container {
            width: 92%;
            max-width: 1200px;
            margin: 30px auto;
        }

        /* WELCOME */

        .welcome {
            background: white;
            border-radius: 18px;
            padding: 30px;
            margin-bottom: 28px;
            box-shadow: 0 5px 18px rgba(0,0,0,0.08);
        }

        .welcome h2 {
            margin-top: 0;
            color: #198754;
        }

        .welcome p {
            color: #555;
            font-size: 16px;
        }

        .email {
            color: #666;
        }

        /* PET BANNER */

        .pet-banner {
            position: relative;
            height: 250px;
            border-radius: 18px;
            overflow: hidden;
            margin-bottom: 30px;
        }

        .pet-banner img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .pet-banner-overlay {
            position: absolute;
            left: 0;
            right: 0;
            bottom: 0;
            padding: 30px;
            color: white;
            background: linear-gradient(
                transparent,
                rgba(0,0,0,0.75)
            );
        }

        .pet-banner-overlay h2 {
            margin: 0 0 5px;
            font-size: 28px;
        }

        .pet-banner-overlay p {
            margin: 0;
            font-size: 15px;
        }

        /* CARDS */

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 22px;
        }

        .card {
            background: white;
            text-decoration: none;
            color: #222;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            transition: 0.25s;
        }

        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 8px 22px rgba(0,0,0,0.15);
        }

        .card-image {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }

        .card-content {
            padding: 20px;
            text-align: center;
        }

        .card-icon {
            font-size: 34px;
            margin-bottom: 8px;
        }

        .card h3 {
            margin: 5px 0 8px;
            color: #198754;
            font-size: 20px;
        }

        .card p {
            margin: 0;
            color: #666;
            font-size: 14px;
        }

        /* AI CARD */

        .ai-card {
            border: 2px solid #198754;
        }

        .ai-card h3 {
            color: #198754;
        }

        /* LOGOUT */

        .logout-area {
            text-align: center;
            margin: 35px 0;
        }

        .logout {
            display: inline-block;
            padding: 12px 28px;
            background: #dc3545;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
        }

        .logout:hover {
            background: #bb2d3b;
        }

        /* FOOTER */

        .footer {
            background: #157347;
            color: white;
            text-align: center;
            padding: 18px;
            margin-top: 40px;
        }

        .footer p {
            margin: 4px;
        }

        /* MOBILE */

        @media (max-width: 900px) {

            .cards {
                grid-template-columns: repeat(2, 1fr);
            }

        }

        @media (max-width: 600px) {

            .header h1 {
                font-size: 24px;
            }

            .cards {
                grid-template-columns: 1fr;
            }

            .pet-banner {
                height: 220px;
            }

            .welcome {
                padding: 20px;
            }

        }

    </style>

    <link rel="stylesheet" href="smartpet.css">
</head>


<body>


<!-- HEADER -->

<div class="header">

    <h1>🐾 SmartPet Management System</h1>

    <p>
        Complete digital care for your beloved pets
    </p>

</div>


<div class="container">


    <!-- WELCOME -->

    <div class="welcome">

        <h2>
            Welcome, <%= user.getFullName() %>! 👋
        </h2>

        <p>
            Welcome to your SmartPet Dashboard.
        </p>

        <p class="email">
            📧 Email: <%= user.getEmail() %>
        </p>

    </div>


    <!-- PET BANNER -->

    <div class="pet-banner">

        <img
            src="https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&w=1200&q=80"
            alt="Happy pets">

        <div class="pet-banner-overlay">

            <h2>🐶🐱 Happy Pets, Healthy Pets</h2>

            <p>
                Manage your pet's health, nutrition,
                grooming and daily care in one place.
            </p>

        </div>

    </div>


    <!-- DASHBOARD CARDS -->

    <div class="cards">


        <!-- MY PETS -->

        <a href="my-pets.jsp" class="card">

            <img
                class="card-image"
                src="https://images.unsplash.com/photo-1552053831-71594a27632d?auto=format&fit=crop&w=600&q=80"
                alt="Dog">

            <div class="card-content">

                <div class="card-icon">🐾</div>

                <h3>My Pets</h3>

                <p>
                    Manage your pets
                </p>

            </div>

        </a>


        <!-- HEALTH -->

        <a href="health-records.jsp" class="card">

            <img
                class="card-image"
                src="https://images.unsplash.com/photo-1628009368231-7bb7cfcb0def?auto=format&fit=crop&w=600&q=80"
                alt="Pet health">

            <div class="card-content">

                <div class="card-icon">🩺</div>

                <h3>Health</h3>

                <p>
                    View health records
                </p>

            </div>

        </a>


        <!-- VACCINATIONS -->

        <a href="vaccinations.jsp" class="card">

            <img
                class="card-image"
                src="https://images.unsplash.com/photo-1583337130417-3346a1be7dee?auto=format&fit=crop&w=600&q=80"
                alt="Pet">

            <div class="card-content">

                <div class="card-icon">💉</div>

                <h3>Vaccinations</h3>

                <p>
                    Manage vaccinations
                </p>

            </div>

        </a>


        <!-- MEDICINES -->

        <a href="medicines.jsp" class="card">

            <img
                class="card-image"
                src="https://images.unsplash.com/photo-1581888227599-779811939961?auto=format&fit=crop&w=600&q=80"
                alt="Pet care">

            <div class="card-content">

                <div class="card-icon">💊</div>

                <h3>Medicines</h3>

                <p>
                    Manage medicines
                </p>

            </div>

        </a>


        <!-- NUTRITION -->

        <a href="nutrition.jsp" class="card">

            <img
                class="card-image"
                src="https://images.unsplash.com/photo-1568640347023-a616a30bc3bd?auto=format&fit=crop&w=600&q=80"
                alt="Pet food">

            <div class="card-content">

                <div class="card-icon">🍖</div>

                <h3>Nutrition</h3>

                <p>
                    Manage pet nutrition
                </p>

            </div>

        </a>


        <!-- VETERINARY -->

        <a href="veterinary-services.jsp" class="card">

            <img
                class="card-image"
                src="https://images.unsplash.com/photo-1612531385446-f7a4d6f0b7d0?auto=format&fit=crop&w=600&q=80"
                alt="Veterinary care">

            <div class="card-content">

                <div class="card-icon">🏥</div>

                <h3>Veterinary</h3>

                <p>
                    Find veterinary services
                </p>

            </div>

        </a>


        <!-- PET BUSINESS -->

        <a href="pet-business.jsp" class="card">

            <img
                class="card-image"
                src="https://images.unsplash.com/photo-1583337130417-3346a1be7dee?auto=format&fit=crop&w=600&q=80"
                alt="Pet">

            <div class="card-content">

                <div class="card-icon">🏪</div>

                <h3>Pet Business</h3>

                <p>
                    Explore pet shops, grooming,
                    training and more
                </p>

            </div>

        </a>


        <!-- APPOINTMENTS -->

        <a href="appointments.jsp" class="card">

            <img
                class="card-image"
                src="https://images.unsplash.com/photo-1629909613654-28e377c37b09?auto=format&fit=crop&w=600&q=80"
                alt="Veterinary appointment">

            <div class="card-content">

                <div class="card-icon">📅</div>

                <h3>Appointments</h3>

                <p>
                    Manage veterinary appointments
                </p>

            </div>

        </a>


        <!-- GROOMING -->

        <a href="grooming.jsp" class="card">

            <img
                class="card-image"
                src="https://images.unsplash.com/photo-1516734212186-a967f81ad0d7?auto=format&fit=crop&w=600&q=80"
                alt="Pet grooming">

            <div class="card-content">

                <div class="card-icon">🧼</div>

                <h3>Grooming</h3>

                <p>
                    Manage pet grooming
                </p>

            </div>

        </a>


        <!-- AI ASSISTANT -->

        <a href="ai-pet-assistant.jsp"
           class="card ai-card">

            <img
                class="card-image"
                src="https://images.unsplash.com/photo-1530281700549-e82e7bf110d6?auto=format&fit=crop&w=600&q=80"
                alt="Pet AI assistant">

            <div class="card-content">

                <div class="card-icon">🤖🐾</div>

                <h3>Universal Pet AI</h3>

                <p>
                    Ask questions about pet care,
                    food and health
                </p>

            </div>

        </a>


    </div>


    <!-- LOGOUT -->

    <div class="logout-area">

        <a href="LogoutServlet" class="logout">
            Logout
        </a>

    </div>


</div>


<!-- FOOTER -->

<div class="footer">

    <p>
        🐾 SmartPet Management System
    </p>

    <p>
        Smart care for every pet
    </p>

</div>


</body>
</html>
