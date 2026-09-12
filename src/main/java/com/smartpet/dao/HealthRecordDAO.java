package com.smartpet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.smartpet.model.HealthRecord;
import com.smartpet.util.DBConnection;

public class HealthRecordDAO {

    // Add Health Record
    public boolean addHealthRecord(HealthRecord record) {

        String sql = "INSERT INTO health_records "
                   + "(pet_id, health_date, condition_name, description, treatment) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, record.getPetId());
            statement.setString(2, record.getHealthDate());
            statement.setString(3, record.getConditionName());
            statement.setString(4, record.getDescription());
            statement.setString(5, record.getTreatment());

            int result = statement.executeUpdate();

            statement.close();
            connection.close();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // Get Health Records for a Pet
    public List<HealthRecord> getHealthRecordsByPetId(int petId) {

        List<HealthRecord> records = new ArrayList<>();

        String sql = "SELECT * FROM health_records "
                   + "WHERE pet_id = ? "
                   + "ORDER BY health_date DESC";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, petId);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {

                HealthRecord record = new HealthRecord();

                record.setHealthId(
                        resultSet.getInt("health_id"));

                record.setPetId(
                        resultSet.getInt("pet_id"));

                record.setHealthDate(
                        resultSet.getString("health_date"));

                record.setConditionName(
                        resultSet.getString("condition_name"));

                record.setDescription(
                        resultSet.getString("description"));

                record.setTreatment(
                        resultSet.getString("treatment"));

                records.add(record);
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return records;
    }


    // Delete Health Record
    public boolean deleteHealthRecord(int healthId) {

        String sql = "DELETE FROM health_records "
                   + "WHERE health_id = ?";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, healthId);

            int result = statement.executeUpdate();

            statement.close();
            connection.close();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // Update Health Record
    public boolean updateHealthRecord(HealthRecord record) {

        String sql = "UPDATE health_records SET "
                   + "health_date = ?, "
                   + "condition_name = ?, "
                   + "description = ?, "
                   + "treatment = ? "
                   + "WHERE health_id = ?";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setString(1, record.getHealthDate());
            statement.setString(2, record.getConditionName());
            statement.setString(3, record.getDescription());
            statement.setString(4, record.getTreatment());
            statement.setInt(5, record.getHealthId());

            int result = statement.executeUpdate();

            statement.close();
            connection.close();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}