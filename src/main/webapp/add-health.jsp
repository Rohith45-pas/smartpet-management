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
    <title>SmartPet - Add Health Record</title>

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
            width: 500px;
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

        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        textarea {
            height: 90px;
            resize: vertical;
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
<div class="page-banner" style="background-image:url('https://images.unsplash.com/photo-1628009368231-7bb7cfcb0def?auto=format&fit=crop&w=1200&q=80')">
  <div class="banner-content">
    <h1>❤️ Add Health Record</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>


<div class="container">

    <h2>🩺 Add Health Record</h2>

    <form action="AddHealthServlet" method="post">

        <label>Select Pet</label>

        <select name="petId" required>

            <option value="">-- Select Pet --</option>

            <% for (Pet pet : pets) { %>

                <option value="<%= pet.getPetId() %>">
                    <%= pet.getPetName() %>
                    (<%= pet.getSpecies() %>)
                </option>

            <% } %>

        </select>


        <label>Health Date</label>

        <input type="date"
               name="healthDate"
               required>


        <label>Condition / Problem</label>

        <input type="text"
               name="conditionName"
               placeholder="Example: Fever, Skin infection"
               required>


        <label>Description</label>

        <textarea name="description"
                  placeholder="Describe the pet's health condition"></textarea>


        <label>Treatment</label>

        <textarea name="treatment"
                  placeholder="Enter treatment or medicine details"></textarea>


        <button type="submit">
            Save Health Record
        </button>

    </form>

    <a href="dashboard.jsp" class="back">
        ← Back to Dashboard
    </a>

</div>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>
</html>