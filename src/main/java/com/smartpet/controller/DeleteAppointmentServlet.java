package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.AppointmentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteAppointmentServlet")
public class DeleteAppointmentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int appointmentId = Integer.parseInt(
                request.getParameter("appointmentId"));

        AppointmentDAO appointmentDAO =
                new AppointmentDAO();

        boolean deleted =
                appointmentDAO.deleteAppointment(appointmentId);

        if (deleted) {

            response.sendRedirect(
                    "appointments.jsp");

        } else {

            response.getWriter().println(
                    "Appointment could not be deleted!");
        }
    }
}
