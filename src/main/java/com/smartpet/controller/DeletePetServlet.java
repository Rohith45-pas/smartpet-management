package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.PetDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeletePetServlet")
public class DeletePetServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String petIdParameter = request.getParameter("petId");

        System.out.println("Pet ID received: " + petIdParameter);

        int petId = Integer.parseInt(petIdParameter);

        PetDAO petDAO = new PetDAO();

        boolean deleted = petDAO.deletePet(petId);

        System.out.println("Delete result: " + deleted);

        if (deleted) {
            response.sendRedirect("my-pets.jsp");
        } else {
            response.getWriter().println("Pet could not be deleted!");
        }
    }
}
