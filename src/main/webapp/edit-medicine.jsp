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
    int medicineId =
            Integer.parseInt(request.getParameter("medicineId"));

    MedicineDAO medicineDAO =
            new MedicineDAO();

    List<Medicine> medicines =
            medicineDAO.getAllMedicines();

    Medicine selectedMedicine = null;

    for (Medicine medicine : medicines) {

        if (medicine.getMedicineId() == medicineId) {
            selectedMedicine = medicine;
            break;
        }
    }

    if (selectedMedicine == null) {
        response.getWriter().println("Medicine not found!");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Medicine - SmartPet</title>

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
        textarea,
        select {
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
    <h1>✏️ Edit Medicine</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>



<div class="container">

    <h2>✏️ Edit Medicine</h2>


    <form action="EditMedicineServlet" method="post">

        <input type="hidden"
               name="medicineId"
               value="<%= selectedMedicine.getMedicineId() %>">


        <label>Medicine Name</label>

        <input type="text"
               name="medicineName"
               value="<%= selectedMedicine.getMedicineName() %>"
               required>


        <label>Medicine Type</label>

        <select name="medicineType" required>

            <option value="Tablet"
                <%= "Tablet".equals(selectedMedicine.getMedicineType()) ? "selected" : "" %>>
                Tablet
            </option>

            <option value="Syrup"
                <%= "Syrup".equals(selectedMedicine.getMedicineType()) ? "selected" : "" %>>
                Syrup
            </option>

            <option value="Capsule"
                <%= "Capsule".equals(selectedMedicine.getMedicineType()) ? "selected" : "" %>>
                Capsule
            </option>

            <option value="Injection"
                <%= "Injection".equals(selectedMedicine.getMedicineType()) ? "selected" : "" %>>
                Injection
            </option>

            <option value="Cream"
                <%= "Cream".equals(selectedMedicine.getMedicineType()) ? "selected" : "" %>>
                Cream
            </option>

            <option value="Ointment"
                <%= "Ointment".equals(selectedMedicine.getMedicineType()) ? "selected" : "" %>>
                Ointment
            </option>

            <option value="Drops"
                <%= "Drops".equals(selectedMedicine.getMedicineType()) ? "selected" : "" %>>
                Drops
            </option>

            <option value="Powder"
                <%= "Powder".equals(selectedMedicine.getMedicineType()) ? "selected" : "" %>>
                Powder
            </option>

            <option value="Other"
                <%= "Other".equals(selectedMedicine.getMedicineType()) ? "selected" : "" %>>
                Other
            </option>

        </select>


        <label>Purpose</label>

        <input type="text"
               name="purpose"
               value="<%= selectedMedicine.getPurpose() %>">


        <label>Dosage Information</label>

        <textarea name="dosageInfo"><%= selectedMedicine.getDosageInfo() %></textarea>


        <label>Precautions</label>

        <textarea name="precautions"><%= selectedMedicine.getPrecautions() %></textarea>


        <button type="submit">
            Update Medicine
        </button>

    </form>


    <a href="medicines.jsp" class="back">
        ← Back to Medicines
    </a>

</div>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>

</html>