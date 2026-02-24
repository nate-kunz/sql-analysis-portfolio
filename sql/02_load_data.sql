-- ============================================
-- 03) DATA LOADING
-- Bulk load CSV data into the database tables
-- ============================================

mysql> LOAD DATA INFILE '/home/codio/workspace/customers.csv'
-> INTO TABLE Customers
-> FIELDS TERMINATED BY ','
-> ENCLOSED BY '\"'
-> LINES TERMINATED BY '\r\n';

mysql> LOAD DATA INFILE '/home/codio/workspace/orders.csv'
-> INTO TABLE Orders
-> FIELDS TERMINATED BY ','
-> ENCLOSED BY '\"'
-> LINES TERMINATED BY '\r\n';

mysql> LOAD DATA INFILE '/home/codio/workspace/rma.csv'
-> INTO TABLE RMA
-> FIELDS TERMINATED BY '
-> ENCLOSED BY '\"'
-> LINES TERMINATED BY '\r\n';
