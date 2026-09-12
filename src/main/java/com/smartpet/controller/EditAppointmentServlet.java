package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.AppointmentDAO;
import com.smartpet.model.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditAppointmentServlet")
public class EditAppointmentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        int appointmentId = Integer.parseInt(
                request.getParameter("appointmentId"));

        int petId = Integer.parseInt(
                request.getParameter("petId"));

        int serviceId = Integer.parseInt(
                request.getParameter("serviceId"));

        String appointmentDate =
                request.getParameter("appointmentDate");

        String appointmentTime =
                request.getParameter("appointmentTime");

        String reason =
                request.getParameter("reason");

        String status =
                request.getParameter("status");

        String notes =
                request.getParameter("notes");

        Appointment appointment =
                new Appointment();

        appointment.setAppointmentId(appointmentId);
        appointment.setPetId(petId);
        appointment.setServiceId(serviceId);
        appointment.setAppointmentDate(appointmentDate);
        appointment.setAppointmentTime(appointmentTime);
        appointment.setReason(reason);
        appointment.setStatus(status);
        appointment.setNotes(notes);

        AppointmentDAO appointmentDAO =
                new AppointmentDAO();

        boolean updated =
                appointmentDAO.updateAppointment(appointment);

        if (updated) {

            response.sendRedirect(
                    "appointments.jsp");

        } else {

            response.getWriter().println(
                    "Appointment could not be updated!");
        }
    }
}
