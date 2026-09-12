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

    <title>Add Grooming - SmartPet</title>

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
<div class="page-banner" style="background-image:url('https://images.unsplash.com/photo-1552053831-71594a27632d?auto=format&fit=crop&w=1200&q=80')">
  <div class="banner-content">
    <h1>✂️ Add Grooming Record</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>



<div class="container">

    <h2>✂️ Add Grooming Record</h2>

    <form action="AddGroomingServlet" method="post">

        <label>Select Pet</label>

        <select name="petId" required>

            <option value="">-- Select Pet --</option>

            <% for (Pet pet : pets) { %>

                <option value="<%= pet.getPetId() %>">

                    <%= pet.getPetName() %>
                    -
                    <%= pet.getSpecies() %>

                </option>

            <% } %>

        </select>


        <label>Grooming Type</label>

        <select name="groomingType" required>

            <option value="">-- Select Grooming Type --</option>

            <option value="Bath">Bath</option>
            <option value="Hair Cutting">Hair Cutting</option>
            <option value="Nail Trimming">Nail Trimming</option>
            <option value="Brushing">Brushing</option>
            <option value="Ear Cleaning">Ear Cleaning</option>
            <option value="Teeth Cleaning">Teeth Cleaning</option>
            <option value="Full Grooming">Full Grooming</option>
            <option value="Other">Other</option>

        </select>


        <label>Grooming Date</label>

        <input type="date"
               name="groomingDate"
               required>


        <label>Next Due Date</label>

        <input type="date"
               name="nextDueDate">


        <label>Notes</label>

        <textarea name="notes"
                  placeholder="Enter grooming notes..."></textarea>


        <button type="submit">
            Add Grooming
        </button>

    </form>


    <a href="dashboard.jsp" class="back">
        ← Back to Dashboard
    </a>

</div>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>

</html>