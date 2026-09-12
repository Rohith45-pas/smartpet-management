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
    int businessId = Integer.parseInt(request.getParameter("id"));

    PetBusinessDAO dao = new PetBusinessDAO();
    PetBusiness business = null;

    for (PetBusiness b : dao.getAllBusinesses()) {
        if (b.getBusinessId() == businessId) {
            business = b;
            break;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Pet Business</title>
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
<div class="page-banner" style="background-image:url('https://images.unsplash.com/photo-1629909613654-28e377c37b09?auto=format&fit=crop&w=1200&q=80')">
  <div class="banner-content">
    <h1>✏️ Edit Pet Business</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>



<h2>Edit Pet Business</h2>

<% if (business != null) { %>

<form action="EditPetBusinessServlet" method="post">

    <input type="hidden" name="businessId"
           value="<%= business.getBusinessId() %>">

    <label>Business Name:</label><br>
    <input type="text" name="businessName"
           value="<%= business.getBusinessName() %>" required>
    <br><br>

    <label>Business Type:</label><br>
    <select name="businessType" required>

        <option value="Pet Shop"
            <%= "Pet Shop".equals(business.getBusinessType()) ? "selected" : "" %>>
            Pet Shop
        </option>

        <option value="Veterinary Clinic"
            <%= "Veterinary Clinic".equals(business.getBusinessType()) ? "selected" : "" %>>
            Veterinary Clinic
        </option>

        <option value="Pet Grooming"
            <%= "Pet Grooming".equals(business.getBusinessType()) ? "selected" : "" %>>
            Pet Grooming
        </option>

        <option value="Pet Training"
            <%= "Pet Training".equals(business.getBusinessType()) ? "selected" : "" %>>
            Pet Training
        </option>

        <option value="Pet Boarding"
            <%= "Pet Boarding".equals(business.getBusinessType()) ? "selected" : "" %>>
            Pet Boarding
        </option>

        <option value="Pet Adoption"
            <%= "Pet Adoption".equals(business.getBusinessType()) ? "selected" : "" %>>
            Pet Adoption
        </option>

        <option value="Other"
            <%= "Other".equals(business.getBusinessType()) ? "selected" : "" %>>
            Other
        </option>

    </select>

    <br><br>

    <label>Phone:</label><br>
    <input type="text" name="phone"
           value="<%= business.getPhone() %>">
    <br><br>

    <label>Email:</label><br>
    <input type="email" name="email"
           value="<%= business.getEmail() %>">
    <br><br>

    <label>Address:</label><br>
    <input type="text" name="address"
           value="<%= business.getAddress() %>">
    <br><br>

    <label>Description:</label><br>
    <textarea name="description" rows="5" cols="40"><%= business.getDescription() %></textarea>
    <br><br>

    <button type="submit">Update Business</button>

</form>

<% } else { %>

    <p>Business not found.</p>

<% } %>

<br>

<a href="pet-businesses.jsp">Back to Pet Businesses</a>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>
</html>