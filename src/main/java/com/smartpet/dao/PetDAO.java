package com.smartpet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.smartpet.model.Pet;
import com.smartpet.util.DBConnection;

public class PetDAO {

    // Add Pet
    public boolean addPet(Pet pet) {

        String sql = "INSERT INTO pets (pet_name, species, breed, age, weight) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, pet.getPetName());
            statement.setString(2, pet.getSpecies());
            statement.setString(3, pet.getBreed());
            statement.setInt(4, pet.getAge());
            statement.setDouble(5, pet.getWeight());

            int result = statement.executeUpdate();

            statement.close();
            connection.close();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // Get All Pets
    public List<Pet> getAllPets() {

        List<Pet> pets = new ArrayList<>();

        String sql = "SELECT * FROM pets";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement = connection.prepareStatement(sql);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {

                Pet pet = new Pet();

                pet.setPetId(resultSet.getInt("pet_id"));
                pet.setPetName(resultSet.getString("pet_name"));
                pet.setSpecies(resultSet.getString("species"));
                pet.setBreed(resultSet.getString("breed"));
                pet.setAge(resultSet.getInt("age"));
                pet.setWeight(resultSet.getDouble("weight"));

                pets.add(pet);
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return pets;
    }


    // Delete Pet
    public boolean deletePet(int petId) {

        String sql = "DELETE FROM pets WHERE pet_id = ?";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setInt(1, petId);

            int result = statement.executeUpdate();

            statement.close();
            connection.close();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // Update Pet
    public boolean updatePet(Pet pet) {

        String sql = "UPDATE pets SET pet_name = ?, species = ?, "
                   + "breed = ?, age = ?, weight = ? "
                   + "WHERE pet_id = ?";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, pet.getPetName());
            statement.setString(2, pet.getSpecies());
            statement.setString(3, pet.getBreed());
            statement.setInt(4, pet.getAge());
            statement.setDouble(5, pet.getWeight());
            statement.setInt(6, pet.getPetId());

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
