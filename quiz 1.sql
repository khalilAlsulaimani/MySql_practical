# khalil alsulaimani  section :3

create database quiz1;
 
use  quiz1;

create table TEACHER(
TNO integer,
TNAME varchar(20) not null,
SALARY numeric,
check(SALARY> 7000 and SALARY<9000),
AN_BONUS numeric DEFAULT  2000
);

select * from TEACHER;
desc TEACHER;

insert into TEACHER values (01,"mike",8000,2000);

create table MANAGER(
MNO integer,
M_NAME varchar(30) not null,
SALARY numeric,
check(SALARY>7000),
AN_BONUS numeric default 3000,
D_of_Birth date
);

desc manager;

insert into MANAGER values(21,"zain",8090,9000, '1980-10-01');
insert into MANAGER values(01,"taylor",8000,3000, '1990-09-10');

select * from MANAGER;