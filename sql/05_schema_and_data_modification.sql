```sql
-- ALTER TABLE examples.

alter table tb2 add newfield VARCHAR(25);
desc tb2;

ALTER TABLE Branches RENAME TO Department;

ALTER TABLE Customers MODIFY COLUMN State VARCHAR(25);

DESC Orders;
ALTER TABLE Orders
MODIFY COLUMN Description VARCHAR(75);
```

```sql
-- UPDATE and DELETE examples.

DELETE FROM payments WHERE customerNumber = 103;
SELECT * FROM payments WHERE customerNumber = 103;

SELECT Status, Step FROM RMA WHERE OrderID = 5175;
UPDATE RMA SET Status = 'Complete', Step = 'Credit Customer Account' WHERE OrderID = 5175;
SELECT Status, Step FROM RMA WHERE OrderID = 5175;

DELETE FROM RMA WHERE Reason = 'Rejected';
SELECT* FROM RMA WHERE Reason = 'Rejected';

SELECT status, step FROM RMA WHERE OrderID = 5175;
UPDATE RMA SET status = 'Complete', step = 'Credit Customer Account' WHERE OrderID = 5175;
SELECT status, step FROM RMA WHERE OrderID = 5175;

DELETE FROM RMA WHERE reason = 'Rejected';
```
