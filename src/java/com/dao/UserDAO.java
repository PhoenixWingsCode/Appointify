package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.db.Database;
import java.sql.ResultSet;

import java.sql.SQLException;

public class UserDAO {
    private String fullName = null;
    private String phoneNumber = null;
    private String email = null;
    private String password = null;

    public UserDAO(Connection connection) {
        super();
        this.connection=connection;
    }

    public UserDAO(String fullName, String phoneNumber, String Email, String Password) {
        super();
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.email = Email;
        this.password = Password;
    }

    Connection connection = Database.getConnection();

    public boolean check(){
        try{
            
                String checkSql = "SELECT COUNT(*) FROM userlogin WHERE (fullname LIKE ? AND fullname LIKE ?)";
                PreparedStatement checkPs = connection.prepareStatement(checkSql);
                checkPs.setString(1, "%" + fullName.split(" ")[0] + "%");
                checkPs.setString(2, "%" + fullName.split(" ")[1] + "%");
                ResultSet resultSet = checkPs.executeQuery();
                resultSet.next();
                int count = resultSet.getInt(1);
                
                if (count > 0) {
                    System.out.println("User already registered.");
                    return true;
                }
            }
            catch(SQLException e) {
                System.out.println(e);
            }
        return false;
    }

    public boolean save() {

        try {
            
            String sql = "INSERT INTO userlogin(fullname, phonenumber, email, userpassword) VALUES(?, ?, ?, ?)";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, fullName);
            ps.setString(2, phoneNumber);
            ps.setString(3, email);
            ps.setString(4, password);

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                return true;
            }
            else {
                System.out.println("Failed to insert the record.");
            }}
        catch (SQLException e) {
                System.out.println(e);
        }
        return false;
    }
    
    public boolean checkOldPassword(int userId,String oldPassword){
        boolean bool = false;
        
        try{
            String sql = "select * from userlogin where id=? and userpassword=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2,oldPassword);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                bool=true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return bool;
    }

    public boolean changePassword(int userId,String newPassword){
        boolean bool = false;
        
        try{
            String sql = "update userlogin set userpassword=? where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setInt(2, userId);
            
            int i = ps.executeUpdate();
            if(i==1){
                bool=true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return bool;
    }

}
