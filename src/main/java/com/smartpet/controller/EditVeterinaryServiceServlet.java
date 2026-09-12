package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.VeterinaryServiceDAO;
import com.smartpet.model.VeterinaryService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditVeterinaryServiceServlet")
public class EditVeterinaryServiceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        int serviceId = Integer.parseInt(
                request.getParameter("serviceId"));

        String serviceName =
                request.getParameter("serviceName");

        String veterinarianName =
                request.getParameter("veterinarianName");

        String clinicName =
                request.getParameter("clinicName");

        String phone =
                request.getParameter("phone");

        String address =
                request.getParameter("address");

        String specialization =
                request.getParameter("specialization");

        VeterinaryService service =
                new VeterinaryService();

        service.setServiceId(serviceId);
        service.setServiceName(serviceName);
        service.setVeterinarianName(veterinarianName);
        service.setClinicName(clinicName);
        service.setPhone(phone);
        service.setAddress(address);
        service.setSpecialization(specialization);

        VeterinaryServiceDAO serviceDAO =
                new VeterinaryServiceDAO();

        boolean updated =
                serviceDAO.updateVeterinaryService(service);

        if (updated) {

            response.sendRedirect(
                    "veterinary-services.jsp");

        } else {

            response.getWriter().println(
                    "Veterinary service could not be updated!");
        }
    }
}
