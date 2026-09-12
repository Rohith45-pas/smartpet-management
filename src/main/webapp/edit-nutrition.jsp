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
    int nutritionId =
            Integer.parseInt(request.getParameter("nutritionId"));

    int petId =
            Integer.parseInt(request.getParameter("petId"));

    NutritionDAO nutritionDAO =
            new NutritionDAO();

    List<Nutrition> nutritionList =
            nutritionDAO.getNutritionByPetId(petId);

    Nutrition selectedNutrition = null;

    for (Nutrition nutrition : nutritionList) {

        if (nutrition.getNutritionId() == nutritionId) {
            selectedNutrition = nutrition;
            break;
        }
    }

    if (selectedNutrition == null) {
        response.getWriter().println(
                "Nutrition record not found!");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Nutrition - SmartPet</title>

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

        input,
        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        textarea {
            height: 80px;
            resize: vertical;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 25px;
            background: #198754;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background: #146c43;
        }

        .back {
            display: block;
            text-align: center;
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
    <h1>✏️ Edit Nutrition</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>



<div class="container">

    <h2>✏️ Edit Nutrition</h2>

    <form action="EditNutritionServlet" method="post">

        <input type="hidden"
               name="nutritionId"
               value="<%= selectedNutrition.getNutritionId() %>">

        <input type="hidden"
               name="petId"
               value="<%= petId %>">


        <label>Food Name</label>

        <input type="text"
               name="foodName"
               value="<%= selectedNutrition.getFoodName() %>"
               required>


        <label>Food Type</label>

        <select name="foodType" required>

            <option value="Dry Food"
                <%= "Dry Food".equals(selectedNutrition.getFoodType())
                    ? "selected" : "" %>>
                Dry Food
            </option>

            <option value="Wet Food"
                <%= "Wet Food".equals(selectedNutrition.getFoodType())
                    ? "selected" : "" %>>
                Wet Food
            </option>

            <option value="Homemade"
                <%= "Homemade".equals(selectedNutrition.getFoodType())
                    ? "selected" : "" %>>
                Homemade
            </option>

            <option value="Treat"
                <%= "Treat".equals(selectedNutrition.getFoodType())
                    ? "selected" : "" %>>
                Treat
            </option>

            <option value="Vegetable"
                <%= "Vegetable".equals(selectedNutrition.getFoodType())
                    ? "selected" : "" %>>
                Vegetable
            </option>

            <option value="Fruit"
                <%= "Fruit".equals(selectedNutrition.getFoodType())
                    ? "selected" : "" %>>
                Fruit
            </option>

            <option value="Other"
                <%= "Other".equals(selectedNutrition.getFoodType())
                    ? "selected" : "" %>>
                Other
            </option>

        </select>


        <label>Quantity</label>

        <input type="text"
               name="quantity"
               value="<%= selectedNutrition.getQuantity() %>"
               required>


        <label>Feeding Time</label>

        <input type="time"
               name="feedingTime"
               value="<%= selectedNutrition.getFeedingTime() %>"
               required>


        <label>Notes</label>

        <textarea name="notes"><%= selectedNutrition.getNotes() %></textarea>


        <button type="submit">
            Update Nutrition
        </button>

    </form>


    <a href="nutrition.jsp?petId=<%= petId %>"
       class="back">
        ← Back to Nutrition
    </a>

</div>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>

</html>