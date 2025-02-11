SELECT * FROM campusx.smartphones; #fetch all
SELECT os,model, price FROM campusx.smartphones;
SELECT os as 'Operating System', 
price as 'INR' FROM campusx.smartphones; #as is alias
SELECT model,
SQRT(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size as 'ppi'
FROM campusx.smartphones;

SELECT model, 'smartphones' as 'type' #type is the column having all constants as smartphones
FROM campusx.smartphones;

#selecting distinct values
SELECT DISTINCT(brand_name) AS 'Unique_Brands'
FROM campusx.smartphones;

#selecting combination of distinct values
SELECT distinct brand_name,processor_brand
FROM campusx.smartphones;

