package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.MedicineDAO;
import com.smartpet.model.Medicine;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditMedicineServlet")
public class EditMedicineServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        int medicineId = Integer.parseInt(
                request.getParameter("medicineId"));

        String medicineName =
                request.getParameter("medicineName");

        String medicineType =
                request.getParameter("medicineType");

        String purpose =
                request.getParameter("purpose");

        String dosageInfo =
                request.getParameter("dosageInfo");

        String precautions =
                request.getParameter("precautions");

        Medicine medicine = new Medicine();

        medicine.setMedicineId(medicineId);
        medicine.setMedicineName(medicineName);
        medicine.setMedicineType(medicineType);
        medicine.setPurpose(purpose);
        medicine.setDosageInfo(dosageInfo);
        medicine.setPrecautions(precautions);

        MedicineDAO medicineDAO =
                new MedicineDAO();

        boolean updated =
                medicineDAO.updateMedicine(medicine);

        if (updated) {

            response.sendRedirect("medicines.jsp");

        } else {

            response.getWriter().println(
                    "Medicine could not be updated!");
        }
    }
}
