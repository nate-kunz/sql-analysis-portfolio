```sql
-- File export examples using INTO OUTFILE.

select First_Name, Last_Name, Department.Department_Name
from Employee inner join Department on Employee.Department_ID = Department.Department_ID
where Employee.Department_ID = 3 OR Employee.Department_ID = 2
into outfile'/home/codio/workspace/HRandIS-Employees.csv' FIELDS TERMINATED BY',' LINES TERMINATED BY '\r\n';

quit
pwd
ls
cat HRandIS-Employees.csv

SELECT* FROM Orders INTO OUTFILE '/home/codio/workspace/rmaOrders.csv';

SELECT * FROM Orders INTO OUTFILE '/home/codio/workspace/QuantigrationUpdatesOrders.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n';
```
