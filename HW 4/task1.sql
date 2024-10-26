-- Drop the database if it exists and recreate it
DROP DATABASE IF EXISTS pet_database;
CREATE DATABASE pet_database;
USE pet_database;

-- Drop tables if they already exist
DROP TABLE IF EXISTS petPet, petEvent;

-- Create petPet table
CREATE TABLE petPet (
  petname VARCHAR(50) PRIMARY KEY,  
  owner VARCHAR(50) NOT NULL,       
  species VARCHAR(30) NOT NULL,     
  gender CHAR(1) CHECK (gender IN ('M', 'F')), 
  birth DATE NOT NULL,              
  death DATE                         
);

-- Create petEvent table with foreign key referencing petPet table
CREATE TABLE petEvent (
  petname VARCHAR(50),              
  eventdate DATE NOT NULL,          
  eventtype VARCHAR(50) NOT NULL,   
  remark TEXT,                      
  FOREIGN KEY (petname) REFERENCES petPet(petname) ON DELETE CASCADE, 
  PRIMARY KEY (petname, eventdate)  
);

