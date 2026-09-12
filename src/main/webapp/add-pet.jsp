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
    <title>SmartPet - Add Pet</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f7f5;
            margin: 0;
        }

        .header {
            background: #198754;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            width: 450px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 25px;
            border: none;
            border-radius: 6px;
            background: #198754;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #146c43;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #198754;
            text-decoration: none;
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
    <h1>🐾 SmartPet Management System</h1>
</div>
<div class="page-banner" style="background-image:url('https://images.unsplash.com/photo-1530281700549-e82e7bf110d6?auto=format&fit=crop&w=1200&q=80')">
  <div class="banner-content">
    <h1>🐶 Add New Pet</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>


<div class="container">

    <h2>🐶 Add Your Pet</h2>

    <form action="AddPetServlet" method="post">

        <label>Pet Name</label>
        <input type="text" name="petName" required>

        <label>Species</label>
        <select name="species" required>
            <option value="">-- Select Species --</option>
            <option value="Dog">Dog</option>
            <option value="Cat">Cat</option>
            <option value="Bird">Bird</option>
            <option value="Rabbit">Rabbit</option>
            <option value="Fish">Fish</option>
            <option value="Other">Other</option>
        </select>

        <label>Breed</label>
        <input type="text" name="breed">

        <label>Age (Years)</label>
        <input type="number" name="age" min="0">

        <label>Weight (kg)</label>
        <input type="number" name="weight" step="0.01" min="0">

        <button type="submit">Add Pet</button>

    </form>

    <a href="dashboard.jsp" class="back">
        ← Back to Dashboard
    </a>

</div>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>
</html>