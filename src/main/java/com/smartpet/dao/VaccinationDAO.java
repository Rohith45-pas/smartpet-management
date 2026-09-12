package com.smartpet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.smartpet.model.Vaccination;
import com.smartpet.util.DBConnection;

public class VaccinationDAO {

    // Add Vaccination
    public boolean addVaccination(Vaccination vaccination) {

        String sql = "INSERT INTO vaccinations "
                   + "(pet_id, vaccine_name, vaccination_date, "
                   + "next_due_date, veterinarian, notes) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, vaccination.getPetId());
            statement.setString(2, vaccination.getVaccineName());
            statement.setString(3, vaccination.getVaccinationDate());
            statement.setString(4, vaccination.getNextDueDate());
            statement.setString(5, vaccination.getVeterinarian());
            statement.setString(6, vaccination.getNotes());

            int result = statement.executeUpdate();

            statement.close();
            connection.close();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // Get Vaccinations by Pet ID
    public List<Vaccination> getVaccinationsByPetId(int petId) {

        List<Vaccination> vaccinations = new ArrayList<>();

        String sql = "SELECT * FROM vaccinations "
                   + "WHERE pet_id = ? "
                   + "ORDER BY vaccination_date DESC";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, petId);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {

                Vaccination vaccination = new Vaccination();

                vaccination.setVaccinationId(
                        resultSet.getInt("vaccination_id"));

                vaccination.setPetId(
                        resultSet.getInt("pet_id"));

                vaccination.setVaccineName(
                        resultSet.getString("vaccine_name"));

                vaccination.setVaccinationDate(
                        resultSet.getString("vaccination_date"));

                vaccination.setNextDueDate(
                        resultSet.getString("next_due_date"));

                vaccination.setVeterinarian(
                        resultSet.getString("veterinarian"));

                vaccination.setNotes(
                        resultSet.getString("notes"));

                vaccinations.add(vaccination);
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return vaccinations;
    }


    // Delete Vaccination
    public boolean deleteVaccination(int vaccinationId) {

        String sql = "DELETE FROM vaccinations "
                   + "WHERE vaccination_id = ?";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, vaccinationId);

            int result = statement.executeUpdate();

            statement.close();
            connection.close();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // Update Vaccination
    public boolean updateVaccination(Vaccination vaccination) {

        String sql = "UPDATE vaccinations SET "
                   + "vaccine_name = ?, "
                   + "vaccination_date = ?, "
                   + "next_due_date = ?, "
                   + "veterinarian = ?, "
                   + "notes = ? "
                   + "WHERE vaccination_id = ?";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setString(1, vaccination.getVaccineName());
            statement.setString(2, vaccination.getVaccinationDate());
            statement.setString(3, vaccination.getNextDueDate());
            statement.setString(4, vaccination.getVeterinarian());
            statement.setString(5, vaccination.getNotes());
            statement.setInt(6, vaccination.getVaccinationId());

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
