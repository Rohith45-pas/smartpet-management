package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.PetMedicineDAO;
import com.smartpet.model.PetMedicine;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditPetMedicineServlet")
public class EditPetMedicineServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        int petMedicineId = Integer.parseInt(
                request.getParameter("petMedicineId"));

        int petId = Integer.parseInt(
                request.getParameter("petId"));

        int medicineId = Integer.parseInt(
                request.getParameter("medicineId"));

        String dosage = request.getParameter("dosage");
        String frequency = request.getParameter("frequency");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String notes = request.getParameter("notes");

        PetMedicine petMedicine = new PetMedicine();

        petMedicine.setPetMedicineId(petMedicineId);
        petMedicine.setPetId(petId);
        petMedicine.setMedicineId(medicineId);
        petMedicine.setDosage(dosage);
        petMedicine.setFrequency(frequency);
        petMedicine.setStartDate(startDate);
        petMedicine.setEndDate(endDate);
        petMedicine.setNotes(notes);

        PetMedicineDAO petMedicineDAO =
                new PetMedicineDAO();

        boolean updated =
                petMedicineDAO.updatePetMedicine(petMedicine);

        if (updated) {

            response.sendRedirect(
                    "pet-medicines.jsp?petId=" + petId);

        } else {

            response.getWriter().println(
                    "Pet medicine could not be updated!");
        }
    }
}
