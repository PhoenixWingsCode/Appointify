/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author Hiral
 */
public class Doctor {
    
    private int id;
    private String fullName;
    private String dob;
    private String qualification;
    private String specialist;
    private String email;
    private String mobNo;
    private String password;
    
    public Doctor(){
        super();
    }
    
    public Doctor(String fullName,String dob,String qualification,String specialist,String email,String mobNo,
            String password){
        super();
        this.fullName=fullName;
        this.dob=dob;
        this.qualification=qualification;
        this.specialist=specialist;
        this.email=email;
        this.mobNo=mobNo;
        this.password=password;
    }

    public Doctor(int id,String fullName,String dob,String qualification,String specialist,String email,String mobNo,
            String password){
        super();
        this.id=id;
        this.fullName=fullName;
        this.dob=dob;
        this.qualification=qualification;
        this.specialist=specialist;
        this.email=email;
        this.mobNo=mobNo;
        this.password=password;
    }
    
    public int getId(){
        return id;
    }
    
    public void setId(int id){
        this.id=id;
    }
    
    public String getfullName(){
        return fullName;
    }
    
    public void setfullName(String fullName){
        this.fullName=fullName;
    }
    
    public String getdob(){
        return dob;
    }
    
    public void setdob(String dob){
        this.dob=dob;
    }
    
    public String getqualification(){
        return qualification;
    }
    
    public void setqualification(String qualification){
        this.qualification=qualification;
    }
    
    public String getspecialist(){
        return specialist;
    }
    
    public void setspecialist(String specialist){
        this.specialist=specialist;
    }
    
    public String getemail(){
        return email;
    }
    
    public void setemail(String email){
        this.email=email;
    }
    
    public String getmobNo(){
        return mobNo;
    }
    
    public void setmobNo(String mobNo){
        this.mobNo=mobNo;
    }
    
    public String getpassword(){
        return password;
    }
    
    public void setpassword(String password){
        this.password=password;
    }
}
