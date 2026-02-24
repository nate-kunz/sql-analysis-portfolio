-- ============================================
-- 04) BASIC QUERIES (FILTERING / JOINING / COUNTING)
-- Example of queries run against the dataset
-- ============================================

mysql> SELECT COUNT (OrderID) AS OrderCount
-> FROM Orders
-> JOIN Customers ON Customers. CustomerID = Orders.OrderID
-> WHERE Customers.City = 'Framingham'
-> AND (Customers. State = 'Massachusetts' OR Customers.State = 'MA');

mysql> SELECT*
-> FROM Customers
-> WHERE State = 'Massachusetts' OR State = 'MA';

-- ============================================
-- 05) INSERTS (ADDING NEW RECORDS)
-- Adding new customers and orders
-- ============================================

mysql> INSERT INTO Customers
-> VALUES
-> (100004, 'Luke', 'Skywalker', '15 Maiden Lane', 'New York', 'New York', '10222', '212-555-1234'),
-> (100005, 'Winston', 'Smith', '123 Sycamore Street', 'Greensboro', 'North Carolina', '27401', '919-555-6623'),
-> (100006, 'MaryAnne', 'Jenkins', '1 Coconut Way', 'Jupiter', 'Florida', '33458', '321-555-8907'),
-> (100007, 'Janet', 'Williams', '55 Redondo Beach Blvd', 'Torrence', 'California', '90501', '310-555-5678');

-- ============================================
-- 06) ALTER TABLE (MODIFYING A COLUMN)
-- Expanding the Orders.Description column size
-- ============================================

mysql> ALTER TABLE Orders
-> MODIFY COLUMN Description VARCHAR(75);

mysql> INSERT INTO Orders
-> VALUES
-> (1204305, 100004, 'ADV-24-10C', 'Advanced Switch 10GigE Copper 24 port'),
-> (1204306, 100005, 'ADV-48-10F', 'Advanced Switch 10 GigE Copper/Fiber 44 port copper 4 port fiber'),
-> (1204307, 100006, 'ENT-24-10F', 'Enterprise Switch 10GigE SFP+ 24 Port'),
-> (1204308, 100007, 'ENT-48-10F', 'Enterprise Switch 10GigE SFP+ 48 port');

-- ============================================
-- 07) COUNTING WITH CONDITIONS
-- Counting customers based on city/state filters
-- ============================================

mysql> SELECT COUNT (CustomerID)
-> FROM Customers
-> WHERE City = 'Woonsocket'
-> AND (State = 'RI' OR State = 'Rhode Island');

mysql> SELECT COUNT (CustomerID) AS CustomerCount
-> FROM Customers
-> WHERE City = 'Woonsocket'
-> AND (State = 'RI' OR State = 'Rhode Island');

-- ============================================
-- 08) UPDATES
-- Reviewing and updating RMA workflow fields
-- ============================================

mysql> SELECT status, step
-> FROM RMA
-> WHERE OrderID = 5175;

mysql> UPDATE RMA
-> SET status = 'Complete', step = 'Credit Customer Account'
-> WHERE OrderID = 5175
-> :

mysql> SELECT status, step
-> FROM RMA
-> WHERE OrderID = 5175;

-- ============================================
-- 09) DELETES
-- Removing rejected returns from the RMA table
-- ============================================

mysql> DELETE FROM RMA
-> WHERE reason = 'Rejected';
