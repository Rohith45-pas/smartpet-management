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
    int appointmentId = Integer.parseInt(
            request.getParameter("appointmentId"));

    AppointmentDAO appointmentDAO = new AppointmentDAO();
    PetDAO petDAO = new PetDAO();
    VeterinaryServiceDAO serviceDAO = new VeterinaryServiceDAO();

    Appointment selectedAppointment = null;

    for (Appointment appointment :
            appointmentDAO.getAllAppointments()) {

        if (appointment.getAppointmentId() == appointmentId) {
            selectedAppointment = appointment;
            break;
        }
    }

    if (selectedAppointment == null) {
        out.println("Appointment not found!");
        return;
    }

    List<Pet> pets = petDAO.getAllPets();
    List<VeterinaryService> services =
            serviceDAO.getAllVeterinaryServices();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Edit Appointment</title>

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

select,
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
    <h1>✏️ Edit Appointment</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>



<div class="container">

    <h2>✏️ Edit Appointment</h2>

    <form action="EditAppointmentServlet" method="post">

        <input type="hidden"
               name="appointmentId"
               value="<%= selectedAppointment.getAppointmentId() %>">


        <label>Select Pet</label>

        <select name="petId" required>

            <% for (Pet pet : pets) { %>

                <option value="<%= pet.getPetId() %>"
                    <%= pet.getPetId() == selectedAppointment.getPetId()
                        ? "selected" : "" %>>

                    <%= pet.getPetName() %> -
                    <%= pet.getSpecies() %>

                </option>

            <% } %>

        </select>


        <label>Veterinary Service</label>

        <select name="serviceId" required>

            <% for (VeterinaryService service : services) { %>

                <option value="<%= service.getServiceId() %>"
                    <%= service.getServiceId() == selectedAppointment.getServiceId()
                        ? "selected" : "" %>>

                    <%= service.getServiceName() %> -
                    <%= service.getClinicName() %>

                </option>

            <% } %>

        </select>


        <label>Appointment Date</label>

        <input type="date"
               name="appointmentDate"
               value="<%= selectedAppointment.getAppointmentDate() %>"
               required>


        <label>Appointment Time</label>

        <input type="time"
               name="appointmentTime"
               value="<%= selectedAppointment.getAppointmentTime() %>"
               required>


        <label>Reason</label>

        <input type="text"
               name="reason"
               value="<%= selectedAppointment.getReason() %>"
               required>


        <label>Status</label>

        <select name="status" required>

            <option value="Scheduled"
                <%= "Scheduled".equals(selectedAppointment.getStatus())
                    ? "selected" : "" %>>
                Scheduled
            </option>

            <option value="Completed"
                <%= "Completed".equals(selectedAppointment.getStatus())
                    ? "selected" : "" %>>
                Completed
            </option>

            <option value="Cancelled"
                <%= "Cancelled".equals(selectedAppointment.getStatus())
                    ? "selected" : "" %>>
                Cancelled
            </option>

        </select>


        <label>Notes</label>

        <textarea name="notes"><%= selectedAppointment.getNotes() %></textarea>


        <button type="submit">
            💾 Update Appointment
        </button>

    </form>

    <a href="appointments.jsp" class="back">
        ← Back to Appointments
    </a>

</div>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>
</html>