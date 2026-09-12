package com.smartpet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.smartpet.model.Medicine;
import com.smartpet.util.DBConnection;

public class MedicineDAO {

    // Add Medicine
    public boolean addMedicine(Medicine medicine) {

        String sql = "INSERT INTO medicines "
                   + "(medicine_name, medicine_type, purpose, dosage_info, precautions) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setString(1, medicine.getMedicineName());
            statement.setString(2, medicine.getMedicineType());
            statement.setString(3, medicine.getPurpose());
            statement.setString(4, medicine.getDosageInfo());
            statement.setString(5, medicine.getPrecautions());

            int result = statement.executeUpdate();

            statement.close();
            connection.close();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // Get All Medicines
    public List<Medicine> getAllMedicines() {

        List<Medicine> medicines = new ArrayList<>();

        String sql = "SELECT * FROM medicines ORDER BY medicine_name";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {

                Medicine medicine = new Medicine();

                medicine.setMedicineId(
                        resultSet.getInt("medicine_id"));

                medicine.setMedicineName(
                        resultSet.getString("medicine_name"));

                medicine.setMedicineType(
                        resultSet.getString("medicine_type"));

                medicine.setPurpose(
                        resultSet.getString("purpose"));

                medicine.setDosageInfo(
                        resultSet.getString("dosage_info"));

                medicine.setPrecautions(
                        resultSet.getString("precautions"));

                medicines.add(medicine);
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return medicines;
    }


    // Delete Medicine
    public boolean deleteMedicine(int medicineId) {

        String sql =
                "DELETE FROM medicines WHERE medicine_id = ?";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, medicineId);

            int result = statement.executeUpdate();

            statement.close();
            connection.close();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // Update Medicine
    public boolean updateMedicine(Medicine medicine) {

        String sql = "UPDATE medicines SET "
                   + "medicine_name = ?, "
                   + "medicine_type = ?, "
                   + "purpose = ?, "
                   + "dosage_info = ?, "
                   + "precautions = ? "
                   + "WHERE medicine_id = ?";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setString(1, medicine.getMedicineName());
            statement.setString(2, medicine.getMedicineType());
            statement.setString(3, medicine.getPurpose());
            statement.setString(4, medicine.getDosageInfo());
            statement.setString(5, medicine.getPrecautions());
            statement.setInt(6, medicine.getMedicineId());

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
