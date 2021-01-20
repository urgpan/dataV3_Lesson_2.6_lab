-- 1
select release_year from sakila.film;
-- 2
select title from sakila.film
where title like '%ARMAGEDDON%';
-- 3
select title from sakila.film
where title like '%APOLLO';
-- 4
select title from sakila.film
order by length desc
limit 10;
-- 5
select title, special_features from sakila.film
where special_features regexp 'Behind the Scenes';
-- 6
alter table staff
drop column picture;
-- 7
select * from staff;
insert into staff
values (3,'Tammy','Sanders','3','tammy.sanders@sakilastaff.com',1,1,'tammy','pass','2020-01-20 05:51:56');
-- 8
select customer_id from sakila.customer -- 130
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

select * from sakila.film; -- 1

select * from rental
where customer_id = 1; -- 1002

select * from inventory
where film_id = 1;

insert into rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
values ('66066', '2020-01-20 22:04:30', '1', '130', '2020-01-21 22:04:30', '1', '2020-01-20 22:04:30');#random rental ID

select * from rental
where rental_id = 66066;

-- 9
describe customer; 

drop table if exists deleted_users;

select * from customer;

CREATE TABLE deleted_users (
  del_customer smallint unsigned DEFAULT NULL,
  del_email varchar(50) DEFAULT NULL,
  date int(11) DEFAULT NULL,

  CONSTRAINT FOREIGN KEY (del_customer) REFERENCES customer(customer_id)
) ;

select * from deleted_users;

select * from customer where active = 0;

insert into deleted_users (del_customer, del_email, date)
value ('customer_id', (select email from customer),(select last_update from customer));

DELETE FROM customer
WHERE active = 0;

-- I CANT!
