--Table 1: Products Table
/*
This table, products will store information about each item
such as, its id, name, classification and price
*/

--Step I: Build table.

CREATE TABLE
	products (product_id INT PRIMARY KEY, product_name VARCHAR(255),
				category VARCHAR(100), price DECIMAL(10,2));
SELECT 
	*
FROM 
	products;
SELECT product_id FROM products WHERE product_id = 104;

--Step II: Populate products table

INSERT INTO
	products VALUES
		(100, 'cushion', 'furniture', 46.99),
		(101, 'shirt', 'clothes', 4.89),
		(102, 'trouser', 'clothes', 2.99),
		(104, 'hat', 'clothes', 2.19),
		(105, 'underwear', 'clothes', 1.11),
		(106, 'bed', 'furniture', 23.88),
		(107, 'skirts', 'clothes', 1.22),
		(108, 'lotions', 'cosmetics', 0.76),
		(109, 'soap', 'cosmetics', 0.34),
		(110, 'lipstick', 'cosmetics', 0.22),
		(111, 'powder', 'cosmetics', 0.11),
		(112, 'tv', 'electronics', 12.99),
		(113, 'radio', 'electronics', 14.33),
		(114, 'microwave', 'electronics', 11.22),
		(115, 'phone', 'electronics', 54.99),
		(116, 'laptop', 'electronics', 76.99),
		(117, 'cooker', 'electronics', 44.88),
		(118, 'fridge', 'electronics', 24.77),
		(119, 'freezer', 'electronics', 31.99),
		(120, 'washer', 'electronics', 28.99),
		(121, 'light bulb', 'electronics', 0.65),
		(122, 'rice', 'foods', 2.10),
		(123, 'cereal', 'foods', 1.11),
		(124, 'biscuit', 'foods', 0.22),
		(125, 'vegetables', 'foods', 1.22); 

--Table 2: Suppliers Table
/*
This table will store information about each Supplier
including their contact information
*/

--Step I: Build table.

CREATE TABLE
	suppliers 
		(supplier_id VARCHAR(255) PRIMARY KEY, supplier_name VARCHAR(255),
		contact_email VARCHAR(255), phone_no VARCHAR(15));
SELECT 
	*
FROM
	suppliers;

--Step II: Populate suppliers table

INSERT INTO 
	suppliers VALUES
		('AS-123', 'asung', 'asung@abc.com', 0123452160),
		('BS-234', 'bsos', 'bsos@bcd.net', 0123112234),
		('FO-345', 'foreal', 'foreal@cde.com', 0192134575),
		('LR-456', 'loris', 'loris@def.net', 0132149900),
		('MD-567', 'midl', 'midl@efg.com', 0155123809);

--Table 3: Inventory Table
/*
This table will manage the company's stock levels
*/

--Step I: Build table.

CREATE TABLE 
	inventory (inventory_id VARCHAR(255) PRIMARY KEY, product_id INT, 
					quantity INT, supplier_id VARCHAR(255), last_updated date);
SELECT *
FROM
	inventory;
	
--Adding foreign keys to columns
ALTER TABLE
	inventory
ADD CONSTRAINT
	product_id
FOREIGN KEY (product_id)
REFERENCES
	products;

ALTER TABLE
	inventory
ADD CONSTRAINT
	supplier_id
FOREIGN KEY (supplier_id)
REFERENCES
	suppliers;

--Step 2: Populate table

INSERT INTO
	inventory VALUES
	('INV031', 122, 14, 'MD-567', '2024-08-29'),
	('INV002', 123, 21, 'MD-567', '2024-09-01'),
	('INV003', 124, 10, 'MD-567', '2024-08-02'),
	('INV004', 125, 15, 'MD-567', '2024-08-15'),
	('INV005', 124, 16, 'MD-567', '2024-09-03'),
	('INV006', 100, 6, 'LR-456', '2024-08-10'),
	('INV007', 106, 8, 'LR-456', '2024-08-10'),
	('INV008', 100, 6, 'LR-456', '2024-10-10'),
	('INV009', 106, 4, 'LR-456', '2024-09-29'),
	('INV011', 107, 7, 'BS-234', '2024-08-04'),
	('INV012', 101, 14, 'BS-234', '2024-08-04'),
	('INV013', 102, 18, 'BS-234', '2024-08-04'),
	('INV015', 104, 13, 'BS-234', '2024-09-19'),
	('INV016', 105, 10, 'BS-234', '2024-09-19'),
	('INV017', 112, 20, 'AS-123', '2024-08-04'),
	('INV018', 113, 40, 'AS-123', '2024-08-05'),
	('INV019', 114, 20, 'AS-123', '2024-08-04'),
	('INV020', 115, 50, 'AS-123', '2024-08-04'),
	('INV021', 116, 45, 'AS-123', '2024-08-04'),
	('INV022', 117, 33, 'AS-123', '2024-09-05'),
	('INV023', 118, 15, 'AS-123', '2024-09-03'),
	('INV024', 119, 18, 'AS-123', '2024-08-08'),
	('INV025', 120, 35, 'AS-123', '2024-08-04'),
	('INV026', 121, 50, 'AS-123', '2024-08-04'),
	('INV027', 108, 42, 'FO-345', '2024-08-03'),
	('INV028', 109, 38, 'FO-345', '2024-08-04'),
	('INV029', 110, 55, 'FO-345', '2024-08-04'),
	('INV030', 111, 33, 'FO-345', '2024-08-03');

