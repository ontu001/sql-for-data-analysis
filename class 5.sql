-- Window Function,Subquery, Case Statement, Exists & not exists operation, any and all operation



--Create product_group table
CREATE TABLE product_groups (
	group_id serial PRIMARY KEY,
	group_name VARCHAR (255) NOT NULL
);



--Insert Data into product_group table
INSERT INTO product_groups (group_name)
VALUES
	('Smartphone'),
	('Laptop'),
	('Tablet');



-- Create Product Table
CREATE TABLE products (
	product_id serial PRIMARY KEY,
	product_name VARCHAR (255) NOT NULL,
	price DECIMAL (11, 2),
	group_id INT NOT NULL,
	FOREIGN KEY (group_id) REFERENCES product_groups (group_id)
);





--Insert Data into products Table
INSERT INTO products (product_name, group_id,price)
VALUES
	('Microsoft Lumia', 1, 200),
	('HTC One', 1, 400),
	('Nexus', 1, 500),
	('iPhone', 1, 900),
	('HP Elite', 2, 1200),
	('Lenovo Thinkpad', 2, 700),
	('Sony VAIO', 2, 700),
	('Dell Vostro', 2, 800),
	('iPad', 3, 700),
	('Kindle Fire', 3, 150),
	('Samsung Galaxy Tab', 3, 200);





Select * from products;
Select * from product_groups;



-- Case statement 
--Use to make logical condition starts with 'case' then at the middhe set the conditions using when and else theen finish with 'end'

/*
Categorise the price from the products table  based on the budget range,
If the
1. price>700 = Premium
2. price <300 = Budget Frindly
3. Price between 300 to 700 = Mid Range
*/


select
	product_name,
	price,
	case
		when price> 700 then'Premium'
		when price between 300 and 700 then 'Mid Range'
		when price< 300 then 'Budget Friendly'
		else 'Undefined'
	end as Price_Category
from
	products;






-- Find out how many products are there under the 3 price category

select
	case
		when price> 700 then'Premium'
		when price between 300 and 700 then 'Mid Range'
		when price< 300 then 'Budget Friendly'
		else 'Undefined'
	end as Price_Category,
	count
		(product_name) as Product_Count
from
	products
group by
	1       -- using 1 means I want to group the result base on !st column,(Best PRactice). We can also use "Price_Category" instade of 1
order by
	Product_Count asc;




-- Add 15%, 20% and 10% discount based on product_group
select
    product_name,
    price,
    group_id,
    case
        when group_id = 1 then round(price * 0.85, 2)
        when group_id = 2 then round(price * 0.80, 2)
        when group_id = 3 then round(price * 0.90, 2)
        else price
    end as Discount_Price,
    case -- to show dicounted amount
        when group_id = 1 then round(price - (price * 0.85), 2)
        when group_id = 2 then round(price - (price * 0.80), 2)
        when group_id = 3 then round(price - (price * 0.90), 2)
        else 0
    end as Discount_Amount,
    case -- to show dicount percentage with the % symbol
        when group_id = 1 then cast(round((1 - 0.85) * 100, 0) as varchar) || '%'
        when group_id = 2 then cast(round((1 - 0.80) * 100, 0) as varchar) || '%'
        when group_id = 3 then cast(round((1 - 0.90) * 100, 0) as varchar) || '%'
        else '0%'
    end as Discount_Percentage
from
    products;







-- Subquery (Query inside a query). Use for extracts complex result.

-- Find those products which have higher price than the average price. 
select
	*
from
	products
where
	price > (select
	avg(price)
from
	products)



-- Find those products which have minimum price. 
select
	*
from
	products
where
	price = (select
	min(price)
from
	products)





-- Window Function
--Make a minimum price column which will find the minimum price for each group
Select
	product_id,
	product_name,
	price,
	group_id,
	min(price) over (partition by group_id)
from
	products



--Make a average price column which will find the average price for each group
Select
	product_id,
	product_name,
	price,
	group_id,
	avg(price) over (partition by group_id)
from
	products




-- Create a serial/row number for each group
Select
	product_id,
	product_name,
	price,
	group_id,
	row_number() over (partition by group_id)
from
	products




-- Find the highest price prodcut from each group/product_category.
select
	product_name,
	price
from
(Select
	product_id,
	product_name,
	price,
	group_id,
	row_number() over (partition by group_id order by price desc) as row_num
from
	products)
where
	row_num = 1
order by
	price desc;







--Rank ( use for positioning based on a column) -- After a repeat value it skip the next number , ex: 4,4,6
-- Positioning the product based on price column
Select
	product_id,
	product_name,
	price,
	group_id,
	rank() over (partition by group_id order by price desc)
from
	products



--dense_ank ( use for positioning based on a column) -- After a repeat value it  dosen't skip the next number , ex: 4,4,5
-- Positioning the product based on price column
Select
	product_id,
	product_name,
	price,
	group_id,
	dense_rank() over (partition by group_id order by price desc)
from
	products




