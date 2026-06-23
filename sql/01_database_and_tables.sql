```sql
-- Database and table creation examples from DAD 220 coursework.

  
-- Basic database creation examples.

-- Project One
CREATE DATABASE QuantigrationUpdates;
SHOW DATABASES;
USE QuantigrationUpdates;
```

-- Basic table creation examples.

-- Module One Lab
create table tb2(user_id VARCHAR(50));
show tables;
describe tb2;

-- Module Two Lab
CREATE TABLE Employee (
Employee_ID SMALLINT,
First_Name VARCHAR(40),
Last_Name VARCHAR(60),
Department_ID SMALLINT,
Classification VARCHAR(10),
Status VARCHAR(10),
Salary DECIMAL(7,2));

CREATE TABLE Branches (
Department_ID SMALLINT,
Department_Name VARCHAR(20));

DESCRIBE Employee;
DESCRIBE Branches;

-- Module Five Activity
CREATE TABLE Parts_Maintenance(
VehicleID VARCHAR(15) NOT NULL,
State CHAR(2) NOT NULL,
Repair VARCHAR(15) NOT NULL,
Reason VARCHAR(100) NOT NULL,
Year INT NOT NULL,
Make VARCHAR(50) NOT NULL,
BodyType VARCHAR(50) NOT NULL);
```

-- Relational table creation with primary and foreign keys.

-- QuantigrationRMA schema
CREATE TABLE Customers (
CustomerID INT,
FirstName VARCHAR(25),
LastName VARCHAR(25),
Street VARCHAR(50),
City VARCHAR(50),
State VARCHAR(25),
ZipCode VARCHAR(10),
Telephone VARCHAR(15),
PRIMARY KEY (CustomerID)
);

CREATE TABLE Orders (
OrderID INT,
CustomerID INT,
SKU VARCHAR(20),
Description VARCHAR(50),
PRIMARY KEY (OrderID),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE RMA (
RMAID INT,
OrderID INT,
Step VARCHAR(50),
Status VARCHAR(15),
Reason VARCHAR(15),
PRIMARY KEY (RMAID),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- QuantigrationUpdates schema from Project One
CREATE TABLE Customers (
CustomerID INT,
FirstName VARCHAR(25),
LastName VARCHAR(25),
Street VARCHAR(50),
City VARCHAR(50),
State VARCHAR(25),
ZipCode VARCHAR(10),
Telephone VARCHAR(15),
PRIMARY KEY (CustomerID));

CREATE TABLE Orders (
OrderID INT,
CustomerID INT,
SKU VARCHAR(20),
Description VARCHAR(50),
PRIMARY KEY (OrderID),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));

CREATE TABLE RMA (
RMAID INT,
OrderID INT,
Step VARCHAR(50),
Status VARCHAR(15),
Reason VARCHAR(15),
PRIMARY KEY (RMAID),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID));
```
