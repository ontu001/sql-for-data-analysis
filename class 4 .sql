
-- Create table: 'old_customers'
CREATE TABLE old_customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

-- Create table: 'new_customers'
CREATE TABLE new_customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

-- insert data into old_customer
INSERT INTO old_customers (customer_id, name, city) VALUES
(1, 'Alice', 'Dhaka'),
(2, 'Bob', 'Chittagong'),
(3, 'Charlie', 'Sylhet');



-- insert data into new_customer
INSERT INTO new_customers (customer_id, name, city) VALUES
(3, 'Charlie', 'Sylhet'),
(4, 'David', 'Dhaka'),
(5, 'Emma', 'Rajshahi');



-- show all data from both tables
select * from old_customers;
select * from new_customers;




--- UNION --- Merges all unique rows from two or more SELECT statements, eliminating duplicates.
SELECT
	*
FROM
	old_customers
UNION
SELECT
	*
FROM
	new_customers
ORDER BY
	customer_id asc;





--- UNION ALL --- Merges all rows from two or more SELECT statements, keeping duplicates.
SELECT
	*
FROM
	old_customers
UNION ALL
SELECT
	*
FROM
	new_customers
ORDER BY
	customer_id asc;







-- INTERSECT -- Returns only the rows that appear in both SELECT statements.
SELECT
	*
FROM
	old_customers
INTERSECT
SELECT
	*
FROM
	new_customers
ORDER BY
	customer_id asc;






-- EXCEPT -- Returns rows from the first SELECT statement that don't appear in the second.
SELECT
	*
FROM
	old_customers
EXCEPT
SELECT
	*
FROM
	new_customers
ORDER BY
	customer_id asc;


 --database normalization

 --primary key



 -- foregien key

  --unique key


----------------- JOIN ----------------------

-- Create customer table

drop table customers ; -- remove the table if it already exist before create new 

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

drop table orders; -- remove the table if it already exist before create new 

-- Creating the Orders table (Child Table)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);



---- Insert data in both tables
INSERT INTO customers (customer_id, name, city) VALUES
(1, 'Alice', 'Dhaka'),
(2, 'Bob', 'Chittagong'),
(3, 'Charlie', 'Sylhet'),
(4, 'Tai', 'Barishal');

INSERT INTO orders (order_id, customer_id, product, amount) VALUES
(101, 1, 'Laptop', 800.00),
(102, 1, 'Mouse', 20.00),
(103, 2, 'Keyboard', 50.00),
(104, 4, 'Monitor', 200.00);




SELECT * FROM customers;
SELECT * FROM orders;

--Inner join
-- Returns only customer who have placed order
select
	customers.customer_id,
	orders.order_id,
	customers.name as Customer_name,
	orders.product as Product_name
	
from
	customers
inner join
	orders on 
		customers.customer_id = orders.customer_id;

		


--Left jjoin
-- Returns all customer who can placed order or not
select
	customers.customer_id,
	orders.order_id,
	customers.name as Customer_name,
	orders.product as Product_name
	
from
	customers
left join
	orders on 
		customers.customer_id = orders.customer_id;


--Right join
-- Returns all order infromation who can placed order or not
select
	customers.customer_id,
	orders.order_id,
	customers.name as Customer_name,
	orders.product as Product_name
	
from
	customers
right join
	orders on 
		customers.customer_id = orders.customer_id;

--Full outer join
-- Returns all  infromation from both table
select
	customers.customer_id,
	orders.order_id,
	customers.name as Customer_name,
	orders.product as Product_name
	
from
	customers
full join
	orders on 
		customers.customer_id = orders.customer_id;


		

--Cross join
-- It will assign every product under each person
select
	customers.name as customer_name,
	orders.product as product_name
from
	customers
cross join
	orders;



-- Natural join



--self join
--Customers who lived in same city
select
	A.name as customer_1,
	B.name as customer_2,
	A.city
from
	customers A
join
	customers B on A.city = B.city and A.customer_id <> B.customer_id;

