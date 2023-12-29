/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import com.entity.Specialist;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hiral
 */
public class SpecialistDAO {
    private final Connection connection;
    
    public SpecialistDAO(Connection connection){
        super();
        this.connection=connection;
    }

    public boolean isSpecialistExists(String spec) {
        boolean exists = false;
        try {
            String sql = "SELECT COUNT(*) FROM specialist WHERE spec_name=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, spec);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) {
                    exists = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }
    
    public boolean addSpecialist(String spec){
        boolean bool=false;
        try{
            String sql="INSERT INTO specialist(spec_name) VALUES(?)";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,spec);
            
            int i = ps.executeUpdate();
            if(i==1){
                bool=true;
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return bool;
    }
    
    public List<Specialist> getAllSpecialist(){
        List<Specialist> list = new ArrayList<Specialist>();
        Specialist s = null;
        
        try{
            String sql = "select * from specialist";
            PreparedStatement ps = connection.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                s = new Specialist();
                s.setId(rs.getInt("id"));
                s.setSpecialistName(rs.getString("spec_name"));
                list.add(s);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
}
