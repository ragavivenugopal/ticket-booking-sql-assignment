-- create database
create database ticketbookingsystem;

use ticketbookingsystem;

-- create table 1

create table venue
(
venue_id int primary key auto_increment,
venue_name varchar(100) not null,
address varchar(100) not null
);

-- insert values into table 1

insert into venue (venue_name,address) values
('Marina Hall','Chennai'),
('Abraham Hall','Nammakal'),
('Bombay Hall','Mumbai'),
('Catherine Hall','Coimbatore'),
('D Hall','Delhi'),
('Ethereum Hall','Andhra'),
('City Hall','Banglore'),
('Kerala Hall','Kerala'),
('Mary Hall','Chennai'),
('Cathy Hall','Namakkal');


desc venue;
select * from venue;

-- create table 2

create table event
(
event_id int primary key auto_increment,
event_name varchar(100) not null,
event_date date not null,
event_time time not null,
venue_id int references venue(venue_id),
total_seats int not null,
available_seats int not null,
ticket_price decimal(10,2),
event_type enum ('Movie','Sports','Concert'),
booking_id int references booking(booking_id)
);

-- insert values into table 2

insert into event(event_name,event_date,event_time,venue_id,total_seats,available_seats,ticket_price,event_type) values
('Rock Concert', '2025-07-15', '19:00:00', 1, 5000, 3500, 2000.00, 'Concert'),
('Comedy Play', '2025-07-10', '18:00:00', 2, 800, 600, 750.00, 'Movie'),
('Indie Music Fest', '2025-08-01', '20:00:00', 3, 2000, 1800, 1500.00, 'Concert'),
('Football Finals', '2025-07-25', '17:30:00', 4, 15000, 14000, 1200.00, 'Sports'),
('Dance Drama', '2025-07-18', '18:30:00', 5, 700, 500, 1000.00, 'Movie'),
('Cricket Cup', '2025-08-20', '16:00:00', 6, 25000, 20000, 2500.00, 'Sports'),
('Jazz Night', '2025-08-05', '20:30:00', 7, 1000, 950, 1800.00, 'Concert'),
('Stage Play: Hamlet', '2025-07-22', '18:00:00', 8, 600, 480, 900.00, 'Movie'),
('Wrestling Mania', '2025-08-10', '19:00:00', 9, 10000, 9800, 1700.00, 'Sports'),
('Rock Revival', '2025-09-01', '20:00:00', 10, 3000, 2500, 2100.00, 'Concert');

desc event;
select * from event;

-- create table 3

create table customer
(
customer_id int primary key auto_increment,
customer_name varchar(100) not null,
email varchar(100) not null unique,
phone_number varchar(20) not null,
booking_id int references booking(booking_id)
);

-- insert values into table 3

insert into customer (customer_name,email,phone_number) values
('Anbu','anbu@gmail.com','9999999999'),
('Babu','babu@gmail','8888888888'),
('Cam','cam@gmail.com','7777777777'),
('Evan','evan@gmail.com','6666666666'),
('Deva','deva@gmail.com','5555555555'),
('Sam','sam@gmail.com','8989765789'),
('Ram','ram@gmail.com','9898767898'),
('Som','soom@gmail.com','9878987657'),
('Sona','sona@gmail.com','9876898765'),
('Mona','mano@gmail.com','7898765789');

desc customer;
select * from customer;

-- create table 4

create table booking
(
booking_id int primary key auto_increment,
customer_id int references customer(customer_id),
event_id int references event(event_id),
num_tickets int not null,
total_cost decimal(10,2),
booking_date timestamp default current_timestamp
);

-- insert values into table 4

insert into booking(customer_id,event_id,num_tickets,total_cost,booking_date) values
(1, 1, 2, 4000.00, '2025-06-01'),
(2, 2, 3, 2250.00, '2025-06-02'),
(3, 3, 1, 1500.00, '2025-06-03'),
(4, 4, 5, 6000.00, '2025-06-04'),
(5, 5, 2, 2000.00, '2025-06-05'),
(6, 6, 4, 10000.00, '2025-06-06'),
(7, 7, 1, 1800.00, '2025-06-07'),
(8, 8, 3, 2700.00, '2025-06-08'),
(9, 9, 2, 3400.00, '2025-06-09'),
(10, 10, 1, 2100.00, '2025-06-10');

desc booking;
select * from booking;

-- task 2(2)

select * from event;

-- task 2(3)

select * from event
where available_seats > 0;

-- task 2(4) select events name partial match with ‘cup’ 'com'

select * from event
where event_name like '%com%';

-- task 2(5) select events with ticket price range is between 1000 to 2500

select * from event
where ticket_price between 1000 and 2500;

-- task 2(6) retrieve events with dates falling within a specific range.

select * from event
where event_date between '2025-07-15' and '2025-08-10';

-- task 2(7) retrieve events with available tickets that also have "Concert" in their name.

select * from event
where available_seats>0 and event_name like '%concert%';

-- task 2(8) retrieve users in batches of 5 (3), starting from the 6th user.

select * from customer
limit 3 offset 5;

-- task 2(9) retrieve bookings details contains booked no of ticket more than 4.

select * from booking
where num_tickets>4;

-- task 2(10) retrieve customer information whose phone number end with ‘000’ '666'

select * from customer
where phone_number like '%_______666%';

select * from customer
where phone_number like '%666';


-- task 2(11) retrieve the events in order whose seat capacity more than 15000

select * from event
where total_seats>15000;

-- task 2(12) select events name not start with ‘x’, ‘y’, ‘z’  'r'

select * from event
where event_name not like 'x%' 
and event_name not like 'y%' 
and event_name not like 'r%';





