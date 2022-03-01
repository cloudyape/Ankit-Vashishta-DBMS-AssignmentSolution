-- #1 --

create database if not exists `travelonthego`;

create table if not exists `passenger` (
Id int not null primary key auto_increment,
Passenger_name varchar(50),
Category varchar(50),
Gender varchar(1),
Boarding_City varchar(50),
Destination_City varchar(50),
Distance int,
Bus_Type varchar(50)
);

create table if not exists `price` (
Id int not null primary key auto_increment,
Bus_Type varchar(50),
Distance int,
Price int
);

-- #2 --

insert into `passenger` values(1, 'Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper');
insert into `passenger` values(2, 'Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting');
insert into `passenger` values(3, 'Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper');
insert into `passenger` values(4, 'Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper');
insert into `passenger` values(5, 'Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper');
insert into `passenger` values(6, 'Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting');
insert into `passenger` values(7, 'Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper');
insert into `passenger` values(8, 'Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting');
insert into `passenger` values(9, 'Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');

insert into `price`(Bus_Type, Distance, Price) values('Sleeper', 350, 770);
insert into `price`(Bus_Type, Distance, Price) values('Sleeper', 500, 1100);
insert into `price`(Bus_Type, Distance, Price) values('Sleeper', 600, 1320);
insert into `price`(Bus_Type, Distance, Price) values('Sleeper', 700, 1540);
insert into `price`(Bus_Type, Distance, Price) values('Sleeper', 1000, 2200);
insert into `price`(Bus_Type, Distance, Price) values('Sleeper', 1200, 2640);
insert into `price`(Bus_Type, Distance, Price) values('Sleeper', 350, 434);
insert into `price`(Bus_Type, Distance, Price) values('Sitting', 500, 620);
insert into `price`(Bus_Type, Distance, Price) values('Sitting', 500, 620);
insert into `price`(Bus_Type, Distance, Price) values('Sitting', 600, 744);
insert into `price`(Bus_Type, Distance, Price) values('Sitting', 700, 868);
insert into `price`(Bus_Type, Distance, Price) values('Sitting', 1000, 1240);
insert into `price`(Bus_Type, Distance, Price) values('Sitting', 1200, 1488);
insert into `price`(Bus_Type, Distance, Price) values('Sitting', 1500, 1860);

-- #3. --
Select Gender, count(Gender) from passenger p where distance >= 600 group by gender;

-- #4. --
Select min(price) from price where bus_type = 'Sleeper';

-- #5. --
Select Passenger_name from passenger where Passenger_name like 'S%';

-- #6. --
Select pa.passenger_name, pa.boarding_city, pa.destination_city, pa.bus_type, min(pr.price) as ticket_price 
from passenger pa inner join price pr on pa.bus_type = pr.bus_type and pa.distance = pr.distance
group by pa.passenger_name; 

-- #7. --
Select pr.bus_type, pr.price from passenger p, price pr where p.passenger_name = 'Pallavi' and p.distance = pr.distance;

-- #9. --
Select distance from passenger group by distance having count(distance) = 1 order by distance DESC;

-- #10. --
Select passenger_name, (distance /(Select sum(distance) from passenger) * 100) as Percentage_of_Distance_travelled from passenger;

-- #11.---

Select distance, price,
case  
	when price > 1000 then 'Expensive'
    when price <= 1000 and price > 500 then 'Average Cost'
    else 'Cheap'
end as price_category
from price;