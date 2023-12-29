/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author Hiral
 */
public class User {
    private int id;
    private String fullName;
    private String number;
    private String email;
    private String password;
    
    public User(){
    
    }
    
    public User(String fullName, String number, String email, String password){
        super();
        this.fullName=fullName;
        this.number=number;
        this.email=email;
        this.password=password;
    }

//    public User() {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//    
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
    
    public String getnumber(){
        return number;
    }
    
    public void setnumber(String number){
        this.number=number;
    }
    
    public String getemail(){
        return email;
    }
    
    public void setemail(String email){
        this.email=email;
    }
    
    public String getpassword(){
        return password;
    }
    
    public void setpassword(String password){
        this.password=password;
    }
}
