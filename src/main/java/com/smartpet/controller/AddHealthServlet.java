package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.HealthRecordDAO;
import com.smartpet.model.HealthRecord;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddHealthServlet")
public class AddHealthServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

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


        HealthRecord record = new HealthRecord(
                petId,
                healthDate,
                conditionName,
                description,
                treatment
        );


        HealthRecordDAO healthDAO =
                new HealthRecordDAO();

        boolean added =
                healthDAO.addHealthRecord(record);


        if (added) {

            response.sendRedirect(
                    "health-records.jsp?petId=" + petId
            );

        } else {

            response.getWriter().println(
                    "Health record could not be added!"
            );
        }
    }
}
