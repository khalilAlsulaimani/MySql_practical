create database student;

create table student(
first_name varchar(20) not null,
last_name varchar(30) not null,
age INT,
ID int unique,
constraint PK_ID primary key (ID)
);

insert into student values('khalil','alsulaimani',20,1);
insert into student values('moaid','alsulaimani',18,2);
insert into student values('mohanad','alsulaimani',16,3);
insert into student values('nasser','albrkati',15,4);

select * from student;

