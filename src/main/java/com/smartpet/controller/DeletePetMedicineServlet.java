package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.PetMedicineDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeletePetMedicineServlet")
public class DeletePetMedicineServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int petMedicineId = Integer.parseInt(
                request.getParameter("petMedicineId"));

        String petId = request.getParameter("petId");

        PetMedicineDAO petMedicineDAO =
                new PetMedicineDAO();

        boolean deleted =
                petMedicineDAO.deletePetMedicine(petMedicineId);

        if (deleted) {

            response.sendRedirect(
                    "pet-medicines.jsp?petId=" + petId);

        } else {

            response.getWriter().println(
                    "Pet medicine could not be deleted!");
        }
    }
}
