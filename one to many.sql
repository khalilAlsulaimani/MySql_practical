#add a foreign key from one primary key to the other primary key to make a one to one relation
create database oneToMany;
use oneToMany;

create table custmor(
custmor_ID varchar(10) unique not null,
firstName varchar(20),
lastName varchar(20),
constraint PK_student_ID primary key (custmor_ID)
);

create table orders(
custmor_ID varchar(10) unique not null,
order_ID varchar(10) unique not null,
city varchar(10),
phone_number varchar(11),
constraint FK_custmor_ID foreign key  (custmor_ID) references custmor(custmor_ID),
constraint PK_order_ID primary key (order_ID)
); 

select * from custmor;
select * from orders;

desc custmor;
desc orders;

insert into custmor values("1120903902","mike","macmiller");
insert into orders values("1120903902","1000","nyc","097839091");
