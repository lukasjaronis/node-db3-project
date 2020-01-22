-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT Product.ProductName, Category.CategoryName -- selecting ProductName from Product Table && CategoryName from Category Table.
FROM Product -- Getting ProductName first from Table Product
JOIN Category ON Product.CategoryId = Category.Id; -- Joining Category second where CategoryId is equal to Category table ID. 

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.Id, s.CompanyName
FROM "Order" as o
LEFT JOIN "Shipper" as s ON o.ShipVia = s.Id
WHERE o.OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT p.ProductName, o.Quantity -- selecting column row and the table
FROM "OrderDetail" AS o -- FROM order details and giving it a nickname
JOIN "Product" as p ON o.ProductId = p.Id -- JOINING Product with order.productID = product.Id
WHERE OrderId = 10251 -- selecting the specified orderID
ORDER BY p.ProductName; -- order the list by the product name


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.Id, cu.CompanyName, e.LastName
FROM "Order" AS o
JOIN "Customer" AS cu ON o.CustomerId = cu.Id
JOIN "Employee" AS e ON o.EmployeeId = e.Id;