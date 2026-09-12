package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.GroomingDAO;
import com.smartpet.model.Grooming;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditGroomingServlet")
public class EditGroomingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        int groomingId = Integer.parseInt(
                request.getParameter("groomingId"));

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

        Grooming grooming = new Grooming();

        grooming.setGroomingId(groomingId);
        grooming.setPetId(petId);
        grooming.setGroomingType(groomingType);
        grooming.setGroomingDate(groomingDate);
        grooming.setNextDueDate(nextDueDate);
        grooming.setNotes(notes);

        GroomingDAO groomingDAO =
                new GroomingDAO();

        boolean updated =
                groomingDAO.updateGrooming(grooming);

        if (updated) {

            response.sendRedirect(
                    "grooming.jsp?petId=" + petId);

        } else {

            response.getWriter().println(
                    "Grooming record could not be updated!");
        }
    }
}