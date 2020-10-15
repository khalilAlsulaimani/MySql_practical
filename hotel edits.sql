select * from hotel where hotel_id='ch01';

alter table hotel add COLUMN hotel_manager varchar(20);

select * from hotel;

alter table hotel 
drop column hotel_manager;

select * from hotel;

alter table hotel add column receptionist varchar(20);

UPDATE `hoteldb`.`hotel` SET `receptionist` = 'mark' WHERE (`hotel_id` = 'ch01');
UPDATE `hoteldb`.`hotel` SET `receptionist` = 'king' WHERE (`hotel_id` = 'ch02');
UPDATE `hoteldb`.`hotel` SET `receptionist` = 'kyle' WHERE (`hotel_id` = 'ch03');

#ALTER TABLE table_name
 # RENAME TO new_table_name;
 
 create table Test(
 test varchar(3)
 );
 select * from test1;
 
 alter table test
 rename to test1;
 
 drop table test1;