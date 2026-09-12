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

    <title>Add Medicine - SmartPet</title>

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
<div class="page-banner" style="background-image:url('https://images.unsplash.com/photo-1583337130417-3346a1be7dee?auto=format&fit=crop&w=1200&q=80')">
  <div class="banner-content">
    <h1>💊 Add Medicine</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>



<div class="container">

    <h2>💊 Add Medicine</h2>


    <form action="AddMedicineServlet" method="post">


        <label>Medicine Name</label>

        <input type="text"
               name="medicineName"
               placeholder="Enter medicine name"
               required>


        <label>Medicine Type</label>

        <select name="medicineType" required>

            <option value="">-- Select Type --</option>

            <option value="Tablet">Tablet</option>

            <option value="Syrup">Syrup</option>

            <option value="Capsule">Capsule</option>

            <option value="Injection">Injection</option>

            <option value="Cream">Cream</option>

            <option value="Ointment">Ointment</option>

            <option value="Drops">Drops</option>

            <option value="Powder">Powder</option>

            <option value="Other">Other</option>

        </select>


        <label>Purpose</label>

        <input type="text"
               name="purpose"
               placeholder="Example: General treatment">


        <label>Dosage Information</label>

        <textarea name="dosageInfo"
                  placeholder="Enter general dosage information"></textarea>


        <label>Precautions</label>

        <textarea name="precautions"
                  placeholder="Enter precautions"></textarea>


        <button type="submit">
            ➕ Add Medicine
        </button>

    </form>


    <a href="dashboard.jsp" class="back">
        ← Back to Dashboard
    </a>

</div>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>

</html>