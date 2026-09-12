package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.VaccinationDAO;
import com.smartpet.model.Vaccination;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddVaccinationServlet")
public class AddVaccinationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

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


        Vaccination vaccination = new Vaccination(
                petId,
                vaccineName,
                vaccinationDate,
                nextDueDate,
                veterinarian,
                notes
        );


        VaccinationDAO vaccinationDAO =
                new VaccinationDAO();

        boolean added =
                vaccinationDAO.addVaccination(vaccination);


        if (added) {

            response.sendRedirect(
                    "vaccinations.jsp?petId=" + petId);

        } else {

            response.getWriter().println(
                    "Vaccination could not be added!");
        }
    }
}
