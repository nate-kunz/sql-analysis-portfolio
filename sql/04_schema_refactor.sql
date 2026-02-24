-- ============================================
-- 10) SCHEMA REFACTOR
-- Rename Customers table to Collaborator and update key relationships
-- ============================================

-- Drop the existing foreign key from Orders before renaming columns/tables
mysql> ALTER TABLE Orders
-> DROP FOREIGN KEY Orders_ibfk_1;

-- Rename the Customers table
mysql> ALTER TABLE Customers
-> RENAME TO Collaborator;

-- Rename the primary key column in the renamed table
mysql> ALTER TABLE Collaborator
-> RENAME COLUMN CustomerID TO CollaboratorID;

-- Rename the foreign key column in Orders to match the new CollaboratorID naming
mysql> ALTER TABLE Orders
-> RENAME COLUMN CustomerID TO CollaboratorID;

-- Re-add the foreign key relationship using the new names
mysql> ALTER TABLE Orders
-> ADD FOREIGN KEY (CollaboratorID)
-> REFERENCES Collaborator(CollaboratorID);
