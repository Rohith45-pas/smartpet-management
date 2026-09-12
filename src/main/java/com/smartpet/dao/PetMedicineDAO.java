package com.smartpet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.smartpet.model.PetMedicine;
import com.smartpet.util.DBConnection;

public class PetMedicineDAO {

    // Add Medicine to Pet
    public boolean addPetMedicine(PetMedicine petMedicine) {

        String sql = "INSERT INTO pet_medicines "
                   + "(pet_id, medicine_id, dosage, frequency, start_date, end_date, notes) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, petMedicine.getPetId());
            statement.setInt(2, petMedicine.getMedicineId());
            statement.setString(3, petMedicine.getDosage());
            statement.setString(4, petMedicine.getFrequency());
            statement.setString(5, petMedicine.getStartDate());
            statement.setString(6, petMedicine.getEndDate());
            statement.setString(7, petMedicine.getNotes());

            int result = statement.executeUpdate();

            statement.close();
            connection.close();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // Get Medicines Assigned to a Pet
    public List<PetMedicine> getPetMedicinesByPetId(int petId) {

        List<PetMedicine> petMedicines = new ArrayList<>();

        String sql = "SELECT * FROM pet_medicines "
                   + "WHERE pet_id = ? "
                   + "ORDER BY start_date DESC";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, petId);

            ResultSet resultSet =
                    statement.executeQuery();

            while (resultSet.next()) {

                PetMedicine petMedicine =
                        new PetMedicine();

                petMedicine.setPetMedicineId(
                        resultSet.getInt("pet_medicine_id"));

                petMedicine.setPetId(
                        resultSet.getInt("pet_id"));

                petMedicine.setMedicineId(
                        resultSet.getInt("medicine_id"));

                petMedicine.setDosage(
                        resultSet.getString("dosage"));

                petMedicine.setFrequency(
                        resultSet.getString("frequency"));

                petMedicine.setStartDate(
                        resultSet.getString("start_date"));

                petMedicine.setEndDate(
                        resultSet.getString("end_date"));

                petMedicine.setNotes(
                        resultSet.getString("notes"));

                petMedicines.add(petMedicine);
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return petMedicines;
    }


    // Delete Pet Medicine
    public boolean deletePetMedicine(int petMedicineId) {

        String sql =
                "DELETE FROM pet_medicines "
              + "WHERE pet_medicine_id = ?";

        try {
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, petMedicineId);

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


    // Update Pet Medicine
    public boolean updatePetMedicine(
            PetMedicine petMedicine) {

        String sql = "UPDATE pet_medicines SET "
                   + "medicine_id = ?, "
                   + "dosage = ?, "
                   + "frequency = ?, "
                   + "start_date = ?, "
                   + "end_date = ?, "
                   + "notes = ? "
                   + "WHERE pet_medicine_id = ?";

        try {
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(
                    1, petMedicine.getMedicineId());

            statement.setString(
                    2, petMedicine.getDosage());

            statement.setString(
                    3, petMedicine.getFrequency());

            statement.setString(
                    4, petMedicine.getStartDate());

            statement.setString(
                    5, petMedicine.getEndDate());

            statement.setString(
                    6, petMedicine.getNotes());

            statement.setInt(
                    7, petMedicine.getPetMedicineId());

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
