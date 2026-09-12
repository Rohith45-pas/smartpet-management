package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.GroomingDAO;
import com.smartpet.model.Grooming;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddGroomingServlet")
public class AddGroomingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        int petId = Integer.parseInt(
                request.getParameter("petId"));

        String groomingType =
                request.getParameter("groomingType");

        String groomingDate =
                request.getParameter("groomingDate");

        String nextDueDate =
                request.getParameter("nextDueDate");

        String notes =
                request.getParameter("notes");

        Grooming grooming = new Grooming(
                petId,
                groomingType,
                groomingDate,
                nextDueDate,
                notes
        );

        GroomingDAO groomingDAO =
                new GroomingDAO();

        boolean added =
                groomingDAO.addGrooming(grooming);

        if (added) {

            response.sendRedirect(
                    "grooming.jsp?petId=" + petId);

        } else {

            response.getWriter().println(
                    "Grooming record could not be added!");
        }
    }
}