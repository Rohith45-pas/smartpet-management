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
    int groomingId =
            Integer.parseInt(request.getParameter("groomingId"));

    int petId =
            Integer.parseInt(request.getParameter("petId"));

    GroomingDAO groomingDAO =
            new GroomingDAO();

    List<Grooming> groomingList =
            groomingDAO.getGroomingByPetId(petId);

    Grooming selectedGrooming = null;

    for (Grooming grooming : groomingList) {

        if (grooming.getGroomingId() == groomingId) {
            selectedGrooming = grooming;
            break;
        }
    }

    if (selectedGrooming == null) {
        response.getWriter().println(
                "Grooming record not found!");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Grooming - SmartPet</title>

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
        select,
        textarea {
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
<div class="page-banner" style="background-image:url('https://images.unsplash.com/photo-1581888227599-779811939961?auto=format&fit=crop&w=1200&q=80')">
  <div class="banner-content">
    <h1>✏️ Edit Grooming Record</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>



<div class="container">

    <h2>✏️ Edit Grooming Record</h2>

    <form action="EditGroomingServlet" method="post">

        <input type="hidden"
               name="groomingId"
               value="<%= selectedGrooming.getGroomingId() %>">

        <input type="hidden"
               name="petId"
               value="<%= petId %>">


        <label>Grooming Type</label>

        <select name="groomingType" required>

            <option value="Bath"
                <%= "Bath".equals(selectedGrooming.getGroomingType())
                    ? "selected" : "" %>>
                Bath
            </option>

            <option value="Hair Cutting"
                <%= "Hair Cutting".equals(selectedGrooming.getGroomingType())
                    ? "selected" : "" %>>
                Hair Cutting
            </option>

            <option value="Nail Trimming"
                <%= "Nail Trimming".equals(selectedGrooming.getGroomingType())
                    ? "selected" : "" %>>
                Nail Trimming
            </option>

            <option value="Brushing"
                <%= "Brushing".equals(selectedGrooming.getGroomingType())
                    ? "selected" : "" %>>
                Brushing
            </option>

            <option value="Ear Cleaning"
                <%= "Ear Cleaning".equals(selectedGrooming.getGroomingType())
                    ? "selected" : "" %>>
                Ear Cleaning
            </option>

            <option value="Teeth Cleaning"
                <%= "Teeth Cleaning".equals(selectedGrooming.getGroomingType())
                    ? "selected" : "" %>>
                Teeth Cleaning
            </option>

            <option value="Full Grooming"
                <%= "Full Grooming".equals(selectedGrooming.getGroomingType())
                    ? "selected" : "" %>>
                Full Grooming
            </option>

            <option value="Other"
                <%= "Other".equals(selectedGrooming.getGroomingType())
                    ? "selected" : "" %>>
                Other
            </option>

        </select>


        <label>Grooming Date</label>

        <input type="date"
               name="groomingDate"
               value="<%= selectedGrooming.getGroomingDate() %>"
               required>


        <label>Next Due Date</label>

        <input type="date"
               name="nextDueDate"
               value="<%= selectedGrooming.getNextDueDate() %>">


        <label>Notes</label>

        <textarea name="notes"><%= selectedGrooming.getNotes() %></textarea>


        <button type="submit">
            Update Grooming
        </button>

    </form>


    <a href="grooming.jsp?petId=<%= petId %>"
       class="back">
        ← Back to Grooming
    </a>

</div>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>

</html>