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
    MedicineDAO medicineDAO = new MedicineDAO();

    List<Pet> pets = petDAO.getAllPets();
    List<Medicine> medicines = medicineDAO.getAllMedicines();
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Assign Medicine - SmartPet</title>

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
<div class="page-banner" style="background-image:url('https://images.unsplash.com/photo-1516734212186-a967f81ad0d7?auto=format&fit=crop&w=1200&q=80')">
  <div class="banner-content">
    <h1>💊 Assign Medicine to Pet</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>



<div class="container">

    <h2>💊 Assign Medicine to Pet</h2>


    <form action="AddPetMedicineServlet" method="post">


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


        <label>Select Medicine</label>

        <select name="medicineId" required>

            <option value="">-- Select Medicine --</option>

            <% for (Medicine medicine : medicines) { %>

                <option value="<%= medicine.getMedicineId() %>">

                    <%= medicine.getMedicineName() %>
                    -
                    <%= medicine.getMedicineType() %>

                </option>

            <% } %>

        </select>


        <label>Dosage</label>

        <input type="text"
               name="dosage"
               placeholder="Example: 1 tablet">


        <label>Frequency</label>

        <input type="text"
               name="frequency"
               placeholder="Example: Twice daily">


        <label>Start Date</label>

        <input type="date"
               name="startDate"
               required>


        <label>End Date</label>

        <input type="date"
               name="endDate">


        <label>Notes</label>

        <textarea name="notes"
                  placeholder="Enter additional notes"></textarea>


        <button type="submit">
            💊 Assign Medicine
        </button>

    </form>


    <a href="dashboard.jsp" class="back">
        ← Back to Dashboard
    </a>

</div>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>

</html>