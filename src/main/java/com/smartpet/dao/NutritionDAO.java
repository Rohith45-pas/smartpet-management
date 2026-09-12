package com.smartpet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.smartpet.model.Nutrition;
import com.smartpet.util.DBConnection;

public class NutritionDAO {

    public boolean addNutrition(Nutrition nutrition) {

        String sql = "INSERT INTO nutrition "
                   + "(pet_id, food_name, food_type, quantity, feeding_time, notes) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, nutrition.getPetId());
            statement.setString(2, nutrition.getFoodName());
            statement.setString(3, nutrition.getFoodType());
            statement.setString(4, nutrition.getQuantity());
            statement.setString(5, nutrition.getFeedingTime());
            statement.setString(6, nutrition.getNotes());

            int result = statement.executeUpdate();

            statement.close();
            connection.close();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    public List<Nutrition> getNutritionByPetId(int petId) {

        List<Nutrition> nutritionList =
                new ArrayList<>();

        String sql = "SELECT * FROM nutrition "
                   + "WHERE pet_id = ? "
                   + "ORDER BY feeding_time";

        try {

            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, petId);

            ResultSet resultSet =
                    statement.executeQuery();

            while (resultSet.next()) {

                Nutrition nutrition =
                        new Nutrition();

                nutrition.setNutritionId(
                        resultSet.getInt("nutrition_id"));

                nutrition.setPetId(
                        resultSet.getInt("pet_id"));

                nutrition.setFoodName(
                        resultSet.getString("food_name"));

                nutrition.setFoodType(
                        resultSet.getString("food_type"));

                nutrition.setQuantity(
                        resultSet.getString("quantity"));

                nutrition.setFeedingTime(
                        resultSet.getString("feeding_time"));

                nutrition.setNotes(
                        resultSet.getString("notes"));

                nutritionList.add(nutrition);
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return nutritionList;
    }


    public boolean deleteNutrition(int nutritionId) {

        String sql =
                "DELETE FROM nutrition WHERE nutrition_id = ?";

        try {

            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, nutritionId);

            int result =
                    statement.executeUpdate();

            statement.close();
            connection.close();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    public boolean updateNutrition(Nutrition nutrition) {

        String sql = "UPDATE nutrition SET "
                   + "food_name = ?, "
                   + "food_type = ?, "
                   + "quantity = ?, "
                   + "feeding_time = ?, "
                   + "notes = ? "
                   + "WHERE nutrition_id = ?";

        try {

            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setString(1,
                    nutrition.getFoodName());

            statement.setString(2,
                    nutrition.getFoodType());

            statement.setString(3,
                    nutrition.getQuantity());

            statement.setString(4,
                    nutrition.getFeedingTime());

            statement.setString(5,
                    nutrition.getNotes());

            statement.setInt(6,
                    nutrition.getNutritionId());

            int result =
                    statement.executeUpdate();

            statement.close();
            connection.close();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }
}
