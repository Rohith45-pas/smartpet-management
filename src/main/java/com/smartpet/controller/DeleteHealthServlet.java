package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.HealthRecordDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteHealthServlet")
public class DeleteHealthServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int healthId = Integer.parseInt(
                request.getParameter("healthId"));

        String petId = request.getParameter("petId");

        HealthRecordDAO healthDAO =
                new HealthRecordDAO();

        boolean deleted =
                healthDAO.deleteHealthRecord(healthId);

        if (deleted) {

            response.sendRedirect(
                    "health-records.jsp?petId=" + petId);

        } else {

            response.getWriter().println(
                    "Health record could not be deleted!");
        }
    }
}
