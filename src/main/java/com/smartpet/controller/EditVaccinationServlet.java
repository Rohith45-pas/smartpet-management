package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.VaccinationDAO;
import com.smartpet.model.Vaccination;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditVaccinationServlet")
public class EditVaccinationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        int vaccinationId = Integer.parseInt(
                request.getParameter("vaccinationId"));

        int petId = Integer.parseInt(
                request.getParameter("petId"));

        String vaccineName =
                request.getParameter("vaccineName");

        String vaccinationDate =
                request.getParameter("vaccinationDate");

        String nextDueDate =
                request.getParameter("nextDueDate");

        String veterinarian =
                request.getParameter("veterinarian");

        String notes =
                request.getParameter("notes");

        Vaccination vaccination = new Vaccination();

        vaccination.setVaccinationId(vaccinationId);
        vaccination.setPetId(petId);
        vaccination.setVaccineName(vaccineName);
        vaccination.setVaccinationDate(vaccinationDate);
        vaccination.setNextDueDate(nextDueDate);
        vaccination.setVeterinarian(veterinarian);
        vaccination.setNotes(notes);

        VaccinationDAO vaccinationDAO =
                new VaccinationDAO();

        boolean updated =
                vaccinationDAO.updateVaccination(vaccination);

        if (updated) {

            response.sendRedirect(
                    "vaccinations.jsp?petId=" + petId);

        } else {

            response.getWriter().println(
                    "Vaccination could not be updated!");
        }
    }
}
