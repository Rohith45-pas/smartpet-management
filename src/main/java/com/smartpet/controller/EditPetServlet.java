package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.PetDAO;
import com.smartpet.model.Pet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditPetServlet")
public class EditPetServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int petId = Integer.parseInt(request.getParameter("petId"));

        String petName = request.getParameter("petName");
        String species = request.getParameter("species");
        String breed = request.getParameter("breed");

        int age = Integer.parseInt(request.getParameter("age"));
        double weight = Double.parseDouble(request.getParameter("weight"));

        Pet pet = new Pet();

        pet.setPetId(petId);
        pet.setPetName(petName);
        pet.setSpecies(species);
        pet.setBreed(breed);
        pet.setAge(age);
        pet.setWeight(weight);

        PetDAO petDAO = new PetDAO();

        boolean updated = petDAO.updatePet(pet);

        if (updated) {
            response.sendRedirect("my-pets.jsp");
        } else {
            response.getWriter().println("Pet could not be updated!");
        }
    }
}