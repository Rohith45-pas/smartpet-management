package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.PetBusinessDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeletePetBusinessServlet")
public class DeletePetBusinessServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int businessId = Integer.parseInt(
                request.getParameter("id")
        );

        PetBusinessDAO dao = new PetBusinessDAO();

        dao.deleteBusiness(businessId);

        response.sendRedirect("pet-businesses.jsp");
    }
}
