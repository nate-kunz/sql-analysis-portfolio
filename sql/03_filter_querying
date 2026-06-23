```sql
-- Basic validation queries.

show databases;
use kunz;
show tables;
describe tb2;
desc tb2;

DESCRIBE Employee;
DESCRIBE Branches;
SELECT* FROM Employee;
SELECT First_Name, Last_Name, Employee_ID, Department_ID FROM Employee;
SELECT* FROM Department;

use classicmodels;
show tables;
desc customers;
select * from customers;

DESC orders;
SELECT * FROM orders WHERE orderNumber IN (10330, 10338, 10194);

DESC payments;
SELECT * FROM payments WHERE customerNumber = 103;

DESC Customers;
DESC Orders;
SELECT Status, Step FROM RMA WHERE OrderID = 5175;
SELECT* FROM RMA WHERE Reason = 'Rejected';
```

```sql
-- Filtering and counting examples.

SELECT COUNT(*) AS OrderCount
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.City = 'Framingham' AND (Customers.State = 'MA' OR Customers.State = 'Massachusetts');

SELECT * FROM Customers WHERE (State = 'MA' OR State = 'Massachusetts');

SELECT COUNT(CustomerID) FROM Customers WHERE (State = 'RI' OR State = 'Rhode Island') AND City = 'Woonsocket';

SELECT COUNT(CustomerID) AS CustomerCount
FROM Customers
WHERE City = 'Woonsocket' AND (State = 'RI' OR State = 'Rhode Island');

SELECT Orders.SKU, COUNT(Orders.OrderID) AS SaleCount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.State IS NOT NULL
GROUP BY Orders.SKU
ORDER BY SaleCount DESC
LIMIT 3;
```

```sql
-- classicmodels relationship and cardinality joins.

select firstName, lastName, jobTitle, offices.city
from employees inner join offices on employees.officeCode = offices.officeCode
where state = 'CA';

SELECT firstName, lastName, jobTitle, offices.city
FROM employees INNER JOIN offices ON employees.officeCode = offices.officeCode
WHERE state = 'NY';

SELECT customers.*, employees.firstName AS salesRepFirstName, employees.lastName AS salesRepLastName
FROM customers INNER JOIN employees ON customers.salesRepEmployeeNumber = employees.employeeNumber
WHERE employees.employeeNumber = 1504;

SELECT customers.*, employees.firstName AS salesRepFirstName, employees.lastName AS salesRepLastName
FROM customers INNER JOIN employees ON customers.salesRepEmployeeNumber = employees.employeeNumber
WHERE customers.state = 'MA';
```
