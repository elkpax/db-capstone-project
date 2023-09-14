-- Task 1 : OrdersView that focuses on orders with quantity >  2
CREATE VIEW OrdersView AS (
SELECT OrderID, Quantity, Bill_Amount
FROM Orders
WHERE Quantity > 2
);

-- Task 2 : Customers with orders that cost more than $150
SELECT c.CustomerID, c.CustomerName AS FullName, 
	   o.OrderID, o.TotalCost AS Cost,
       m.Cuisine AS MenuName,
       i.ItemName AS CourseName
FROM customers c
INNER JOIN orders o
	ON c.CustomerID = o.CustomerID
INNER JOIN menus m
	ON m.MenuID = o.MenuID
INNER JOIN menuitems i
	ON i.ItemID = m.ItemID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost;

-- Task 3 : all menu items for which more than 2 orders have been placed
SELECT ItemName AS MenuName
FROM menuitems
WHERE ItemID = ANY (SELECT m.ItemID
					FROM orders o
					INNER JOIN menus m
						ON o.MenuID = m.MenuID
					WHERE o.Quantity > 2);