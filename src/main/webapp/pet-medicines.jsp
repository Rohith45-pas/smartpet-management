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
    String petIdParameter = request.getParameter("petId");

    if (petIdParameter == null) {
        response.sendRedirect("my-pets.jsp");
        return;
    }

    int petId = Integer.parseInt(petIdParameter);

    PetMedicineDAO petMedicineDAO = new PetMedicineDAO();
    MedicineDAO medicineDAO = new MedicineDAO();

    List<PetMedicine> petMedicines =
            petMedicineDAO.getPetMedicinesByPetId(petId);

    List<Medicine> medicines =
            medicineDAO.getAllMedicines();
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Pet Medicines - SmartPet</title>

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
            width: 95%;
            margin: 35px auto;
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        .add-button {
            display: inline-block;
            background: #198754;
            color: white;
            padding: 10px 18px;
            text-decoration: none;
            border-radius: 6px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #198754;
            color: white;
            padding: 12px;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        tr:hover {
            background: #f5f5f5;
        }

        .edit {
            color: #198754;
            text-decoration: none;
        }

        .delete {
            color: red;
            text-decoration: none;
        }

        .back {
            display: block;
            margin-top: 20px;
            color: #198754;
            text-decoration: none;
        }

        .empty {
            text-align: center;
            padding: 30px;
            color: #777;
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
<div class="page-banner" style="background-image:url('https://images.unsplash.com/photo-1628009368231-7bb7cfcb0def?auto=format&fit=crop&w=1200&q=80')">
  <div class="banner-content">
    <h1>💊 Pet Medicines</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>



<div class="container">

    <h2>💊 Pet Medicine Records</h2>


    <a href="add-pet-medicine.jsp" class="add-button">
        ➕ Assign Medicine
    </a>


    <% if (petMedicines.isEmpty()) { %>

        <div class="empty">

            <h3>No medicines assigned to this pet.</h3>

            <p>Assign a medicine to start tracking treatment.</p>

        </div>

    <% } else { %>


        <table>

            <tr>

                <th>ID</th>

                <th>Medicine</th>

                <th>Dosage</th>

                <th>Frequency</th>

                <th>Start Date</th>

                <th>End Date</th>

                <th>Notes</th>

                <th>Action</th>

            </tr>


            <% for (PetMedicine petMedicine : petMedicines) { %>

            <%
                String medicineName = "Unknown Medicine";

                for (Medicine medicine : medicines) {

                    if (medicine.getMedicineId()
                            == petMedicine.getMedicineId()) {

                        medicineName =
                                medicine.getMedicineName();

                        break;
                    }
                }
            %>


            <tr>

                <td>
                    <%= petMedicine.getPetMedicineId() %>
                </td>

                <td>
                    <%= medicineName %>
                </td>

                <td>
                    <%= petMedicine.getDosage() %>
                </td>

                <td>
                    <%= petMedicine.getFrequency() %>
                </td>

                <td>
                    <%= petMedicine.getStartDate() %>
                </td>

                <td>
                    <%= petMedicine.getEndDate() %>
                </td>

                <td>
                    <%= petMedicine.getNotes() %>
                </td>

                <td>

                    <a href="edit-pet-medicine.jsp?petMedicineId=<%= petMedicine.getPetMedicineId() %>&petId=<%= petId %>"
                       class="edit">
                        ✏️ Edit
                    </a>

                    &nbsp; | &nbsp;

                    <a href="DeletePetMedicineServlet?petMedicineId=<%= petMedicine.getPetMedicineId() %>&petId=<%= petId %>"
                       class="delete"
                       onclick="return confirm('Are you sure you want to delete this medicine record?');">
                        🗑️ Delete
                    </a>

                </td>

            </tr>

            <% } %>

        </table>

    <% } %>


    <a href="my-pets.jsp" class="back">
        ← Back to My Pets
    </a>

</div>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>

</html>