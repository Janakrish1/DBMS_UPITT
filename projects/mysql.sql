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

-- Homework 2 
show databases;
use Company;

show tables;

select * from Employees;
select * from Departments;
select * from Projects;
select * from Employee_project;

-- Q1 [10 pt] Write an SQL query to return the department name and the average salary of the employees 
-- in each department. Order the result by average salary in descending order.

select department_name, avg(salary) average_salary
from Departments d 
join Employees e
on d.department_id = e.department_id
group by department_name
order by average_salary desc;



-- Q2 [10 pt] Write an SQL query to return the name of employees who have worked on more 
-- than one project, along with the number of projects they have participated in. 

select e.employee_name, count(ep.project_id) as number_of_projects
from Employees e
join Employee_project ep
on e.employee_id = ep.employee_id
group by e.employee_id, e.employee_name
having count(ep.project_id) > 1;



-- Write an SQL query to return each employee's name and the total hours they have worked across all projects.

select e.employee_name, sum(ep.hours_worked) as total_hours
from Employees e
join Employee_project ep
on e.employee_id = ep.employee_id
group by e.employee_id, e.employee_name;


-- Write an SQL query to return the name, position, and salary of the highest-paid employee.

select employee_name, position, salary
from Employees
where salary = (select max(salary) from Employees);

select * from Employees;
select * from Departments;
select * from Projects;
select * from Employee_project;

-- Write an SQL query to return the name of all employees and the names of projects 
-- they are involved in. If an employee is not
-- involved in any projects, display NULL for the project name.

use Company;

select e.employee_name, Temp.project_name
from Employees e, 
	(select employee_id, project_name
	from Employee_project ep
	join Projects p
	on ep.project_id = p.project_id
	order by employee_id) as Temp
where Temp.employee_id = e.employee_id;

select e.employee_name, p.project_name
from Employees e
left join Employee_project ep
	on e.employee_id = ep.employee_id
left join Projects p
	on ep.project_id = p.project_id;

SELECT e.employee_name, p.project_name
FROM Employees e
LEFT JOIN Employee_project ep
    ON e.employee_id = ep.employee_id
LEFT JOIN Projects p
    ON ep.project_id = p.project_id;




use Travel;
show tables;

select * from Customers;
select * from Hotels;
select * from Bookings;
select * from Reviews;

-- Write an SQL query to return all customers who have never left a review, showing their name and email.
select c.customer_name, c.email
from Customers c
left join Reviews r
on c.customer_id = r.customer_id
where r.customer_id is NULL;


select * from Customers;
select * from Hotels;
select * from Bookings;
select * from Reviews;

-- Write an SQL query to return all hotel bookings that occurred between March 1, 2024, 
-- and June 30, 2024, showing the booking ID, customer name, hotel name, and total cost.

select booking_id, customer_name, hotel_name, total_cost
from Customers c
join Bookings b
on c.customer_id = b.customer_id
join Hotels h
on h.hotel_id = b.hotel_id
where check_in between '2024-03-01' and '2024-06-30'
	or check_out between '2024-03-01' and '2024-06-30'
order by booking_id, check_in;


select * from Customers;
select * from Hotels;
select * from Bookings;
select * from Reviews;

-- Write an SQL query to return the top 3 longest hotel stays by customers, 
-- showing the customer name, hotel name, and number of nights stayed.

select c.customer_name, 
	   h.hotel_name, 
       datediff(b.check_out, b.check_in) as nights_stayed
from Customers c
join Bookings b
on c.customer_id = b.customer_id
join Hotels h
on b.hotel_id = h.hotel_id
order by nights_stayed desc;

select c.customer_name,
	   h.hotel_name,
	   datediff(b.check_out, b.check_in) as nights_stayed
from Customers c
join Bookings b
on c.customer_id = b.customer_id
join Hotels h
on b.hotel_id = h.hotel_id
where datediff(b.check_out, b.check_in) >= (
	select min(nights_stayed)
	from (
		select distinct datediff(check_out, check_in) as nights_stayed
		from Bookings
		order by nights_stayed desc limit 3) as top3
        )
order by nights_stayed desc;



-- Write an SQL query to find all customers who have made more than one hotel booking, 
-- displaying the customer name and the number of bookings they have made.

select c.customer_name, count(booking_id) as number_of_bookings
from Customers c
join Bookings b
on c.customer_id = b.customer_id
group by c.customer_id, c.customer_name
having count(booking_id) > 1;















