USE shein;

/*
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR (64),
    MaterialName VARCHAR (64)
);

CREATE TABLE Seller (
    SellerID INT PRIMARY KEY,
    SellerName VARCHAR(64),
    InventoryCount INT,
    ProductID INT,
    FOREIGN KEY (ProductID)
REFERENCES Product(ProductID)
);


CREATE TABLE CustomerOrder (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID)
REFERENCES Customer(CustomerID)
);

CREATE TABLE Advertising (
    AdvertisingID INT PRIMARY KEY,
    SocialMediaPlatform VARCHAR (64),
    Revenue INT
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(64),
    LastName VARCHAR(64),
    Address VARCHAR(64),
    CardInfo VARCHAR(20), 
    CustomerEmail VARCHAR(64),
    ProductID INT,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);


BEGIN;

INSERT INTO Product (ProductID, ProductName, MaterialName)
VALUES (234, 'High Heels', 'Leather');

INSERT INTO Product (ProductID, ProductName, MaterialName)
VALUES (156, 'Dress Shoes', 'Suede');

INSERT INTO Customer (CustomerID, FirstName, LastName, Address, CardInfo, CustomerEmail, ProductID)
VALUES (1, 'Sara', 'Lee', '123 Main Street', 3456,'saralee@gmail.com', 234);

INSERT INTO Customer (CustomerID, FirstName, LastName, Address, CardInfo, CustomerEmail, ProductID)
VALUES (2, 'John', 'Doe', '1428 Elm Street', 4567, 'johndoe@yahoo.com', 156);

INSERT INTO Seller(SellerID, SellerName, InventoryCount, ProductID)
VALUES (587, 'Pinocchio', 1000, 234);

INSERT INTO Seller(SellerID, SellerName, InventoryCount, ProductID)
VALUES (382, 'Dumbo', 750, 156);

INSERT INTO CustomerOrder(OrderID, CustomerID)
VALUES (192848, 1);

INSERT INTO CustomerOrder (OrderID, CustomerID)
VALUES (203948, 2);


COMMIT;

-- Changes values in tables
ALTER TABLE customer
ADD order_amount INT;

ALTER TABLE customerorder
ADD item_amount INT;
*/


-- Two where
-- Two From
Select *
From customer
WHERE CustomerID = 1; -- Outline is all info from customerID 1

Select OrderID
From customerorder
WHERE CustomerID = 1; -- Shows the OrderID of customer ID 1

-- Two SET
UPDATE customer
Set order_amount=3
Where CustomerID=1; -- updates the order amount for customer with customerID 1

UPDATE product
Set MaterialName = "Pleather"
WHERE ProductID = 234; -- updates ProductID 234 material to pleather

-- aggregate/ Group By
Select *, SUM(order_amount) AS orderamounts
from customer -- counts how many orders there are
Group by CustomerID;

Select*, COUNT(CustomerID) AS buyerstotal
from customer -- counts how many customers there are
Group by CustomerID;

-- subquery 
Select *
From customer
WHERE CustomerID> (Select CustomerID -- Finds customers with ID's after 1
from customer
where CustomerID=1);
	
Select *
From seller
WHERE InventoryCount< (Select InventoryCount
from seller
where SellerID = 587);  

-- exists or unique
SELECT *
FROM customer
WHERE EXISTS
(SELECT FirstName FROM customer WHERE FirstName="Sara");

SELECT *
FROM seller
WHERE EXISTS
(SELECT InventoryCount FROM seller WHERE InventoryCount=750);

-- with
WITH newtable(Total) as
    (SELECT COUNT(order_amount)
    FROM customer)
    SELECT order_amount -- Checks if order amount for customer 2 is bigger than the total amount of orders in database
    FROM customer, newtable
    WHERE CustomerID=2 AND customer.CustomerID > newtable.Total;



-- Extra 5 SQL commands
-- Alter table


-- update, set and where
Update customerorder
Set item_amount=2
where OrderID = 192848;

Update customerorder
Set item_amount=5
where OrderID =203948 ;


/*INSERT INTO advertising
Values(1111,'Instagram',500);
*/

INSERT INTO advertising
Values (1112,'Instagram',200),
(1113,'Instagram',400),
(1114,'Facebook',5000);


