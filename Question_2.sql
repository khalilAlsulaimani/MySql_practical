#Question 2:

create database hosbital;
use hosbital;

create table doctor(
DID integer ,
Dname varchar(20),
constraint PK_DID PRIMARY KEY (DID) 
);
insert into doctor values(1,"taylor");
insert into doctor values(2,"nick");
insert into doctor values(3,"mike");


create table bed(
BID integer,
size varchar(20),
Bcount integer,
CONSTRAINT PK_BID PRIMARY KEY (BID)
);
insert into bed values(1,"small",3);
insert into bed values(2,"big",2);
insert into bed values(3,"medium",2);



create table patiant(
PID INTEGER,
Pname varchar(20),
address varchar(20),
phNO varchar(20),
constraint PK_PID primary key (PID)
);

insert into patiant values(1,"tilly","london","490330938");
insert into patiant values(2,"nico","london","34948029830");
insert into patiant values(3,"tyson","bolten","499000938");
insert into patiant values(4,"tim","london","49039403903");


create table treats(
date1 date,
PID integer,
DID integer,
CONSTRAINT FK_PID FOREIGN KEY (PID) REFERENCES patiant(PID),
CONSTRAINT fk_DID FOREIGN KEY (DID) REFERENCES doctor(DID),
CONSTRAINT PK_date1 PRIMARY KEY (date1)
);

insert into treats values("2020-9-10",1,1);
insert into treats values("2020-9-11",2,1);
insert into treats values("2020-9-9",3,2);


create table uses(
BID integer,
PID integer,
CONSTRAINT FK_PID2 FOREIGN KEY (PID) REFERENCES patiant(PID),
CONSTRAINT fk_BID FOREIGN KEY (BID) REFERENCES bed(BID)
);

insert into uses values(1,1);
insert into uses values(2,2);
insert into uses values(3,1);

#2.1) Write SQL statement that list all phone numbers, and all Patient names too?
select phNO, Pname from patiant;

#2.2) lists all patient IDs whether they have received care or not?
select PID from patiant ;

#2.3) list all patient names who received care and used a bed as well?
select p.Pname, u.BID , t.date1 from patiant p, uses u , treats t where p.PID= u.PID and p.PID= t.PID;