#cross join - cartesian product - all possible cross combos - no condition on join
# inner join - intersection 
#full join - union 


SELECT * FROM sql_cx_live.users t1
CROSS JOIN sql_cx_live.groups t2;

#inner join 
SELECT * FROM sql_cx_live.membership t1
JOIN sql_cx_live.users t2
ON t1.user_id = t2.user_id;

#left join 
SELECT * FROM sql_cx_live.membership t1
LEFT JOIN sql_cx_live.users1 t2
ON t1.user_id = t2.user_id;

#right join 
SELECT * FROM sql_cx_live.membership t1
RIGHT JOIN sql_cx_live.users1 t2
ON t1.user_id = t2.user_id;

#mysql does not have full outer join need to use set operations 
#union , union all (keeps duplicate rows), intersect (common only), except (in first table not in second table) 

SELECT * FROM sql_cx_live.person1 
UNION
SELECT * FROM sql_cx_live.person2; #duplicate charlie removed

SELECT * FROM sql_cx_live.person1 
UNION ALL
SELECT * FROM sql_cx_live.person2; #duplicate not removed

SELECT * FROM sql_cx_live.person1 
INTERSECT
SELECT * FROM sql_cx_live.person2;  #only charlie kept 

SELECT * FROM sql_cx_live.person1 
EXCEPT
SELECT * FROM sql_cx_live.person2; #charlie removed cuz its intersect 

#this can be used for full outer join - left join + right join +union to remove duplicates 
#we cant only use union cuz two tables have different columns 

SELECT * FROM sql_cx_live.membership t1
LEFT JOIN sql_cx_live.users1 t2
ON t1.user_id = t2.user_id
UNION
SELECT * FROM sql_cx_live.membership t1
RIGHT JOIN sql_cx_live.users1 t2
ON t1.user_id = t2.user_id;

#self join table is joined with itself - to compare salaries of two employees who work in same department etc
#users has emergency contact as userid in the same table 
SELECT * FROM sql_cx_live.users1 t1
JOIN sql_cx_live.users t2
ON t1.emergency_contact = t2.user_id;

#joining on more than one columns 
SELECT * FROM sql_cx_live.students t1
JOIN sql_cx_live.class t2
ON t1.class_id = t2.class_id AND t1.enrollment_year = t2.class_year;

#joining multiple tables 
SELECT * From sql_cx_live.order_details t1
Join sql_cx_live.orders t2
ON t1.order_id = t2.order_id
Join sql_cx_live.users t3
ON t3.user_id = t2.user_id;

#find all orders placed in pune 
SELECT COUNT(*) From sql_cx_live.orders t1
JOIN sql_cx_live.users t2
ON t1.user_id = t2.user_id
Where t2.city = 'Pune';

#find all orders under chair category 
select * from sql_cx_live.order_details t1
join sql_cx_live.category t2
on t1. category_id = t2.category_id
where t2.vertical ='Chairs';

#find all profitable orders
SELECT t1.order_id , sum(t2.profit) FROM sql_cx_live.orders t1
join sql_cx_live.order_details t2
on t1.order_id = t2.order_id
Group by t1.order_id;

#which is the most profitable state
select t1.state, sum(t3.profit) as 'prof' from sql_cx_live.users t1
join sql_cx_live.orders t2
on t1.user_id = t2.user_id
join sql_cx_live.order_details t3
on t3.order_id = t2.order_id
group by t1.state
order by prof desc limit 1;










