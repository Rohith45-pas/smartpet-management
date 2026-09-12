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
    String idParameter = request.getParameter("petId");

    if (idParameter == null) {
        response.sendRedirect("my-pets.jsp");
        return;
    }

    int petId = Integer.parseInt(idParameter);

    PetDAO petDAO = new PetDAO();
    Pet selectedPet = null;

    for (Pet p : petDAO.getAllPets()) {
        if (p.getPetId() == petId) {
            selectedPet = p;
            break;
        }
    }

    if (selectedPet == null) {
        response.sendRedirect("my-pets.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SmartPet - Edit Pet</title>

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
<div class="page-banner" style="background-image:url('https://images.unsplash.com/photo-1552053831-71594a27632d?auto=format&fit=crop&w=1200&q=80')">
  <div class="banner-content">
    <h1>✏️ Edit Pet</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>


<div class="container">

    <h2>✏️ Edit Pet</h2>

    <form action="EditPetServlet" method="post">

        <input type="hidden"
               name="petId"
               value="<%= selectedPet.getPetId() %>">

        <label>Pet Name</label>
        <input type="text"
               name="petName"
               value="<%= selectedPet.getPetName() %>"
               required>

        <label>Species</label>
        <select name="species" required>

            <option value="Dog"
                <%= "Dog".equals(selectedPet.getSpecies()) ? "selected" : "" %>>
                Dog
            </option>

            <option value="Cat"
                <%= "Cat".equals(selectedPet.getSpecies()) ? "selected" : "" %>>
                Cat
            </option>

            <option value="Bird"
                <%= "Bird".equals(selectedPet.getSpecies()) ? "selected" : "" %>>
                Bird
            </option>

            <option value="Rabbit"
                <%= "Rabbit".equals(selectedPet.getSpecies()) ? "selected" : "" %>>
                Rabbit
            </option>

            <option value="Fish"
                <%= "Fish".equals(selectedPet.getSpecies()) ? "selected" : "" %>>
                Fish
            </option>

            <option value="Other"
                <%= "Other".equals(selectedPet.getSpecies()) ? "selected" : "" %>>
                Other
            </option>

        </select>

        <label>Breed</label>
        <input type="text"
               name="breed"
               value="<%= selectedPet.getBreed() %>">

        <label>Age (Years)</label>
        <input type="number"
               name="age"
               min="0"
               value="<%= selectedPet.getAge() %>">

        <label>Weight (kg)</label>
        <input type="number"
               name="weight"
               step="0.01"
               min="0"
               value="<%= selectedPet.getWeight() %>">

        <button type="submit">
            Update Pet
        </button>

    </form>

    <a href="my-pets.jsp" class="back">
        ← Back to My Pets
    </a>

</div>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>
</html>