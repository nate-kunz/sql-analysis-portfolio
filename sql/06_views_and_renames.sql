```sql
-- View creation and rename operations.

-- Collaborator view from Customers table
CREATE VIEW Collaborator AS
SELECT
CustomerID AS CollaboratorID,
FirstName,
LastName,
State
FROM Customers;

DESCRIBE Collaborator;
SELECT * FROM Collaborator LIMIT 5;

-- Table and column rename operations from Project One
SHOW CREATE TABLE Orders;
ALTER TABLE Orders DROP FOREIGN KEY Orders_ibfk_1;
ALTER TABLE Customers RENAME TO Collaborator;
ALTER TABLE Collaborator RENAME COLUMN CustomerID TO CollaboratorID;
ALTER TABLE Orders RENAME COLUMN CustomerID TO CollaboratorID;
ALTER TABLE Orders ADD FOREIGN KEY (CollaboratorID) REFERENCES Collaborator(CollaboratorID);
```
