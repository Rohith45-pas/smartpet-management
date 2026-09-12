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
    int serviceId = Integer.parseInt(
            request.getParameter("serviceId"));

    VeterinaryServiceDAO serviceDAO =
            new VeterinaryServiceDAO();

    VeterinaryService selectedService = null;

    for (VeterinaryService service :
            serviceDAO.getAllVeterinaryServices()) {

        if (service.getServiceId() == serviceId) {
            selectedService = service;
            break;
        }
    }

    if (selectedService == null) {
        out.println("Veterinary service not found!");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Edit Veterinary Service</title>

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
<div class="page-banner" style="background-image:url('https://images.unsplash.com/photo-1583337130417-3346a1be7dee?auto=format&fit=crop&w=1200&q=80')">
  <div class="banner-content">
    <h1>✏️ Edit Veterinary Service</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>



<div class="container">

    <h2>✏️ Edit Veterinary Service</h2>

    <form action="EditVeterinaryServiceServlet" method="post">

        <input type="hidden"
               name="serviceId"
               value="<%= selectedService.getServiceId() %>">


        <label>Service Name</label>

        <input type="text"
               name="serviceName"
               value="<%= selectedService.getServiceName() %>"
               required>


        <label>Veterinarian Name</label>

        <input type="text"
               name="veterinarianName"
               value="<%= selectedService.getVeterinarianName() %>"
               required>


        <label>Clinic Name</label>

        <input type="text"
               name="clinicName"
               value="<%= selectedService.getClinicName() %>"
               required>


        <label>Phone</label>

        <input type="text"
               name="phone"
               value="<%= selectedService.getPhone() %>"
               required>


        <label>Address</label>

        <textarea name="address"
                  required><%= selectedService.getAddress() %></textarea>


        <label>Specialization</label>

        <input type="text"
               name="specialization"
               value="<%= selectedService.getSpecialization() %>"
               required>


        <button type="submit">
            💾 Update Veterinary Service
        </button>

    </form>

    <a href="veterinary-services.jsp" class="back">
        ← Back to Veterinary Services
    </a>

</div>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>
</html>