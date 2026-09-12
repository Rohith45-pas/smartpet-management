package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.MedicineDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteMedicineServlet")
public class DeleteMedicineServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int medicineId = Integer.parseInt(
                request.getParameter("medicineId"));

        MedicineDAO medicineDAO =
                new MedicineDAO();

        boolean deleted =
                medicineDAO.deleteMedicine(medicineId);

        if (deleted) {

            response.sendRedirect("medicines.jsp");

        } else {

            response.getWriter().println(
                    "Medicine could not be deleted!");
        }
    }
}