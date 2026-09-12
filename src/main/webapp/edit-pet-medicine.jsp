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
    int petMedicineId =
            Integer.parseInt(request.getParameter("petMedicineId"));

    int petId =
            Integer.parseInt(request.getParameter("petId"));

    PetMedicineDAO petMedicineDAO =
            new PetMedicineDAO();

    MedicineDAO medicineDAO =
            new MedicineDAO();

    List<PetMedicine> petMedicines =
            petMedicineDAO.getPetMedicinesByPetId(petId);

    List<Medicine> medicines =
            medicineDAO.getAllMedicines();

    PetMedicine selectedRecord = null;

    for (PetMedicine record : petMedicines) {

        if (record.getPetMedicineId() == petMedicineId) {
            selectedRecord = record;
            break;
        }
    }

    if (selectedRecord == null) {
        response.getWriter().println(
                "Pet medicine record not found!");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Pet Medicine - SmartPet</title>

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
<div class="page-banner" style="background-image:url('https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&w=1200&q=80')">
  <div class="banner-content">
    <h1>✏️ Edit Pet Medicine</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>



<div class="container">

    <h2>✏️ Edit Pet Medicine</h2>


    <form action="EditPetMedicineServlet" method="post">

        <input type="hidden"
               name="petMedicineId"
               value="<%= selectedRecord.getPetMedicineId() %>">


        <input type="hidden"
               name="petId"
               value="<%= petId %>">


        <label>Select Medicine</label>

        <select name="medicineId" required>

            <% for (Medicine medicine : medicines) { %>

                <option value="<%= medicine.getMedicineId() %>"
                    <%= medicine.getMedicineId()
                        == selectedRecord.getMedicineId()
                        ? "selected" : "" %>>

                    <%= medicine.getMedicineName() %>
                    -
                    <%= medicine.getMedicineType() %>

                </option>

            <% } %>

        </select>


        <label>Dosage</label>

        <input type="text"
               name="dosage"
               value="<%= selectedRecord.getDosage() %>">


        <label>Frequency</label>

        <input type="text"
               name="frequency"
               value="<%= selectedRecord.getFrequency() %>">


        <label>Start Date</label>

        <input type="date"
               name="startDate"
               value="<%= selectedRecord.getStartDate() %>"
               required>


        <label>End Date</label>

        <input type="date"
               name="endDate"
               value="<%= selectedRecord.getEndDate() %>">


        <label>Notes</label>

        <textarea name="notes"><%= selectedRecord.getNotes() %></textarea>


        <button type="submit">
            Update Pet Medicine
        </button>

    </form>


    <a href="pet-medicines.jsp?petId=<%= petId %>"
       class="back">
        ← Back to Pet Medicines
    </a>

</div>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>

</html>