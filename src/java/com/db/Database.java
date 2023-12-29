/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Hiral
 */
public class Database {
    private static Connection connection;
    /**
     *
     */
    public static final String DB_URL = "jdbc:mysql://localhost:3306/hms";
    public static final String DB_USERNAME = "root";
    public static final String DB_PASSWORD = "";

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL,DB_USERNAME, DB_PASSWORD);} 
        catch (ClassNotFoundException e) {
        System.out.println("Failed to load MySQL JDBC driver." + e);
    } catch (SQLException e) {
        System.out.println("Failed to establish a database connection." + e);
    }
    return connection;
    }
}

