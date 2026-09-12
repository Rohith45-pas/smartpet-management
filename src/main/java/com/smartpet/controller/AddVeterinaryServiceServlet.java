package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.VeterinaryServiceDAO;
import com.smartpet.model.VeterinaryService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddVeterinaryServiceServlet")
public class AddVeterinaryServiceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

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
                new VeterinaryService(
                        serviceName,
                        veterinarianName,
                        clinicName,
                        phone,
                        address,
                        specialization
                );

        VeterinaryServiceDAO serviceDAO =
                new VeterinaryServiceDAO();

        boolean added =
                serviceDAO.addVeterinaryService(service);

        if (added) {

            response.sendRedirect(
                    "veterinary-services.jsp");

        } else {

            response.getWriter().println(
                    "Veterinary service could not be added!");
        }
    }
}
