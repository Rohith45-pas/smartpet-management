package com.smartpet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.smartpet.model.User;
import com.smartpet.util.DBConnection;

public class UserDAO {

    public boolean registerUser(User user)
    {

        String sql = "INSERT INTO users (full_name, email, password, phone) "
                   + "VALUES (?, ?, ?, ?)";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, user.getFullName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getPhone());

            int result = statement.executeUpdate();

            statement.close();
            connection.close();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    
}

public User loginUser(String email, String password) {

    String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

    try {
        Connection connection = DBConnection.getConnection();

        PreparedStatement statement = connection.prepareStatement(sql);

        statement.setString(1, email);
        statement.setString(2, password);

        var resultSet = statement.executeQuery();

        if (resultSet.next()) {

            User user = new User();

            user.setUserId(resultSet.getInt("user_id"));
            user.setFullName(resultSet.getString("full_name"));
            user.setEmail(resultSet.getString("email"));
            user.setPassword(resultSet.getString("password"));
            user.setPhone(resultSet.getString("phone"));

            resultSet.close();
            statement.close();
            connection.close();

            return user;
        }

        resultSet.close();
        statement.close();
        connection.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

    return null;
}

}
