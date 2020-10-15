create database relation;

use relation;

#many to many relationship need a joining table between them to take both tables to make a combined key in it asa the forgin key
create table student(
std_id varchar(12) not null,
first_name varchar(20),
last_name varchar(20),
constraint PK_stdID primary key(std_id)# insted of making a colum the primary key we do this so we can change it without needing to delete anything
);


SELECT * FROM relation.student;

create table classes(
class_ID varchar(3) not null,
title varchar(20),
describtion varchar(100),
constraint PK_classID  primary key(class_ID)
		#this is the name of the constraint classID is diffent from the colum class_ID
);

select * from classes;

#to be able to join a many to many between student and classes we need a join table between them

create table enrollment(
studentID varchar(12) not null,#for the foreign key it must be the same with the same attruibtes and conditions
classID varchar(3) not null,
enrollmentID varchar(5),
constraint FK_stdID foreign key (studentID) references student(std_id),
constraint FK_classID foreign key (classID) references classes(class_ID)
);

desc student;
insert into student values("1","khalil","alsulaimani");
