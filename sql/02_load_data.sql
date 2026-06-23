```sql
-- CSV import examples using LOAD DATA INFILE.

-- QuantigrationRMA imports
LOAD DATA INFILE '/home/codio/workspace/customers.csv' INTO TABLE Customers FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA INFILE '/home/codio/workspace/orders.csv' INTO TABLE Orders FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA INFILE '/home/codio/workspace/rma.csv' INTO TABLE RMA FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

-- FleetMaintenanceRecords import
LOAD DATA INFILE '/home/codio/workspace/FleetMaintenanceRecords.csv'
INTO TABLE Parts_Maintenance
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Project One imports
LOAD DATA INFILE '/home/codio/workspace/customers.csv' INTO TABLE Customers FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n';
LOAD DATA INFILE '/home/codio/workspace/orders.csv' INTO TABLE Orders FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n';
LOAD DATA INFILE '/home/codio/workspace/rma.csv' INTO TABLE RMA FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n';
```

```sql
-- Manual data inserts from DAD 220 coursework.

-- Employee table records
INSERT INTO Employee VALUES
(100, 'John', 'Smith', 1, 'Exempt', 'Full-Time', 90000),
(101,'Mary','Jones',2,'Non-Exempt','Part-Time',35000),
(102,'Mary','Williams',3,'Exempt','Full-Time',80000);

INSERT INTO Employee VALUES
(103, 'Gwen', 'Johnson', 4, NULL, 'Full-Time', 40000),
(104, 'Michael', 'Jones', 4, 'Non-Exempt', 'Full-Time', 90000),
(105, 'Nate', 'Kunz', 1, 'Non-Exempt', 'Full-Time', 99000);

INSERT INTO Employee VALUES
(106, 'Adam', 'Sandler', 4, 'Exempt', 'Full-Time', 95000);

-- Department records
INSERT INTO Department VALUES
(1, 'Accounting'),
(2, 'Human Resources'),
(3, 'Information Systems'),
(4, 'Marketing');

-- Additional employee records
INSERT INTO Employee VALUES
(107, 'Emma', 'Richardson', 1, 'Exempt', 'Full-Time', 30000),
(108, 'Liam', 'Anderson', 2, 'Non-Exempt', 'Part-Time', 35000),
(109, 'Ava', 'Mitchell', 3, 'Exempt', 'Full-Time', 40000),
(110, 'Noah', 'Carter', 4, 'Non-Exempt', 'Part-Time', 45000),
(111, 'Sophia', 'Bennett', 1, 'Exempt', 'Full-Time', 50000),
(112, 'James', 'Parker', 2, 'Non-Exempt', 'Part-Time', 55000),
(113, 'Isabella', 'Lee', 3, 'Exempt', 'Full-Time', 60000),
(114, 'William', 'Davis', 4, 'Non-Exempt', 'Part-Time', 65000),
(115, 'Olivia', 'Harris', 1, 'Exempt', 'Full-Time', 70000),
(116, 'Benjamin', 'Moore', 2, 'Non-Exempt', 'Part-Time', 75000);

-- Sample customer records from QuantigrationRMA activity
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

-- New Customers records from QuantigrationRMA analysis
INSERT INTO Customers VALUES
(100004, 'Luke', 'Skywalker', '17 Maiden Lane', 'New York', 'NY', '10222', '212-555-1234'),
(100005, 'Winston', 'Smith', '128 Sycamore Street', 'Greensboro', 'NC', '27401', '919-555-6623'),
(100006, 'MaryAnne', 'Jenkins', '2 Coconut Way', 'Jupiter', 'FL', '33458', '321-555-8907'),
(100007, 'Janet', 'Williams', '58 Redondo Beach Blvd', 'Torrence', 'CA', '90501', '310-555-5678');

-- New Orders records from QuantigrationRMA analysis
INSERT INTO Orders VALUES
(1204305, 100004, 'ADV-24-10C', 'Advanced Switch 10GigE Copper 24 port'),
(1204306, 100005, 'ADV-48-10F', 'Advanced Switch 10 GigE Copper/Fiber 44 port copper 4 port fiber'),
(1204307, 100006, 'ENT-24-10F', 'Enterprise Switch 10GigE SFP+ 24 Port'),
(1204308, 100007, 'ENT-48-10F', 'Enterprise Switch 10GigE SFP+ 48 port');

-- classicmodels customer insert
INSERT INTO customers
VALUES (499, 'Nate', 'Kunz', 'Nate', '5086127890', '123 Main St', 'Apt 12', 'Boston', 'MA', '01234', 'US', 1504, 99000);
```
