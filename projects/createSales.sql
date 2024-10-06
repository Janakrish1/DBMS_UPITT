create database store;
show databases;
use store;

show tables;
select * from products;
select * from inventory;
select * from sales;

create table products (
    product_id    varchar(8),
    product_name  varchar(20),
    category      varchar(20),
    price         numeric(12, 2) check (price >= 0),
    primary key (product_id)
);

create table inventory (
    product_id  varchar(8),
    quantity    numeric(8) check (quantity >= 0), 
    primary key (product_id),
    foreign key (product_id) references products(product_id) on delete cascade
);
    
create table sales (
    sale_id      varchar(8),
    product_id   varchar(8),
    sale_date    DATE,
    units_sold   numeric(8) check (units_sold > 0), 
    total_price  numeric(12, 2) check (total_price >= 0),
    primary key (sale_id, product_id, sale_date),
    foreign key (product_id) references products(product_id) on delete cascade
);