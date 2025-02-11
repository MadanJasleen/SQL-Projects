SELECT MAX(price) FROM campusx.smartphones;

SELECT MAX(price) FROM campusx.smartphones
WHERE brand_name ='samsung';

SELECT AVG(rating) FROM campusx.smartphones
WHERE brand_name = 'apple';

SELECT SUM(price) FROM campusx.smartphones;

SELECT COUNT(*) FROM campusx.smartphones
WHERE brand_name = 'apple';

SELECT DISTINCT(brand_name) FROM campusx.smartphones;

#counting the brands now 
SELECT COUNT(DISTINCT(brand_name)) FROM campusx.smartphones;#nunique in python

SELECT VARIANCE(screen_size) FROM campusx.smartphones;
SELECT STD(screen_size) FROM campusx.smartphones;

SELECT ROUND(screen_size,2) FROM campusx.smartphones; #round to 2 decimal places
SELECT FLOOR(screen_size) FROM campusx.smartphones

 
