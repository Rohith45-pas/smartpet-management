package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.UserDAO;
import com.smartpet.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        User user = new User(
                fullName,
                email,
                password,
                phone
        );

        UserDAO userDAO = new UserDAO();

        boolean registered = userDAO.registerUser(user);

        if (registered) {
            response.sendRedirect("login.jsp");
        } else {
            response.getWriter().println("Registration failed!");
        }
    }
}
