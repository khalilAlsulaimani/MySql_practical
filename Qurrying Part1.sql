SELECT * FROM customers;

#select coulum name from table where condition
select points as winners from customers where points>900;

#as gives a name to the colulm 
#distinct makes sure there is no repation in the colum 
select distinct city as distinict_citys from customers ; 

select birth_date as target_customers from customers where birth_date>"1990-01-01";

SELECT * FROM order_items;
#this is how to use a method in a quarry
select max(quantity) as best_order from order_items;

select avg(quantity) as avg_order from order_items;

select * from products;	

select name,unit_price as old_price,unit_price *1.1 as new_price from products ;