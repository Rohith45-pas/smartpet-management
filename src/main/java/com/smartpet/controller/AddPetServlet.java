package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.PetDAO;
import com.smartpet.model.Pet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddPetServlet")
public class AddPetServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String petName = request.getParameter("petName");
        String species = request.getParameter("species");
        String breed = request.getParameter("breed");

        int age = Integer.parseInt(request.getParameter("age"));
        double weight = Double.parseDouble(request.getParameter("weight"));

        Pet pet = new Pet(
                petName,
                species,
                breed,
                age,
                weight
        );

        PetDAO petDAO = new PetDAO();

        boolean added = petDAO.addPet(pet);

        if (added) {
            response.sendRedirect("my-pets.jsp");
        } else {
            response.getWriter().println("Pet could not be added!");
        }
    }
}
