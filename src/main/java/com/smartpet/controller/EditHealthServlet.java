package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.HealthRecordDAO;
import com.smartpet.model.HealthRecord;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditHealthServlet")
public class EditHealthServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        int healthId = Integer.parseInt(
                request.getParameter("healthId"));

        int petId = Integer.parseInt(
                request.getParameter("petId"));

        String healthDate =
                request.getParameter("healthDate");

        String conditionName =
                request.getParameter("conditionName");

        String description =
                request.getParameter("description");

        String treatment =
                request.getParameter("treatment");


        HealthRecord record = new HealthRecord();

        record.setHealthId(healthId);
        record.setPetId(petId);
        record.setHealthDate(healthDate);
        record.setConditionName(conditionName);
        record.setDescription(description);
        record.setTreatment(treatment);


        HealthRecordDAO healthDAO =
                new HealthRecordDAO();

        boolean updated =
                healthDAO.updateHealthRecord(record);


        if (updated) {

            response.sendRedirect(
                    "health-records.jsp?petId=" + petId);

        } else {

            response.getWriter().println(
                    "Health record could not be updated!");
        }
    }
}