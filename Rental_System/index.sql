-- 1)Customer 'Angel' has rented 'SBA1111A' from today for 10 days. 
-- (Hint: You need to insert a rental record. 
-- Use a SELECT subquery to get the customer_id to do this you will need to use parenthesis for your subquery as one of your values. 
-- Use CURDATE() (or NOW()) for today, and DATE_ADD(CURDATE(), INTERVAL x unit) to compute a future date.)

insert into rental_records (veh_reg_no, customer_id, start_date, end_date, lastUpdated)
values
   (
    'SBA1111A', 
    (select customer_id from customers where name='Angel'),
    curdate(),
    date_add(curdate(), interval 10 day),
    null
    );

-- 2)Customer 'Kumar' has rented 'GA5555E' from tomorrow for 3 months.

insert into rental_records (veh_reg_no, customer_id, start_date, end_date, lastUpdated)
values
   (
    'GA5555E', 
    (select customer_id from customers where name='Kumar'),
    curdate(),
    date_add(curdate(), interval 3 month ),
    null
    );

-- 3)List all rental records (start date, end date) with vehicle's registration number, brand, and customer name, sorted by vehicle's categories followed by start date.

select t1.start_date, t1.end_date, t1.veh_reg_no, t2.brand, t3.name  
from rental_records as t1 inner join vehicles as t2 inner join customers as t3
on t1.veh_reg_no = t2.veh_reg_no and t1.customer_id = t3.customer_id
order by t2.category, t1.start_date;

-- 4)List all the expired rental records (end_date before CURDATE()).

select * 
from rental_records 
where end_date < date_sub(now(), interval 1 day);

-- 5)List the vehicles rented out on '2012-01-10' (not available for rental), in columns of vehicle registration no, customer name, start date and end date. (Hint: the given date is in between the start_date and end_date.)

select t1.start_date, t1.end_date, t1.veh_reg_no, t2.brand, t3.name  
from rental_records as t1 inner join vehicles as t2 inner join customers as t3
on t1.veh_reg_no = t2.veh_reg_no and t1.customer_id = t3.customer_id
where ("2012-01-10" between t1.start_date and t1.end_date);

-- 6)List all vehicles rented out today, in columns registration number, customer name, start date, end date.

select t1.start_date, t1.end_date, t1.veh_reg_no, t2.brand, t3.name  
from rental_records as t1 inner join vehicles as t2 inner join customers as t3
on t1.veh_reg_no = t2.veh_reg_no and t1.customer_id = t3.customer_id
where ("2022-04-28" between t1.start_date and t1.end_date);

-- 7)Similarly, list the vehicles rented out (not available for rental) for the period from '2012-01-03' to '2012-01-18'. (Hint: start_date is inside the range; or end_date is inside the range; or start_date is before the range and end_date is beyond the range.)

select t1.start_date, t1.end_date, t1.veh_reg_no, t2.brand, t3.name  
from rental_records as t1 inner join vehicles as t2 inner join customers as t3
on t1.veh_reg_no = t2.veh_reg_no and t1.customer_id = t3.customer_id
where (t1.start_date between "2012-01-03" and "2012-01-18") 
or (t1.end_date between "2012-01-03" and "2012-01-18") 
or (t1.start_date < "2012-01-03" ) and (t1.end_date > "2012-01-18");

-- 8)List the vehicles (registration number, brand and description) available for rental (not rented out) on '2012-01-10' (Hint: You could use a subquery based on a earlier query).

select distinct 
vehicles.veh_reg_no, vehicles.brand, vehicles.desc from vehicles
left join rental_records
on vehicles.veh_reg_no = rental_records.veh_reg_no 
where vehicles.veh_reg_no not in (
select veh_reg_no 
from rental_records
where not rental_records.start_date > "2012-01-10")

-- 9)Similarly, list the vehicles available for rental for the period from '2012-01-03' to '2012-01-18'.

select distinct 
vehicles.veh_reg_no, vehicles.brand, vehicles.desc from vehicles
left join rental_records
on vehicles.veh_reg_no = rental_records.veh_reg_no 
where vehicles.veh_reg_no not in (
select veh_reg_no 
from rental_records
where not rental_records.start_date < "2012-01-03"
and rental_records.end_date > "2012-01-03"
and rental_records.start_date < "2012-01-18"
and rental_records.end_date > "2012-01-18")

-- 10)Similarly, list the vehicles available for rental from today for 10 days

select 
vehicles.veh_reg_no, vehicles.brand, vehicles.desc from vehicles
left join rental_records
on vehicles.veh_reg_no = rental_records.veh_reg_no 
where vehicles.veh_reg_no not in (
select veh_reg_no 
from rental_records
where not rental_records.start_date between now() and DATE_ADD(CURDATE(), INTERVAL 10 DAY)
or rental_records.end_date between now() and DATE_ADD(CURDATE(), INTERVAL 10 DAY));
