/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Doctor;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

/**
 *
 * @author Hiral
 */
public class DoctorDAO {
    private final Connection connection;
    
    public DoctorDAO(Connection connection){
        super();
        this.connection=connection;
    }
    
    public boolean registerdoctor(Doctor d){
        boolean bool = false;
        
        try{
            String sql = "insert into doctor(full_name,dob,qualification,specialist,email,mobno,password) values(?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, d.getfullName());
            ps.setString(2, d.getdob());
            ps.setString(3, d.getqualification());
            ps.setString(4, d.getspecialist());
            ps.setString(5, d.getemail());
            ps.setString(6, d.getmobNo());
            ps.setString(7, d.getpassword());
            
            int i = ps.executeUpdate();
            if(i==1){
                bool=true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }   
        return bool;
    }
    
    public List<Doctor> getAllDoctor(){
        List<Doctor> list = new ArrayList<Doctor>();
        Doctor d=null;
        try{
            
            String sql = "select * from doctor order by id desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                d=new Doctor();
                d.setId(rs.getInt(1));
                d.setfullName(rs.getString(2));
                d.setdob(rs.getString(3));
                d.setqualification(rs.getString(4));
                d.setspecialist(rs.getString(5));
                d.setemail(rs.getString(6));
                d.setmobNo(rs.getString(7));
                d.setpassword(rs.getString(8));
                list.add(d);
            }
        }catch(Exception e){}
        return list;
    }
    
    public Doctor getDoctorById(int id){
        Doctor d=null;
        try{
            String sql = "select * from doctor where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                d=new Doctor();
                d.setId(rs.getInt(1));
                d.setfullName(rs.getString(2));
                d.setdob(rs.getString(3));
                d.setqualification(rs.getString(4));
                d.setspecialist(rs.getString(5));
                d.setemail(rs.getString(6));
                d.setmobNo(rs.getString(7));
                d.setpassword(rs.getString(8));
            }
        }catch(Exception e){}
        return d;
    }

    public boolean updateDoctor(Doctor d){
        boolean bool = false;
        
        try{
            String sql = "update doctor set full_name=?,dob=?,qualification=?,specialist=?,email=?,mobno=?,password=? where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, d.getfullName());
            ps.setString(2, d.getdob());
            ps.setString(3, d.getqualification());
            ps.setString(4, d.getspecialist());
            ps.setString(5, d.getemail());
            ps.setString(6, d.getmobNo());
            ps.setString(7, d.getpassword());
            ps.setInt(8,d.getId());
            int i = ps.executeUpdate();
            if(i==1){
                bool=true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }   
        return bool;
    }

    public boolean deleteDoctor(int id){
        boolean bool = false;
        try{
            String sql = "delete from doctor where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1,id);
            
            int i = ps.executeUpdate();
            if(i==1){
                bool=true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return bool;
    }
    
    public Doctor login(String email,String password){
        Doctor d = null;
        try{
            String sql = "select * from doctor where email=? and password=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                d=new Doctor();
                d.setId(rs.getInt(1));
                d.setfullName(rs.getString(2));
                d.setdob(rs.getString(3));
                d.setqualification(rs.getString(4));
                d.setspecialist(rs.getString(5));
                d.setemail(rs.getString(6));
                d.setmobNo(rs.getString(7));
                d.setpassword(rs.getString(8));
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return d;
    }
    
    public int countDoctor(){
        int i=0;
        
        try{
                String sql = "select * from doctor";
                PreparedStatement ps = connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    i++;
                }
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return i;
    }

    public int countAppointment(){
        int i=0;
        
        try{
                String sql = "select * from appointment";
                PreparedStatement ps = connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    i++;
                }
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return i;
    }

    public int countAppointmentByDoctorId(int did){
        int i=0;
        
        try{
                String sql = "select * from appointment where doctorId=?";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, did);
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    i++;
                }
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return i;
    }
    
    public int countSpecialist(){
        int i=0;
        
        try{
                String sql = "select * from specialist";
                PreparedStatement ps = connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    i++;
                }
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return i;
    }

    public int countUser(){
        int i=0;
        
        try{
                String sql = "select * from user";
                PreparedStatement ps = connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    i++;
                }
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return i;
    }

    public boolean checkOldPassword(int userId,String oldPassword){
        boolean bool = false;
        
        try{
            String sql = "select * from doctor where id=? and password=?";
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
            String sql = "update doctor set password=? where id=?";
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

    public boolean editDoctorProfile(Doctor d){
        boolean bool = false;
        
        try{
            String sql = "update doctor set full_name=?,dob=?,qualification=?,specialist=?,email=?,mobno=? where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, d.getfullName());
            ps.setString(2, d.getdob());
            ps.setString(3, d.getqualification());
            ps.setString(4, d.getspecialist());
            ps.setString(5, d.getemail());
            ps.setString(6, d.getmobNo());
            ps.setInt(7,d.getId());
            int i = ps.executeUpdate();
            if(i==1){
                bool=true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }   
        return bool;
    }
    
}
