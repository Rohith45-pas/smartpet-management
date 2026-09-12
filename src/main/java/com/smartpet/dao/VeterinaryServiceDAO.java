package com.smartpet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.smartpet.model.VeterinaryService;
import com.smartpet.util.DBConnection;

public class VeterinaryServiceDAO {

    public boolean addVeterinaryService(VeterinaryService service) {

        String sql = "INSERT INTO veterinary_services "
                   + "(service_name, veterinarian_name, clinic_name, "
                   + "phone, address, specialization) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setString(1, service.getServiceName());
            statement.setString(2, service.getVeterinarianName());
            statement.setString(3, service.getClinicName());
            statement.setString(4, service.getPhone());
            statement.setString(5, service.getAddress());
            statement.setString(6, service.getSpecialization());

            int result = statement.executeUpdate();

            statement.close();
            connection.close();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public List<VeterinaryService> getAllVeterinaryServices() {

        List<VeterinaryService> services =
                new ArrayList<>();

        String sql =
                "SELECT * FROM veterinary_services "
              + "ORDER BY service_id DESC";

        try {
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            ResultSet resultSet =
                    statement.executeQuery();

            while (resultSet.next()) {

                VeterinaryService service =
                        new VeterinaryService();

                service.setServiceId(
                        resultSet.getInt("service_id"));

                service.setServiceName(
                        resultSet.getString("service_name"));

                service.setVeterinarianName(
                        resultSet.getString("veterinarian_name"));

                service.setClinicName(
                        resultSet.getString("clinic_name"));

                service.setPhone(
                        resultSet.getString("phone"));

                service.setAddress(
                        resultSet.getString("address"));

                service.setSpecialization(
                        resultSet.getString("specialization"));

                services.add(service);
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return services;
    }

    public boolean deleteVeterinaryService(int serviceId) {

        String sql =
                "DELETE FROM veterinary_services "
              + "WHERE service_id = ?";

        try {
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, serviceId);

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

    public boolean updateVeterinaryService(
            VeterinaryService service) {

        String sql =
                "UPDATE veterinary_services SET "
              + "service_name = ?, "
              + "veterinarian_name = ?, "
              + "clinic_name = ?, "
              + "phone = ?, "
              + "address = ?, "
              + "specialization = ? "
              + "WHERE service_id = ?";

        try {
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setString(1,
                    service.getServiceName());

            statement.setString(2,
                    service.getVeterinarianName());

            statement.setString(3,
                    service.getClinicName());

            statement.setString(4,
                    service.getPhone());

            statement.setString(5,
                    service.getAddress());

            statement.setString(6,
                    service.getSpecialization());

            statement.setInt(7,
                    service.getServiceId());

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