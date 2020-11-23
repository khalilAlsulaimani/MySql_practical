create database manufacture;

use manufacture;

create table product(
PROD_CODE varchar(3) primary key,
PROD_QOH integer 
);

create table part(
PART_CODE varchar(1) primary key,
PART_QOH integer
);

insert into product values("ABC",1200);

insert into part values("A",567);
insert into part values("B",498);
insert into part values("C",549);

#3.1) Using SQL, write a transaction, T1, to represent the process of adding 100 new items of product ABC to the inventory. Make
#sure to adjust quantities of the corresponding parts in PARTS table

start  transaction;
select * from product;
select * from part;

update product  set PROD_QOH=PROD_QOH+100 where PROD_CODE="ABC"  ;
update part set PART_QOH=PART_QOH-100 where PART_CODE="A" or PART_CODE="B" or PART_CODE="C";

select * from product;
select * from part;

rollback;

#3.2) Using SQL, write a transaction T2 to represent the process of adding 200 items of the ABC product.
start  transaction;
select * from product;
select * from part;

update product  set PROD_QOH=PROD_QOH+200  where PROD_CODE="ABC"  ;
update part set PART_QOH=PART_QOH-200 where PART_CODE="A" or PART_CODE="B" or PART_CODE="C";

select * from product;
select * from part;

rollback;
