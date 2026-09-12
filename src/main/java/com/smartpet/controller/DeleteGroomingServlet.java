package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.GroomingDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteGroomingServlet")
public class DeleteGroomingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int groomingId = Integer.parseInt(
                request.getParameter("groomingId"));

        String petId = request.getParameter("petId");

        GroomingDAO groomingDAO =
                new GroomingDAO();

        boolean deleted =
                groomingDAO.deleteGrooming(groomingId);

        if (deleted) {

            response.sendRedirect(
                    "grooming.jsp?petId=" + petId);

        } else {

            response.getWriter().println(
                    "Grooming record could not be deleted!");
        }
    }
}