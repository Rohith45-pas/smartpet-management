package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.VaccinationDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteVaccinationServlet")
public class DeleteVaccinationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int vaccinationId = Integer.parseInt(
                request.getParameter("vaccinationId"));

        String petId = request.getParameter("petId");

        VaccinationDAO vaccinationDAO =
                new VaccinationDAO();

        boolean deleted =
                vaccinationDAO.deleteVaccination(vaccinationId);

        if (deleted) {

            response.sendRedirect(
                    "vaccinations.jsp?petId=" + petId);

        } else {

            response.getWriter().println(
                    "Vaccination could not be deleted!");
        }
    }
}