package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.PetBusinessDAO;
import com.smartpet.model.PetBusiness;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddPetBusinessServlet")
public class AddPetBusinessServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String businessName = request.getParameter("businessName");
        String businessType = request.getParameter("businessType");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String description = request.getParameter("description");

        PetBusiness business = new PetBusiness(
                businessName,
                businessType,
                phone,
                email,
                address,
                description
        );

        PetBusinessDAO dao = new PetBusinessDAO();

        if (dao.addBusiness(business)) {
            response.sendRedirect("pet-businesses.jsp");
        } else {
            response.getWriter().println("Failed to add pet business.");
        }
    }
}
