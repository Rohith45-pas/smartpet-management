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
    <title>Pet Businesses</title>
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
<div class="page-banner" style="background-image:url('https://images.unsplash.com/photo-1552053831-71594a27632d?auto=format&fit=crop&w=1200&q=80')">
  <div class="banner-content">
    <h1>🏪 Pet Businesses</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>



    <h2>Pet Businesses</h2>

    <a href="add-pet-business.jsp">Add Pet Business</a>

    <br><br>

    <table border="1" cellpadding="10">

        <tr>
            <th>ID</th>
            <th>Business Name</th>
            <th>Type</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>

        <%
            PetBusinessDAO dao = new PetBusinessDAO();
            List<PetBusiness> businesses = dao.getAllBusinesses();

            for (PetBusiness business : businesses) {
        %>

        <tr>

            <td><%= business.getBusinessId() %></td>

            <td><%= business.getBusinessName() %></td>

            <td><%= business.getBusinessType() %></td>

            <td><%= business.getPhone() %></td>

            <td><%= business.getEmail() %></td>

            <td><%= business.getAddress() %></td>

            <td><%= business.getDescription() %></td>

            <td>
                <a href="edit-pet-business.jsp?id=<%= business.getBusinessId() %>">
                    Edit
                </a>

                |

                <a href="DeletePetBusinessServlet?id=<%= business.getBusinessId() %>"
                   onclick="return confirm('Are you sure you want to delete this business?');">
                    Delete
                </a>
            </td>

        </tr>

        <%
            }
        %>

    </table>

    <br>

    <a href="dashboard.jsp">Back to Dashboard</a>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>
</html>