SELECT * FROM inventory;

--Table 4: Transactions Table
/*
This table will record product transactions either purchases
(stocking up) or sales (reducing stock).
*/

--Step I: Create the "ENUM" data type

create type transac as enum (
  'sale',
  'purchase'
 );
--Step II: Build table.
create table transactions (
  transaction_id INT NOT NULL PRIMARY KEY, transactions_type transac,
  product_id INT, transaction_date DATE, quantity INT NOT NULL
 	);

SELECT 
	* 
FROM 
	transactions;

--Step 3: Populate table

INSERT INTO transactions VALUES
			(20240803, 'purchase', 100, '2024-07-01', 20)
			;
INSERT INTO 
	transactions VALUES
		(001, 'purchase', 100, '2024-07-01', 10),
		(002, 'purchase', 100, '2024-07-01', 5),
		(003, 'purchase', 101, '2024-07-04', 9),
		(004, 'purchase', 101, '2024-07-05', 11),
		(005, 'sale', 103, '2024-11-01', 4),
		(006, 'purchase', 103, '2024-07-03', 12),
		(007, 'sale', 105, '2024-07-03', 17),
		(008, 'purchase', 106, '2024-07-08', 20),
		(009, 'purchase', 107, '2024-07-08', 13),
		(010, 'sale', 112, '2024-07-09', 10)
		;

--Performing basic functionalities:
/* 
Q1. determining stock levels 
of various products using "INNER JOIN".
*/

SELECT 
	a.product_id,
	a.product_name,
	b.quantity
FROM
	products AS a
INNER JOIN 
	inventory AS b
ON a.product_id = b.product_id
ORDER BY
	quantity DESC;

/* 
The query above reveals the current stock levels by displaying
the Product IDs, Names and Quantity from the products and inventory 
tables. By joining these tables using the product_id, it allows
the query match each product with its corresponding stock quantity. 
*/


-- Q2. Update stock levels after sale or purchase
-- (i) Updating the stock after product sale
UPDATE 
	inventory
SET 
	quantity = quantity - 13
WHERE
	product_id = 108;
UPDATE 
	inventory
SET 
	quantity = quantity + 5
WHERE
	product_id = 108;
/* 
The query above updates inventory records after a sale 
was done by decreasing the quantity of "underwears" 
(product_id = 105) by 2 units. 
*/

SELECT product_id FROM transactions WHERE transactions_type = 'sale';

-- (ii) Updating the stock after product purchase

UPDATE 
	inventory
SET 
	quantity = quantity + 20
WHERE 
	product_id = 105;
/* 
The above query updates inventory records after making 
a purchase by increasing the quantity of "underwears"
(product_id = 105) by 20 units.
*/


/*  
Q3 (i): The below query retrieves the transaction history for all the products. 
By joining the Transactions and Products tables on
product_id, it returns transactions related to every product. 
This enables the user review the sale and purchase activies linked with the 
specific item.
*/
SELECT 
	b.product_id,
	a.transaction_id,
	a.transaction_type,
	a.quantity,
	a.transaction_date
FROM
	transactions AS a
INNER JOIN 
	products AS b
ON
	a.product_id=b.product_id;

/*
Q3 (ii): This query below retrieves the transaction history for a specific product, 
underwear with product_id = 105. By joining the Transactions and Products tables on
product_id, it only returns transactions related to the particular product. 
This enables the user review the sale and purchase activies linked with the 
specific item.
*/

SELECT 
	a.product_id,
	b.transaction_id,
	b.transaction_type,
	b.transaction_date
FROM
	products AS a
INNER JOIN 
	transactions AS b
ON
	a.product_id=b.product_id
WHERE 
	a.product_id = 105;

/* 
Q4. Enumerating low stock levels 
of various products using "JOIN".
*/

SELECT 
	p.product_id,
	p.product_name,
	i.quantity
FROM
	products AS p
JOIN
	inventory AS i
ON
	p.product_id=i.product_id
WHERE 
	quantity < 5;

/*
This query above retrieves a list of products that are low on stock levels.
It specifies those fewer than 5 available units. By joining product name column
from the products table and quantity column from inventory table, products meeting
the above criteria were retrieved usig the WHERE clause as a filter.
This is useful for inventory management, enabling the business to identify items
that require re-ordering.
*/

DELETE FROM transactions
WHERE transaction_id = 20240803

/* 
Q5. Generating monthly sales report.
*/

SELECT
	p.product_name, SUM(t.quantity) AS "quantity sold"
FROM 
	products AS p
JOIN 
	transactions AS t
ON 
	p.product_id = t.product_id
WHERE 
	t.transaction_type = 'sale'
AND
	t.transaction_date BETWEEN '2024-07-01' AND '2024-11-01'
GROUP BY
	p.product_name;

	
