package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.VeterinaryServiceDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteVeterinaryServiceServlet")
public class DeleteVeterinaryServiceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int serviceId = Integer.parseInt(
                request.getParameter("serviceId"));

        VeterinaryServiceDAO serviceDAO =
                new VeterinaryServiceDAO();

        boolean deleted =
                serviceDAO.deleteVeterinaryService(serviceId);

        if (deleted) {

            response.sendRedirect(
                    "veterinary-services.jsp");

        } else {

            response.getWriter().println(
                    "Veterinary service could not be deleted!");
        }
    }
}