package com.smartpet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.smartpet.model.Grooming;
import com.smartpet.util.DBConnection;

public class GroomingDAO {

    public boolean addGrooming(Grooming grooming) {

        String sql = "INSERT INTO grooming "
                   + "(pet_id, grooming_type, grooming_date, next_due_date, notes) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try {

            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, grooming.getPetId());
            statement.setString(2, grooming.getGroomingType());
            statement.setString(3, grooming.getGroomingDate());
            statement.setString(4, grooming.getNextDueDate());
            statement.setString(5, grooming.getNotes());

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


    public List<Grooming> getGroomingByPetId(int petId) {

        List<Grooming> groomingList =
                new ArrayList<>();

        String sql = "SELECT * FROM grooming "
                   + "WHERE pet_id = ? "
                   + "ORDER BY grooming_date DESC";

        try {

            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, petId);

            ResultSet resultSet =
                    statement.executeQuery();

            while (resultSet.next()) {

                Grooming grooming =
                        new Grooming();

                grooming.setGroomingId(
                        resultSet.getInt("grooming_id"));

                grooming.setPetId(
                        resultSet.getInt("pet_id"));

                grooming.setGroomingType(
                        resultSet.getString("grooming_type"));

                grooming.setGroomingDate(
                        resultSet.getString("grooming_date"));

                grooming.setNextDueDate(
                        resultSet.getString("next_due_date"));

                grooming.setNotes(
                        resultSet.getString("notes"));

                groomingList.add(grooming);
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return groomingList;
    }


    public boolean deleteGrooming(int groomingId) {

        String sql =
                "DELETE FROM grooming WHERE grooming_id = ?";

        try {

            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, groomingId);

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


    public boolean updateGrooming(Grooming grooming) {

        String sql = "UPDATE grooming SET "
                   + "grooming_type = ?, "
                   + "grooming_date = ?, "
                   + "next_due_date = ?, "
                   + "notes = ? "
                   + "WHERE grooming_id = ?";

        try {

            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setString(1,
                    grooming.getGroomingType());

            statement.setString(2,
                    grooming.getGroomingDate());

            statement.setString(3,
                    grooming.getNextDueDate());

            statement.setString(4,
                    grooming.getNotes());

            statement.setInt(5,
                    grooming.getGroomingId());

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