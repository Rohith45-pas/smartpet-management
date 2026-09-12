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
    AppointmentDAO appointmentDAO = new AppointmentDAO();
    PetDAO petDAO = new PetDAO();
    VeterinaryServiceDAO serviceDAO = new VeterinaryServiceDAO();

    List<Appointment> appointments =
            appointmentDAO.getAllAppointments();

    List<Pet> pets =
            petDAO.getAllPets();

    List<VeterinaryService> services =
            serviceDAO.getAllVeterinaryServices();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Appointments</title>

<style>

body {
    font-family: Arial, sans-serif;
    background-color: #f4f7f9;
    margin: 0;
    padding: 0;
}

.container {
    width: 95%;
    margin: 30px auto;
}

h2 {
    text-align: center;
    color: #2c3e50;
}

.add-btn {
    display: inline-block;
    padding: 10px 15px;
    background-color: #27ae60;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    margin-bottom: 20px;
}

.add-btn:hover {
    background-color: #219150;
}

table {
    width: 100%;
    border-collapse: collapse;
    background-color: white;
    box-shadow: 0 0 10px #ccc;
}

th {
    background-color: #3498db;
    color: white;
    padding: 12px;
}

td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
    text-align: center;
}

tr:hover {
    background-color: #f1f1f1;
}

.edit {
    color: #2980b9;
    text-decoration: none;
}

.delete {
    color: #e74c3c;
    text-decoration: none;
}

.empty {
    text-align: center;
    padding: 30px;
    background-color: white;
}

.back {
    display: inline-block;
    margin-top: 20px;
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
<div class="page-banner" style="background-image:url('https://images.unsplash.com/photo-1628009368231-7bb7cfcb0def?auto=format&fit=crop&w=1200&q=80')">
  <div class="banner-content">
    <h1>📅 Appointments</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>



<div class="container">

    <h2>📅 Pet Appointments</h2>

    <a href="add-appointment.jsp" class="add-btn">
        ➕ Add Appointment
    </a>

    <% if (appointments.isEmpty()) { %>

        <div class="empty">

            <h3>No appointments found.</h3>

            <p>Add your first appointment.</p>

        </div>

    <% } else { %>

        <table>

            <tr>
                <th>ID</th>
                <th>Pet</th>
                <th>Veterinary Service</th>
                <th>Date</th>
                <th>Time</th>
                <th>Reason</th>
                <th>Status</th>
                <th>Notes</th>
                <th>Actions</th>
            </tr>

            <% for (Appointment appointment : appointments) { %>

            <tr>

                <td>
                    <%= appointment.getAppointmentId() %>
                </td>

                <td>

                    <%
                        String petName = "Unknown Pet";

                        for (Pet pet : pets) {

                            if (pet.getPetId() ==
                                    appointment.getPetId()) {

                                petName = pet.getPetName();
                                break;
                            }
                        }
                    %>

                    <%= petName %>

                </td>

                <td>

                    <%
                        String serviceName = "Unknown Service";

                        for (VeterinaryService service : services) {

                            if (service.getServiceId() ==
                                    appointment.getServiceId()) {

                                serviceName =
                                        service.getServiceName();

                                break;
                            }
                        }
                    %>

                    <%= serviceName %>

                </td>

                <td>
                    <%= appointment.getAppointmentDate() %>
                </td>

                <td>
                    <%= appointment.getAppointmentTime() %>
                </td>

                <td>
                    <%= appointment.getReason() %>
                </td>

                <td>
                    <%= appointment.getStatus() %>
                </td>

                <td>
                    <%= appointment.getNotes() %>
                </td>

                <td>

                    <a href="edit-appointment.jsp?appointmentId=<%= appointment.getAppointmentId() %>"
                       class="edit">
                        ✏️ Edit
                    </a>

                    &nbsp; | &nbsp;

                    <a href="DeleteAppointmentServlet?appointmentId=<%= appointment.getAppointmentId() %>"
                       class="delete"
                       onclick="return confirm('Are you sure you want to delete this appointment?');">
                        🗑️ Delete
                    </a>

                </td>

            </tr>

            <% } %>

        </table>

    <% } %>

    <br>

    <a href="dashboard.jsp" class="back">
        ← Back to Dashboard
    </a>

</div>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>
</html>