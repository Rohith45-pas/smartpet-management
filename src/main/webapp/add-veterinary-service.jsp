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

<title>Add Veterinary Service</title>

<style>

body {
    font-family: Arial, sans-serif;
    background-color: #f4f7f9;
    margin: 0;
    padding: 0;
}

.container {
    width: 500px;
    margin: 40px auto;
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 0 10px #ccc;
}

h2 {
    text-align: center;
    color: #2c3e50;
}

label {
    display: block;
    margin-top: 15px;
    font-weight: bold;
}

input,
textarea {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 5px;
}

textarea {
    height: 80px;
    resize: vertical;
}

button {
    width: 100%;
    margin-top: 20px;
    padding: 12px;
    border: none;
    border-radius: 5px;
    background-color: #3498db;
    color: white;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background-color: #2980b9;
}

.back {
    display: block;
    text-align: center;
    margin-top: 15px;
    text-decoration: none;
    color: #3498db;
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
<div class="page-banner" style="background-image:url('https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&w=1200&q=80')">
  <div class="banner-content">
    <h1>🏥 Add Veterinary Service</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>



<div class="container">

    <h2>🏥 Add Veterinary Service</h2>

    <form action="AddVeterinaryServiceServlet" method="post">

        <label>Service Name</label>

        <input type="text"
               name="serviceName"
               placeholder="Example: General Consultation"
               required>


        <label>Veterinarian Name</label>

        <input type="text"
               name="veterinarianName"
               placeholder="Enter veterinarian name"
               required>


        <label>Clinic Name</label>

        <input type="text"
               name="clinicName"
               placeholder="Enter clinic name"
               required>


        <label>Phone</label>

        <input type="text"
               name="phone"
               placeholder="Enter phone number"
               required>


        <label>Address</label>

        <textarea name="address"
                  placeholder="Enter clinic address"
                  required></textarea>


        <label>Specialization</label>

        <input type="text"
               name="specialization"
               placeholder="Example: Pet Surgery, Dermatology"
               required>


        <button type="submit">
            ➕ Add Veterinary Service
        </button>

    </form>

    <a href="veterinary-services.jsp" class="back">
        ← Back to Veterinary Services
    </a>

</div>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>
</html>