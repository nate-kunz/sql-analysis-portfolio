-- ============================================
-- 01) DATABASE SETUP
-- Create database and switch into it
-- ============================================

mysql> CREATE DATABASE QuantigrationUpdates;

mysql> SHOW DATABASES;

mysql> USE QuantigrationUpdates;

-- ============================================
-- 02) TABLE CREATION
-- Create the core tables for customers, orders, and RMAs
-- ============================================

mysql> CREATE TABLE Customers (
-> CustomerID INT,
-> FirstName VARCHAR(25),
-> LastName VARCHAR(25),
-> Street VARCHAR(50),
-> City VARCHAR(50),
-> State VARCHAR(25),
-> ZipCode VARCHAR(10),
-> Telephone VARCHAR(15),
-> PRIMARY KEY (CustomerID));

mysql> CREATE TABLE Orders (
-> OrderID INT,
-> CustomerID INT,
-> SKU VARCHAR(20),
-> Description VARCHAR(50),
-> PRIMARY KEY (OrderID),
-> FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));

mysql> CREATE TABLE RMA (
-> RMAID INT,
-> OrderID INT,
-> Step VARCHAR(50),
-> Status VARCHAR(15),
-> Reason VARCHAR(15),
-> PRIMARY KEY (RMAID),
-> FOREIGN KEY (OrderID) REFERENCES Orders(OrderID));
