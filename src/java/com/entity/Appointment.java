/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author Hiral
 */
public class Appointment {
    private int id;
    private int userId;
    private String fullName;
    private String gender;
    private String age;
    private String appointmentDate;
    private String email;
    private String phoneNo;
    private String diseases;
    private int doctorId;
    private String address;
    private String status;
    
    public Appointment(){
        super();
    }
    
    public Appointment(int userId, String fullName, String gender, String age, String appointmentDate, String email, 
            String phoneNo, String diseases, int doctorId, String address, String status){
        super();
        this.userId=userId;
        this.fullName=fullName;
        this.gender=gender;
        this.age=age;
        this.appointmentDate=appointmentDate;
        this.email=email;
        this.phoneNo=phoneNo;
        this.diseases=diseases;
        this.doctorId=doctorId;
        this.address=address;
        this.status=status;
    }
    
    public int getId(){
        return id;
    }
    
    public void setId(int id){
        this.id=id;
    }
    
    public int getuserId(){
        return userId;
    }
    
    public void setuserId(int userId){
        this.userId=userId;
    }
    
    public String getfullName(){
        return fullName;
    }
    
    public void setfullName(String fullName){
        this.fullName=fullName;
    }

    public String getgender(){
        return gender;
    }
    
    public void setgender(String gender){
        this.gender=gender;
    }

    public String getage(){
        return age;
    }
    
    public void setage(String age){
        this.age=age;
    }
    
    public String getappointmentDate(){
        return appointmentDate;
    }
    
    public void setappointmentDate(String appointmentDate){
        this.appointmentDate=appointmentDate;
    }

    public String getemail(){
        return email;
    }
    
    public void setemail(String email){
        this.email=email;
    }
    
    public String getphoneNo(){
        return phoneNo;
    }
    
    public void setphoneNo(String phoneNo){
        this.phoneNo=phoneNo;
    }
    
    public String getdiseases(){
        return diseases;
    }
    
    public void setdiseases(String diseases){
        this.diseases=diseases;
    }
    
    public int getdoctorId(){
        return doctorId;
    }
    
    public void setdoctorId(int doctorId){
        this.doctorId=doctorId;
    }
    
    public String getaddress(){
        return address;
    }
    
    public void setaddress(String address){
        this.address=address;
    }
    
    public String getstatus(){
        return status;
    }
    
    public void setstatus(String status){
        this.status=status;
    }
}
