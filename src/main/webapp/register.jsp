<%@ page import="java.util.List" %>
<%@ page import="com.smartpet.model.*" %>
<%@ page import="com.smartpet.dao.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SmartPet - Register</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f7f5;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 50px auto;
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
            margin-top: 12px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 25px;
            border: none;
            border-radius: 6px;
            background: #198754;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #146c43;
        }

        .login {
            text-align: center;
            margin-top: 15px;
        }

        .login a {
            text-decoration: none;
            color: #198754;
        }
    </style>
    <link rel="stylesheet" href="smartpet.css">
</head>

<body>

<div class="container">
    <img class="auth-image" src="images/pets.svg" alt="SmartPet pets">

    <h2>🐾 SmartPet Registration</h2>

    <form action="RegisterServlet" method="post">

        <label>Full Name</label>
        <input type="text" name="fullName" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <label>Phone</label>
        <input type="text" name="phone">

        <button type="submit">Register</button>

    </form>

    <div class="login">
        Already have an account?
        <a href="login.jsp">Login</a>
    </div>

</div>

</body>
</html>