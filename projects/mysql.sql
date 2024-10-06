-- Q7 [10 pt] Write an SQL query to find the names of products that have less than10 units in 
-- inventory but have sold more than 5 units overall. Include the product
-- name, units sold, and available quantity.

create database store;
show databases;
use store;

show tables;
select * from products;
select * from inventory;
select * from sales;

select p.product_name, sum(s.units_sold) as units_sold, i.quantity
from products p
join inventory i on p.product_id = i.product_id
join sales s on p.product_id = s.product_id
group by p.product_name, i.quantity
having i.quantity < 10 and sum(s.units_sold) >= 5;

-- Q8 [10 pt] Write an SQL query to find all products in the Electronics category 
-- that have less than 10 units available in inventory, for this question, also provide 
-- corresponding Relational Algebra

select * from products p
join inventory i on p.product_id = i.product_id
where quantity < 10 
and category = 'Electronics';


select p.product_name, p.category, p.price
from products p
join sales s on p.product_id = s.product_id
join inventory i on p.product_id = i.product_id
where units_sold > 0
and quantity > 5;


select p.product_name, p.category, p.price
from products p
join sales s on p.product_id = s.product_id
join inventory i on p.product_id = i.product_id
where units_sold > 0
and quantity > 5;



