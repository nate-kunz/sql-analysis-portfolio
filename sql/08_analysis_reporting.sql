```sql
-- Fleet maintenance analysis queries.

SELECT Repair, COUNT(*) AS FrequentRepair
FROM Parts_Maintenance
GROUP BY Repair
ORDER BY FrequentRepair DESC;

SELECT
CASE
WHEN State IN ('CT', 'ME', 'MA', 'NH', 'RI', 'VT', 'NJ', 'NY', 'PA') THEN 'Northeast'
WHEN State IN ('IL', 'IN', 'MI', 'OH', 'WI', 'IA', 'KS', 'MN', 'MO', 'NE', 'ND', 'SD') THEN 'Midwest'
WHEN State IN ('DE', 'FL', 'GA', 'MD', 'NC', 'SC', 'VA', 'DC', 'WV', 'AL', 'KY', 'MS', 'TN', 'AR', 'LA', 'OK', 'TX') THEN 'Southeast'
WHEN State IN ('AZ', 'CO', 'ID', 'MT', 'NV', 'NM', 'UT', 'WY') THEN 'Southwest'
WHEN State IN ('AK', 'CA', 'HI', 'OR', 'WA') THEN 'West'
END AS Region,
COUNT(*) AS RepairCount
FROM Parts_Maintenance
GROUP BY Region
ORDER BY RepairCount DESC;

SELECT
CASE
WHEN State IN ('CT', 'ME', 'MA', 'NH', 'RI', 'VT', 'NJ', 'NY', 'PA') THEN 'Northeast'
WHEN State IN ('IL', 'IN', 'MI', 'OH', 'WI', 'IA', 'KS', 'MN', 'MO', 'NE', 'ND', 'SD') THEN 'Midwest'
WHEN State IN ('DE', 'FL', 'GA', 'MD', 'NC', 'SC', 'VA', 'DC', 'WV', 'AL', 'KY', 'MS', 'TN', 'AR', 'LA', 'OK', 'TX') THEN 'Southeast'
WHEN State IN ('AZ', 'CO', 'ID', 'MT', 'NV', 'NM', 'UT', 'WY') THEN 'Southwest'
WHEN State IN ('AK', 'CA', 'HI', 'OR', 'WA') THEN 'West'
END AS Region,
Repair,
COUNT(*) AS RepairCount
FROM Parts_Maintenance
GROUP BY Region, Repair
ORDER BY Region, RepairCount DESC;

SELECT Repair, COUNT(*)
FROM Parts_Maintenance
WHERE Reason LIKE '%corrosion%' OR Reason LIKE '%rust%'
GROUP BY Repair
ORDER BY Repair DESC;

SELECT Repair AS Corrosion_Rust_Related_Repair, COUNT(*) AS RepairCount
FROM Parts_Maintenance
WHERE Reason LIKE '%corrosion%' OR Reason LIKE '%rust%'
GROUP BY Repair
ORDER BY RepairCount DESC;

SELECT Reason, COUNT(*) AS Windshield_Repair_Reason
FROM Parts_Maintenance
where Repair LIKE '%windshield%'
GROUP BY Reason
ORDER BY Windshield_Repair_Reason DESC;

```

```sql
-- RMA reporting queries from Project Two.

SELECT State, COUNT(RMA.RMAID) AS ReturnCount
FROM Collaborator
JOIN Orders ON Collaborator.CollaboratorID = Orders.CollaboratorID
JOIN RMA ON Orders.OrderID = RMA.OrderID
GROUP BY Collaborator.State
ORDER BY ReturnCount DESC;

SELECT Orders.Description AS ProductType, (COUNT(RMA.RMAID) / COUNT(Orders.OrderID)) * 100 AS ReturnPercentage
FROM Orders LEFT JOIN RMA ON Orders.OrderID = RMA.OrderID
GROUP BY Orders.Description
ORDER BY ReturnPercentage DESC;
```


```sql
-- Sales and returns analysis queries.

SELECT
CASE
WHEN Customers.State IN ('Arizona', 'AZ', 'New Mexico', 'NM', 'Texas', 'TX', 'Oklahoma', 'OK') THEN 'Southwest'
WHEN Customers.State IN ('Arkansas', 'AR', 'Louisiana', 'LA', 'Mississippi', 'MS', 'Alabama', 'AL', 'Georgia', 'GA', 'Florida', 'FL', 'Kentucky', 'KY', 'Tennessee', 'TN', 'South Carolina', 'SC', 'North Carolina', 'NC', 'Virginia', 'VA', 'West Virginia', 'WV', 'Delaware', 'DE', 'Maryland', 'MD', 'District of Columbia', 'DC') THEN 'Southeast'
WHEN Customers.State IN ('Pennsylvania', 'PA', 'New Jersey', 'NJ', 'New York', 'NY', 'Connecticut', 'CT', 'Rhode Island', 'RI', 'Massachusetts', 'MA', 'Vermont', 'VT', 'New Hampshire', 'NH', 'Maine', 'ME') THEN 'Northeast'
WHEN Customers.State IN ('North Dakota', 'ND', 'South Dakota', 'SD', 'Kansas', 'KS', 'Nebraska', 'NE', 'Minnesota', 'MN', 'Wisconsin', 'WI', 'Iowa', 'IA', 'Missouri', 'MO', 'Michigan', 'MI', 'Indiana', 'IN', 'Illinois', 'IL', 'Ohio', 'OH') THEN 'Midwest'
WHEN Customers.State IN ('Washington', 'WA', 'Idaho', 'ID', 'Montana', 'MT', 'Oregon', 'OR', 'Wyoming', 'WY', 'Colorado', 'CO', 'Utah', 'UT', 'Nevada', 'NV', 'California', 'CA') THEN 'West'
END AS Region,
COUNT(Orders.OrderID) AS SaleCount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Region
ORDER BY SaleCount DESC;

SELECT Orders.SKU, COUNT(Orders.OrderID) AS SaleCount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.State IS NOT NULL
GROUP BY Orders.SKU
ORDER BY SaleCount DESC
LIMIT 3;

SELECT Orders.SKU, COUNT(Orders.OrderID) AS SoutheasternSaleCount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.State IN ('VA', 'Virginia', 'NC', 'North Carolina', 'SC', 'South Carolina', 'GA', 'Georgia')
GROUP BY Orders.SKU
ORDER BY SoutheasternSaleCount DESC
LIMIT 3;

SELECT Orders.SKU, COUNT(RMA.RMAID) AS ReturnCount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN RMA ON Orders.OrderID = RMA.OrderID
WHERE Customers.State IS NOT NULL
GROUP BY Orders.SKU
ORDER BY ReturnCount DESC
LIMIT 3;

SELECT Orders.SKU, COUNT(RMA.RMAID) AS ReturnCount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN RMA ON Orders.OrderID = RMA.OrderID
WHERE Customers.State IN ('WA', 'Washington', 'OR', 'Oregon', 'ID', 'Idaho', 'MT', 'Montana')
GROUP BY Orders.SKU
ORDER BY ReturnCount DESC
LIMIT 3;
```
