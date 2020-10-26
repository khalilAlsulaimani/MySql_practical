create database one_to_one;
use one_to_one;

create table student(
student_ID varchar(10) unique not null,
firstName varchar(20),
lastName varchar(20),
constraint PK_student_ID primary key (student_ID)
);

create table contactInfo(
student_ID varchar(10) unique not null,
city varchar(10),
phone_number varchar(11),
constraint PK_student_ID foreign key (student_ID) references student (student_ID) 
); 

select * from student;
select * from contactInfo;

desc contactInfo;
desc student;

insert into student values("1120903902","mike","macmiller");
insert into contactInfo values("1120903902","nyc","19920918910");


