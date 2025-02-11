SELECT * FROM campusx.smartphones
WHERE brand_name = 'samsung'; #filtering based on condition
SELECT * FROM campusx.smartphones
WHERE price > 50000;

SELECT * FROM campusx.smartphones
WHERE price > 10000 and price <= 20000;

#comment out queries --
-- SELECT * FROM campusx.smartphones
-- WHERE price BETWEEN 10000 and 20000; #can also use between

SELECT * FROM campusx.smartphones
WHERE price <15000 and rating>80 and processor_brand = 'snapdragon';

#query execution order 
-- FJWGHSDO 

#multiple where conditions
SELECT * FROM campusx.smartphones
WHERE processor_brand IN ('snapdragon','dimensity'); #similarly not in

##updating

UPDATE campusx.smartphones
SET processor_brand = 'dimensity'
WHERE processor_brand = 'mediatek';

SELECT * FROM campusx.smartphones
WHERE processor_brand = 'mediatek'; #no such row now

#multiple updates
UPDATE campusx.users
SET username = 'nitya', pass = 'bobby#'
WHERE email = 'abc@gmail.com';

#deleting rows
SELECT * FROM campusx.smartphones
WHERE price>200000;


DELETE FROM campusx.smartphones
WHERE price >200000;

DELETE FROM campusx.smartphones
WHERE primary_camera_rear >150 AND brand_name = 'samsung';


