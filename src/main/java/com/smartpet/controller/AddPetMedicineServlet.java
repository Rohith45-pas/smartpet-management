package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.PetMedicineDAO;
import com.smartpet.model.PetMedicine;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddPetMedicineServlet")
public class AddPetMedicineServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        int petId = Integer.parseInt(
                request.getParameter("petId"));

        int medicineId = Integer.parseInt(
                request.getParameter("medicineId"));

        String dosage =
                request.getParameter("dosage");

        String frequency =
                request.getParameter("frequency");

        String startDate =
                request.getParameter("startDate");

        String endDate =
                request.getParameter("endDate");

        String notes =
                request.getParameter("notes");

        PetMedicine petMedicine = new PetMedicine(
                petId,
                medicineId,
                dosage,
                frequency,
                startDate,
                endDate,
                notes
        );

        PetMedicineDAO petMedicineDAO =
                new PetMedicineDAO();

        boolean added =
                petMedicineDAO.addPetMedicine(petMedicine);

        if (added) {

            response.sendRedirect(
                    "pet-medicines.jsp?petId=" + petId);

        } else {

            response.getWriter().println(
                    "Medicine could not be assigned to the pet!");
        }
    }
}