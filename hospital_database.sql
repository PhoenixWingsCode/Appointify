/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  Hiral
 * Created: Jun 10, 2023
 */
drop database if exists HMS; 

create database HMS;

use HMS;

create table userlogin(
    id int primary key auto_increment,
    fullname varchar(50) not null,
    phonenumber varchar(10) not null,
    email varchar(50) not null,
    userpassword varchar(20) not null
);

create table specialist(
    id int primary key auto_increment,
    spec_name varchar(50) not null    
);

create table doctor(
    id int primary key auto_increment,
    full_name varchar(45) not null,
    dob varchar(45) not null,
    qualification varchar(45) not null,
    specialist varchar(45) not null,
    email varchar(45) not null,
    mobno varchar(45) not null,
    password varchar(45) not null	
);

create table appointment(
	id int primary key auto_increment,
	userId int not null,
	fullName varchar(45) not null,
	gender varchar(45) not null,
	age varchar(45) not null,
	appointmentDate varchar(45) not null,
	email varchar(45) not null,
	phoneNo varchar(45) not null,
	diseases varchar(45) not null,
	doctorId int not null,
	address varchar(45) not null,
	status varchar(45) not null,
	FOREIGN KEY (userId) REFERENCES userlogin(id),
	FOREIGN KEY (doctorId) REFERENCES doctor(id)
);