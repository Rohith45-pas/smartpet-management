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
    <title>Add Pet Business</title>
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
<div class="page-banner" style="background-image:url('https://images.unsplash.com/photo-1568640347023-a616a30bc3bd?auto=format&fit=crop&w=1200&q=80')">
  <div class="banner-content">
    <h1>🏪 Add Pet Business</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>



    <h2>Add Pet Business</h2>

    <form action="AddPetBusinessServlet" method="post">

        <label>Business Name:</label><br>
        <input type="text" name="businessName" required><br><br>

        <label>Business Type:</label><br>
        <select name="businessType" required>
            <option value="">Select Type</option>
            <option value="Pet Shop">Pet Shop</option>
            <option value="Veterinary Clinic">Veterinary Clinic</option>
            <option value="Pet Grooming">Pet Grooming</option>
            <option value="Pet Training">Pet Training</option>
            <option value="Pet Boarding">Pet Boarding</option>
            <option value="Pet Adoption">Pet Adoption</option>
            <option value="Other">Other</option>
        </select>
        <br><br>

        <label>Phone:</label><br>
        <input type="text" name="phone"><br><br>

        <label>Email:</label><br>
        <input type="email" name="email"><br><br>

        <label>Address:</label><br>
        <input type="text" name="address"><br><br>

        <label>Description:</label><br>
        <textarea name="description" rows="5" cols="40"></textarea>
        <br><br>

        <button type="submit">Add Business</button>

    </form>

    <br>

    <a href="pet-businesses.jsp">View Pet Businesses</a>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>
</html>