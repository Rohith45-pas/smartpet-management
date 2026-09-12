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
<%
    PetDAO petDAO = new PetDAO();
    List<Pet> pets = petDAO.getAllPets();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SmartPet - My Pets</title>

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
            width: 90%;
            margin: 30px auto;
        }

        .top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .add-button {
            background: #198754;
            color: white;
            padding: 10px 18px;
            text-decoration: none;
            border-radius: 6px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        th {
            background: #198754;
            color: white;
            padding: 14px;
        }

        td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f5f5f5;
        }

        .empty {
            background: white;
            padding: 30px;
            text-align: center;
            border-radius: 10px;
        }

        .back {
            display: inline-block;
            margin-top: 20px;
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
    <h1>🐾 My Pets</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>


<div class="container">

    <div class="top">
        <h2>🐶 My Pets</h2>

        <a href="add-pet.jsp" class="add-button">
            + Add Pet
        </a>
    </div>

    <% if (pets.isEmpty()) { %>

        <div class="empty">
            <h3>No pets added yet 🐾</h3>
            <p>Click "Add Pet" to add your first pet.</p>
        </div>

    <% } else { %>

        <table>

            <tr>
                <th>ID</th>
                <th>Pet Name</th>
                <th>Species</th>
                <th>Breed</th>
                <th>Age</th>
                <th>Weight (kg)</th>
                <th>Action</th>
            </tr>

            <% for (Pet pet : pets) { %>

            <tr>
                <td><%= pet.getPetId() %></td>
                <td><%= pet.getPetName() %></td>
                <td><%= pet.getSpecies() %></td>
                <td><%= pet.getBreed() %></td>
                <td><%= pet.getAge() %></td>
                <td><%= pet.getWeight() %></td>
<td>

    <a href="health-records.jsp?petId=<%= pet.getPetId() %>">
        🩺 Health
    </a>

    &nbsp; | &nbsp;

    <a href="edit-pet.jsp?petId=<%= pet.getPetId() %>">
        ✏️ Edit
    </a>

    &nbsp; | &nbsp;

    <a href="DeletePetServlet?petId=<%= pet.getPetId() %>"
       onclick="return confirm('Are you sure you want to delete this pet?');">
        🗑️ Delete
    </a>

</td>      </tr>

            <% } %>

        </table>

    <% } %>

    <a href="dashboard.jsp" class="back">
        ← Back to Dashboard
    </a>

</div>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>
</html>