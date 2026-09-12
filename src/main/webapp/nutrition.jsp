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
    String petIdParameter = request.getParameter("petId");
    if (petIdParameter == null || petIdParameter.trim().isEmpty()) {
        response.sendRedirect("my-pets.jsp");
        return;
    }
    int petId = Integer.parseInt(petIdParameter);

    NutritionDAO nutritionDAO = new NutritionDAO();
    PetDAO petDAO = new PetDAO();

    List<Nutrition> nutritionList =
            nutritionDAO.getNutritionByPetId(petId);

    Pet selectedPet = null;

    List<Pet> pets = petDAO.getAllPets();

    for (Pet pet : pets) {
        if (pet.getPetId() == petId) {
            selectedPet = pet;
            break;
        }
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Pet Nutrition - SmartPet</title>

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
            padding: 12px 18px;
            text-decoration: none;
            border-radius: 6px;
        }

        .add-button:hover {
            background: #146c43;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        th {
            background: #198754;
            color: white;
            padding: 12px;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        tr:hover {
            background: #f5f5f5;
        }

        .edit {
            color: #0d6efd;
            text-decoration: none;
        }

        .delete {
            color: #dc3545;
            text-decoration: none;
        }

        .back {
            display: inline-block;
            margin-top: 20px;
            color: #198754;
            text-decoration: none;
        }

        .empty {
            background: white;
            padding: 30px;
            text-align: center;
            border-radius: 10px;
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
<div class="page-banner" style="background-image:url('https://images.unsplash.com/photo-1629909613654-28e377c37b09?auto=format&fit=crop&w=1200&q=80')">
  <div class="banner-content">
    <h1>🥗 Nutrition</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>



<div class="container">

    <div class="top">

        <div>

            <h2>🍎 Nutrition Records</h2>

            <% if (selectedPet != null) { %>

                <p>
                    Pet:
                    <strong>
                        <%= selectedPet.getPetName() %>
                    </strong>
                </p>

            <% } %>

        </div>


        <a href="add-nutrition.jsp"
           class="add-button">
            ➕ Add Nutrition
        </a>

    </div>


    <% if (nutritionList.isEmpty()) { %>

        <div class="empty">

            <h3>No nutrition records found.</h3>

            <p>Add a nutrition record for this pet.</p>

        </div>

    <% } else { %>


        <table>

            <tr>

                <th>Food Name</th>
                <th>Food Type</th>
                <th>Quantity</th>
                <th>Feeding Time</th>
                <th>Notes</th>
                <th>Actions</th>

            </tr>


            <% for (Nutrition nutrition : nutritionList) { %>

                <tr>

                    <td>
                        <%= nutrition.getFoodName() %>
                    </td>

                    <td>
                        <%= nutrition.getFoodType() %>
                    </td>

                    <td>
                        <%= nutrition.getQuantity() %>
                    </td>

                    <td>
                        <%= nutrition.getFeedingTime() %>
                    </td>

                    <td>
                        <%= nutrition.getNotes() %>
                    </td>

                    <td>

                        <a href="edit-nutrition.jsp?nutritionId=<%= nutrition.getNutritionId() %>&petId=<%= petId %>"
                           class="edit">
                            ✏️ Edit
                        </a>

                        &nbsp; | &nbsp;

                        <a href="DeleteNutritionServlet?nutritionId=<%= nutrition.getNutritionId() %>&petId=<%= petId %>"
                           class="delete"
                           onclick="return confirm('Are you sure you want to delete this nutrition record?');">
                            🗑️ Delete
                        </a>

                    </td>

                </tr>

            <% } %>

        </table>

    <% } %>


    <a href="my-pets.jsp" class="back">
        ← Back to My Pets
    </a>

</div>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>

</html>