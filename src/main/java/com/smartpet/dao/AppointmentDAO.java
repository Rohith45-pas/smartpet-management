package com.smartpet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.smartpet.model.Appointment;
import com.smartpet.util.DBConnection;

public class AppointmentDAO {

    public boolean addAppointment(Appointment appointment) {

        String sql = "INSERT INTO appointments "
                   + "(pet_id, service_id, appointment_date, "
                   + "appointment_time, reason, status, notes) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, appointment.getPetId());
            statement.setInt(2, appointment.getServiceId());
            statement.setString(3, appointment.getAppointmentDate());
            statement.setString(4, appointment.getAppointmentTime());
            statement.setString(5, appointment.getReason());
            statement.setString(6, appointment.getStatus());
            statement.setString(7, appointment.getNotes());

            int result = statement.executeUpdate();

            statement.close();
            connection.close();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public List<Appointment> getAllAppointments() {

        List<Appointment> appointments =
                new ArrayList<>();

        String sql =
                "SELECT * FROM appointments "
              + "ORDER BY appointment_date DESC, appointment_time DESC";

        try {
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            ResultSet resultSet =
                    statement.executeQuery();

            while (resultSet.next()) {

                Appointment appointment =
                        new Appointment();

                appointment.setAppointmentId(
                        resultSet.getInt("appointment_id"));

                appointment.setPetId(
                        resultSet.getInt("pet_id"));

                appointment.setServiceId(
                        resultSet.getInt("service_id"));

                appointment.setAppointmentDate(
                        resultSet.getString("appointment_date"));

                appointment.setAppointmentTime(
                        resultSet.getString("appointment_time"));

                appointment.setReason(
                        resultSet.getString("reason"));

                appointment.setStatus(
                        resultSet.getString("status"));

                appointment.setNotes(
                        resultSet.getString("notes"));

                appointments.add(appointment);
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return appointments;
    }

    public boolean deleteAppointment(int appointmentId) {

        String sql =
                "DELETE FROM appointments "
              + "WHERE appointment_id = ?";

        try {
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, appointmentId);

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

    public boolean updateAppointment(Appointment appointment) {

        String sql =
                "UPDATE appointments SET "
              + "pet_id = ?, "
              + "service_id = ?, "
              + "appointment_date = ?, "
              + "appointment_time = ?, "
              + "reason = ?, "
              + "status = ?, "
              + "notes = ? "
              + "WHERE appointment_id = ?";

        try {
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            statement.setInt(1, appointment.getPetId());
            statement.setInt(2, appointment.getServiceId());
            statement.setString(3, appointment.getAppointmentDate());
            statement.setString(4, appointment.getAppointmentTime());
            statement.setString(5, appointment.getReason());
            statement.setString(6, appointment.getStatus());
            statement.setString(7, appointment.getNotes());
            statement.setInt(8, appointment.getAppointmentId());

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