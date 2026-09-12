package com.smartpet.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.smartpet.model.PetBusiness;
import com.smartpet.util.DBConnection;

public class PetBusinessDAO {

    // Add Business
    public boolean addBusiness(PetBusiness business) {

        String sql = "INSERT INTO pet_businesses "
                   + "(business_name, business_type, phone, email, address, description) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, business.getBusinessName());
            ps.setString(2, business.getBusinessType());
            ps.setString(3, business.getPhone());
            ps.setString(4, business.getEmail());
            ps.setString(5, business.getAddress());
            ps.setString(6, business.getDescription());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }


    // Get All Businesses
    public List<PetBusiness> getAllBusinesses() {

        List<PetBusiness> businesses = new ArrayList<>();

        String sql = "SELECT * FROM pet_businesses ORDER BY business_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                PetBusiness business = new PetBusiness();

                business.setBusinessId(rs.getInt("business_id"));
                business.setBusinessName(rs.getString("business_name"));
                business.setBusinessType(rs.getString("business_type"));
                business.setPhone(rs.getString("phone"));
                business.setEmail(rs.getString("email"));
                business.setAddress(rs.getString("address"));
                business.setDescription(rs.getString("description"));

                businesses.add(business);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return businesses;
    }


    // Delete Business
    public boolean deleteBusiness(int businessId) {

        String sql = "DELETE FROM pet_businesses WHERE business_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, businessId);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }


    // Update Business
    public boolean updateBusiness(PetBusiness business) {

        String sql = "UPDATE pet_businesses SET "
                   + "business_name=?, business_type=?, phone=?, email=?, "
                   + "address=?, description=? "
                   + "WHERE business_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, business.getBusinessName());
            ps.setString(2, business.getBusinessType());
            ps.setString(3, business.getPhone());
            ps.setString(4, business.getEmail());
            ps.setString(5, business.getAddress());
            ps.setString(6, business.getDescription());
            ps.setInt(7, business.getBusinessId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}