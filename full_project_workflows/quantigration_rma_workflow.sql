```sql
-- End-to-end QuantigrationRMA workflow.

CREATE DATABASE QuantigrationRMA;
SHOW DATABASES;
use QuantigrationRMA;

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

INSERT INTO Customers VALUES
(01,'John','Doe','123 Oak St','Springfield','IL','62701','2175551234'),
(02,'Jane','Smith','456 Mape Ave','Madison','WI','53703','6085552345'),
(03,'Michael','Johnson','789 Pine Rd','Denver','CO','80202','3035553456'),
(04,'Emily','Davis','101 Birch Ln','Seattle','WA','98101','2065554567'),
(05,'Chris','Brown','202 Cedar Blvd','Portland','OR','97201','5035555678'),
(06,'Amanda','Wilson','303 Elm St','Austin','TX','73301','5125556789'),
(07,'David','Martinez','404 Redwood Dr','Phoenix','AZ','85001','6025557890'),
(08,'Sarah','Miller','505 Walnut Ave','Chicago','IL','60601','3125558901'),
(09,'James','Taylor','606 Chestnut St','Nashville','TN','37201','6155559012'),
(10,'Olivia','Anderson','707 Ash Rd','San Francisco','CA','94101','4155550123');

CREATE VIEW Collaborator AS
SELECT
CustomerID AS CollaboratorID,
FirstName,
LastName,
State
FROM Customers;

DESCRIBE Collaborator;
SELECT * FROM Collaborator LIMIT 5;

ALTER TABLE Customers MODIFY COLUMN State VARCHAR(25);

LOAD DATA INFILE '/home/codio/workspace/customers.csv' INTO TABLE Customers FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA INFILE '/home/codio/workspace/orders.csv' INTO TABLE Orders FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA INFILE '/home/codio/workspace/rma.csv' INTO TABLE RMA FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT COUNT(*) AS OrderCount
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.City = 'Framingham' AND (Customers.State = 'MA' OR Customers.State = 'Massachusetts');

SELECT * FROM Customers WHERE (State = 'MA' OR State = 'Massachusetts');

INSERT INTO Customers VALUES
(100004, 'Luke', 'Skywalker', '17 Maiden Lane', 'New York', 'NY', '10222', '212-555-1234'),
(100005, 'Winston', 'Smith', '128 Sycamore Street', 'Greensboro', 'NC', '27401', '919-555-6623'),
(100006, 'MaryAnne', 'Jenkins', '2 Coconut Way', 'Jupiter', 'FL', '33458', '321-555-8907'),
(100007, 'Janet', 'Williams', '58 Redondo Beach Blvd', 'Torrence', 'CA', '90501', '310-555-5678');

INSERT INTO Orders VALUES
(1204305, 100004, 'ADV-24-10C', 'Advanced Switch 10GigE Copper 24 port'),
(1204306, 100005, 'ADV-48-10F', 'Advanced Switch 10 GigE Copper/Fiber 44 port copper 4 port fiber'),
(1204307, 100006, 'ENT-24-10F', 'Enterprise Switch 10GigE SFP+ 24 Port'),
(1204308, 100007, 'ENT-48-10F', 'Enterprise Switch 10GigE SFP+ 48 port');

SELECT COUNT(CustomerID) FROM Customers WHERE (State = 'RI' OR State = 'Rhode Island') AND City = 'Woonsocket';
SELECT Status, Step FROM RMA WHERE OrderID = 5175;
UPDATE RMA SET Status = 'Complete', Step = 'Credit Customer Account' WHERE OrderID = 5175;
SELECT Status, Step FROM RMA WHERE OrderID = 5175;
DELETE FROM RMA WHERE Reason = 'Rejected';
SELECT* FROM RMA WHERE Reason = 'Rejected';
SELECT* FROM Orders INTO OUTFILE '/home/codio/workspace/rmaOrders.csv';
```
