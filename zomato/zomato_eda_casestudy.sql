-- use zomato;
#counting rows in all databases
select count(*) from users;
select count(*) from food;

#select random n rows form a table 
select * from order_details order by rand() limit 5; #n - 5 

#finding null values 
SELECT * FROM orders;
select * from orders where restaurant_rating IS NULL; #not null 

#to replace null values with 0 
# update orders set restaurant_rating = 0 where restaurant_rating IS NULL;

#find number of order placed by each customer 
select t1.user_id, count(*) from users t1
join orders t2
on t1.user_id = t2.user_id
group by t1.user_id;

#find restaurant with most number of menu items 
select count(*) from restaurants t1
join menu t2
on t1.r_id = t2.r_id
group by t1.r_id;

#find number of votes and avg rating for all restaurants

UPDATE orders
SET restaurant_rating = NULL
WHERE restaurant_rating = '';


select t2.r_name, count(*), avg(restaurant_rating)  
from orders t1
join restaurants t2
on t1.r_id = t2.r_id
where t1.restaurant_rating is not null
group by t2.r_name;

#find restaurant with max revenue in given month of may 
-- select month(date(date)),date,r_id,amount from orders;

select t2.r_name, sum(amount) as 'amt' from orders t1
join restaurants t2
on t1.r_id = t2.r_id
where MONTHNAME(DATE(date)) = 'May'
group by t2.r_name
order by amt DESC limit 1;

#find restaurants with total sales >1500 
SELECT r_id,monthname(date(date)), sum(amount) as 'rev' FROM orders
group by r_id, monthname(date(date))
having rev >= 950
order by r_id, month(date(date)); #incompatible to order_by two conditions cuz of only_full_group_by sorting 

SELECT 
    r_id, 
    monthname(date(date)) AS month_name, 
    month(date(date)) AS month_number,  -- Extract month number for sorting
    SUM(amount) AS rev 
FROM orders 
GROUP BY r_id, month_name, month_number  
HAVING rev >= 950 
ORDER BY r_id, month_number;

#find customers who never ordered
select t1.user_id, t1.name from users t1
left join orders t2
on t1.user_id = t2.user_id
where t2.order_id is NULL; # can also use EXCEPT a - b

#show order details(food name) of a particular customer in a given date range  - 15 may to 15 june 
ALTER TABLE orders ADD COLUMN new_date DATE;
UPDATE orders 
SET new_date = STR_TO_DATE(date, '%Y-%m-%d');
ALTER TABLE orders DROP COLUMN date;
ALTER TABLE orders CHANGE new_date date DATE;


select t3.f_name, t1.user_id, t1.date from orders t1
join order_details t2
on t1.order_id = t2.order_id
join food t3
on t2.f_id = t3.f_id
where t1.user_id = 3
and 
date(t1.date) BETWEEN '2010-05-15' AND '2022-06-15';

#customer favourite food - most ordered 
select t1.user_id, t3.f_name, count(t3.f_id) as 'food' from orders t1
join order_details t2
on  t1.order_id = t2.order_id
join food t3
on t2.f_id = t3.f_id
group by t1.user_id, t3.f_name
order by t1.user_id, food desc; -- not possible without subqueries

#find most costly restaurants - (avg price/dish)
select r_id, sum(price)/count(*) as 'avg price' from menu
group by r_id
order by 'avg price' desc limit 1;

#find delivery partner compensation using the formula (#deliveries*100 + 1000*avg_rating)
select partner_id, (count(*)*100 + 1000*avg(delivery_rating)) as compensation from orders
group by partner_id ;-- join with partner table to get partne rname 

#find correlation between delivery time and total rating 
select * from orders;
SELECT CORR(delivery_time, (delivery_rating + restaurant_rating)) AS corr_val FROM orders; -- corr func not available in mysql 

# find all pure veg restuarants 
select t2.r_name, count(distinct(t3.type)) as veg from menu t1 #if restaurant has both veg and non veg then count if more than veg 
join restaurants t2
on t1.r_id = t2.r_id
join food t3
on t1.f_id = t3.f_id
group by t2.r_name
having veg = 1; #this could have issues if restaurant only has non veg . then count is also one 

-- alternative 
select t2.r_name from menu t1 
join restaurants t2
on t1.r_id = t2.r_id
join food t3
on t1.f_id = t3.f_id
group by t2.r_name
having min(t3.type) = 'Veg' and max(t3.type) = 'Veg';

#find min and max order value for all customers 
SELECT user_id, min(amount), max(amount) FROM orders
group by user_id;











