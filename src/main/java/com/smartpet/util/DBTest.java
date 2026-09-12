package com.smartpet.util;

import java.sql.Connection;

public class DBTest {

    public static void main(String[] args) {

        Connection connection = DBConnection.getConnection();

        if (connection != null) {
            System.out.println("================================");
            System.out.println("SMART PET DATABASE CONNECTED!");
            System.out.println("================================");

            try {
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            System.out.println("DATABASE CONNECTION FAILED!");
        }
    }
}