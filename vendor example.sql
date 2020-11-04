create database vendor;

use vendor;

create table vendor(
v_code varchar(10) not null,
v_name varchar(20) not null,
v_contact varchar(10),
v_areaCode integer,
v_phone varchar(11) not null,
check(v_phone = 11),
v_state varchar(20),
v_order varchar(20) not null,
constraint PK_code primary key (v_code)
);

create table product(
p_code varchar(20) not null,
p_discribtion varchar(30),
p_indate date not null,
p_qoh varchar(10),
p_min integer not null,
p_price numeric(10,2) not null,
p_discount integer default 0,
v_code varchar(10) not null,
constraint PK_p_code primary key (p_code),
constraint FK_v_code foreign key (v_code) references vendor(v_code)
);

