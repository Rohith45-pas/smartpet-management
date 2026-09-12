package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.NutritionDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteNutritionServlet")
public class DeleteNutritionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int nutritionId = Integer.parseInt(
                request.getParameter("nutritionId"));

        String petId = request.getParameter("petId");

        NutritionDAO nutritionDAO =
                new NutritionDAO();

        boolean deleted =
                nutritionDAO.deleteNutrition(nutritionId);

        if (deleted) {

            response.sendRedirect(
                    "nutrition.jsp?petId=" + petId);

        } else {

            response.getWriter().println(
                    "Nutrition record could not be deleted!");
        }
    }
}
