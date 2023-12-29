/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import java.sql.*;

import com.entity.Appointment;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Hiral
 */
public class AppointmentDAO {

    private Connection connection;
    
    public AppointmentDAO(Connection connection){
        super();
        this.connection=connection;
    }
    
    public boolean addAppointment(Appointment appoint){
        
        boolean bool = false;
        
        try{
        
            String sql = "insert into appointment(userId,fullName,gender,age,appointmentDate,email,phoneNo,diseases,doctorId,address,status) values(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, appoint.getuserId());
            ps.setString(2, appoint.getfullName());
            ps.setString(3, appoint.getgender());
            ps.setString(4, appoint.getage());
            ps.setString(5, appoint.getappointmentDate());
            ps.setString(6, appoint.getemail());
            ps.setString(7, appoint.getphoneNo());
            ps.setString(8, appoint.getdiseases());
            ps.setInt(9, appoint.getdoctorId());
            ps.setString(10, appoint.getaddress());
            ps.setString(11, appoint.getstatus());
            
            int i = ps.executeUpdate();
            if(i==1){
                bool=true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return bool;
    }
    
    public List<Appointment> getAllAppointmentByLoginUser(int userId){
        List<Appointment> list = new ArrayList<Appointment>();
        Appointment ap = null;
        
        try{
        
            String sql = "select * from appointment where userId=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1,userId);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ap=new Appointment();
                ap.setId(rs.getInt(1));
                ap.setuserId(rs.getInt(2));
                ap.setfullName(rs.getString(3));
                ap.setgender(rs.getString(4));
                ap.setage(rs.getString(5));
                ap.setappointmentDate(rs.getString(6));
                ap.setemail(rs.getString(7));
                ap.setphoneNo(rs.getString(8));
                ap.setdiseases(rs.getString(9));
                ap.setdoctorId(rs.getInt(10));
                ap.setaddress(rs.getString(11));
                ap.setstatus(rs.getString(12));
                list.add(ap);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Appointment> getAllAppointmentByDoctorLogin(int doctorId){
        List<Appointment> list = new ArrayList<Appointment>();
        Appointment ap = null;
        
        try{
        
            String sql = "select * from appointment where doctorId=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1,doctorId);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ap=new Appointment();
                ap.setId(rs.getInt(1));
                ap.setuserId(rs.getInt(2));
                ap.setfullName(rs.getString(3));
                ap.setgender(rs.getString(4));
                ap.setage(rs.getString(5));
                ap.setappointmentDate(rs.getString(6));
                ap.setemail(rs.getString(7));
                ap.setphoneNo(rs.getString(8));
                ap.setdiseases(rs.getString(9));
                ap.setdoctorId(rs.getInt(10));
                ap.setaddress(rs.getString(11));
                ap.setstatus(rs.getString(12));
                list.add(ap);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public Appointment getAllAppointmentById(int id){
        Appointment ap = null;
        
        try{
        
            String sql = "select * from appointment where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1,id);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ap=new Appointment();
                ap.setId(rs.getInt(1));
                ap.setuserId(rs.getInt(2));
                ap.setfullName(rs.getString(3));
                ap.setgender(rs.getString(4));
                ap.setage(rs.getString(5));
                ap.setappointmentDate(rs.getString(6));
                ap.setemail(rs.getString(7));
                ap.setphoneNo(rs.getString(8));
                ap.setdiseases(rs.getString(9));
                ap.setdoctorId(rs.getInt(10));
                ap.setaddress(rs.getString(11));
                ap.setstatus(rs.getString(12));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return ap;
    }
    
    public boolean updateCommentStatus(int id,int doctorId,String comment){
        boolean bool = false;
        
        try{
            String sql = "update appointment set status=? where id=? and doctorId=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,comment);
            ps.setInt(2, id);
            ps.setInt(3,doctorId);
            
            int i = ps.executeUpdate();
            if(i==1){
                bool=true;
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return bool;
    }
    
    public List<Appointment> getAllAppointment(){
        List<Appointment> list = new ArrayList<Appointment>();
        Appointment ap = null;
        
        try{
        
            String sql = "select * from appointment order by id desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ap=new Appointment();
                ap.setId(rs.getInt(1));
                ap.setuserId(rs.getInt(2));
                ap.setfullName(rs.getString(3));
                ap.setgender(rs.getString(4));
                ap.setage(rs.getString(5));
                ap.setappointmentDate(rs.getString(6));
                ap.setemail(rs.getString(7));
                ap.setphoneNo(rs.getString(8));
                ap.setdiseases(rs.getString(9));
                ap.setdoctorId(rs.getInt(10));
                ap.setaddress(rs.getString(11));
                ap.setstatus(rs.getString(12));
                list.add(ap);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
}
