package com.smartpet.controller;

import java.io.IOException;

import com.smartpet.dao.NutritionDAO;
import com.smartpet.model.Nutrition;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddNutritionServlet")
public class AddNutritionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        int petId = Integer.parseInt(
                request.getParameter("petId"));

        String foodName =
                request.getParameter("foodName");

        String foodType =
                request.getParameter("foodType");

        String quantity =
                request.getParameter("quantity");

        String feedingTime =
                request.getParameter("feedingTime");

        String notes =
                request.getParameter("notes");

        Nutrition nutrition = new Nutrition(
                petId,
                foodName,
                foodType,
                quantity,
                feedingTime,
                notes
        );

        NutritionDAO nutritionDAO =
                new NutritionDAO();

        boolean added =
                nutritionDAO.addNutrition(nutrition);

        if (added) {

            response.sendRedirect(
                    "nutrition.jsp?petId=" + petId);

        } else {

            response.getWriter().println(
                    "Nutrition could not be added!");
        }
    }
}