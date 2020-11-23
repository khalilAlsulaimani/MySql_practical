# khalil alsulaimani section:3 
CREATE  DATABASE final;
USE final;
# quastion 1 
CREATE TABLE Hotel(
hotelNo INTEGER  ,
hotelName VARCHAR(20),
city VARCHAR(20),
CONSTRAINT PK_hotelNo PRIMARY KEY (hotelNo)
);

insert into Hotel values(1,"kings hotel","makkah");
insert into Hotel values(2,"queens hotel","jeddah");
insert into Hotel values(3,"royal hotel","riyad");
insert into Hotel values(4,"madina hotel","madina");
insert into Hotel values(5,"taif hotel","taif");
insert into Hotel values(6,"palace hotel","taif");
insert into Hotel values(7,"makkah hotel","makkah");
insert into Hotel values(8,"riyad hotel","riyad");
insert into Hotel values(9,"red sea hotel","jeddah");
insert into Hotel values(10,"royal madina  hotel","madina");
insert into Hotel values(11,"royal london  hotel","london");
insert into Hotel values(12,"knights hotel","london");



CREATE TABLE Room(
roomNo INTEGER,
hotelNo INTEGER,
type VARCHAR(10),
price DECIMAL(10,2),
CONSTRAINT PK_roonNo PRIMARY KEY (roomNo),
CONSTRAINT FK_hotelNo FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo) ON UPDATE CASCADE ON DELETE CASCADE  
);

insert into Room values(11,1,"signle",400.1);
insert into Room values(22,2,"double",1600.4);
insert into Room values(30,2,"family",3200.1);
insert into Room values(49,3,"family",2200.3);
insert into Room values(95,3,"double",1400.2);
insert into Room values(76,4,"single",300.4);
insert into Room values(37,5,"double",1300.44);
insert into Room values(28,6,"suit",10090.1);
insert into Room values(9,7,"suit",10080.1);
insert into Room values(10,9,"suit",10090.2);
insert into Room values(13,8,"family",39.0);
insert into Room values(12,8,"double",29.0);
insert into Room values(112,11,"suit",11229.0);
insert into Room values(14,12,"double",22229.0);





CREATE TABLE Guest(
guestNo INTEGER,
guestName VARCHAR(20),
guestCity VARCHAR(20),
CONSTRAINT PK_guestNo PRIMARY KEY (guestNo)
);



insert into Guest values(1,"mike","riyad");
insert into Guest values(12,"tylor","jeddah");
insert into Guest values(13,"khalil","makkah");
insert into Guest values(3,"mohanad","makkah");
insert into Guest values(7,"moaid","taif");
insert into Guest values(4,"max","madina");
insert into Guest values(8,"lando","riyad");
insert into Guest values(9,"salvio","riyad");
insert into Guest values(23,"hector","madina");
insert into Guest values(30,"mike","taif");
insert into Guest values(32,"liz","london");
insert into Guest values(31,"mic","london");





CREATE TABLE Booking(
roomNo INTEGER,
guestNo INTEGER,
dateFrom DATE,
dateTo DATE,
CONSTRAINT FK_roomNo FOREIGN KEY (roomNo) REFERENCES Room(roomNo) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT FK_guestNo FOREIGN KEY (guestNo) REFERENCES Guest(guestNo) ON UPDATE CASCADE ON DELETE CASCADE
);

insert into Booking values(9,1,"2020-3-9","2020-4-9");
insert into Booking values(10,3,"2020-2-9","2020-2-18");
insert into Booking values(11,4,"2020-5-9","2020-5-10");
insert into Booking values(22,7,"2020-6-9","2020-6-15");
insert into Booking values(28,8,"2020-9-9","2020-9-19");
insert into Booking values(37,8,"2020-10-9","2020-10-30");
insert into Booking values(49,9,"2020-11-9","2020-11-14");
insert into Booking values(76,12,"2020-12-9","2020-12-12");
insert into Booking values(95,13,"2020-4-9","2020-4-10");
insert into Booking values(22,30,"2020-9-9","2020-9-20");
insert into Booking values(22,8,"2010-8-9","2010-8-20");
insert into Booking values(12,12,"2010-8-9","2010-8-20");
insert into Booking values(112,31,"2013-9-9","2013-11-20");
insert into Booking values(76,32,"2010-8-9","2010-8-20");





#1.2) List full details of all hotels in London.
select * from Hotel where city ="london";

#1.3) How many double or family rooms with a price below $40.00 per night?
select count(roomNo) from Room where (type="double" or type="family") and price<40.00;

#1.4) How many hotels are there?
select count(hotelNo) as number_of_hotels from Hotel;

#1.5) What is the average price of a room in London?
select avg(price) as avg_price from Room , Hotel  where Room.roomNo=Hotel.hotelName="london";

#1.6) What is the total price per night from all booked double rooms?
select sum(price) from Room , Booking where Booking.roomNo= Room.type="double" ;

#1.7) How many different guests have made bookings that started in August of 2010?
select distinct  count(g.guestNo)/10 as August_2010 from Guest g, Booking b  where  year( b.dateFrom)=2010 and month(b.dateFrom)=8 ;

#1.8) For each guest, list the guest name and the total number of bookings made by this guest.
select sum(if(g.guestNo = b.guestNo,1,0)) as bookings, g.guestName from Guest g , Booking b  GROUP BY g.guestName ; 

#1.9) Find the total number of bookings made by guests who are live in London.
select sum( if(g.guestCity="london"=b.guestNo,1,0) ) as london_Guests from Guest g , Booking b  ;

#1.10) Find the number of rooms in each hotel. Display a list that contains hotel name and corresponding number of rooms.
select sum(if(Room.hotelNo=Hotel.hotelNo,1,0)) as number_of_rooms ,hotelName from hotel , Room group by Hotel.hotelNo;

#1.11) List hotelNo for hotels that have more than 100 rooms
select Hotel.hotelNo, Hotel.hotelName from Hotel, Room  group by Hotel.hotelNo having count(if(Room.hotelNo=Hotel.hotelNo,1,0)) >100 ;

#1.12) List the number of rooms in each hotel in London
select sum(if(Room.hotelNo=Hotel.hotelNo,1,0)) as number_of_rooms ,hotelName from hotel , Room group by Hotel.city="london";

#1.13) Update the price of all rooms by an increase of 5%.
update Room set price=price*1.5 where roomNo>0 ;

#1.14) Update the price of all family rooms by a decrease of 10%.
update Room set price=price-(price*0.1) where type="double" and roomNo>0;

#1.15) List all bookings that does not have a dateFrom assigned to it. (hint: use IS NULL).
select * from Booking where dateFrom is null ;






