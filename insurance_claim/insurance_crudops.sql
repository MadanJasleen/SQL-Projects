SELECT * FROM campusx.insurance;
-- Show records of 'male' patient from 'southwest' region.
SELECT * FROM campusx.insurance
WHERE gender = 'male' AND region = 'southwest';
-- Show all records having bmi in range 30 to 45 both inclusive
SELECT * FROM campusx.insurance
WHERE bmi between 30 and 45; 
-- Show minimum and maximum bloodpressure of diabetic patient who smokes.
-- Make column names as MinBP and MaxBP respectively.
SELECT MIN(bloodpressure) as 'minbp', MAX(bloodpressure) as 'maxbp'
FROM campusx.insurance
WHERE smoker = 'yes' and diabetic = 'yes';

-- Find no of unique patients who are not from southwest region.
SELECT DISTINCT(COUNT(PatientID)) FROM campusx.insurance
WHERE region != 'southwest';

-- Total claim amount from male smoker.
SELECT SUM(claim) FROM campusx.insurance
WHERE gender = 'male';

-- Select all records of south region.
SELECT * FROM campusx.insurance
WHERE region in ('southeast', 'southwest');

-- No of patient having normal blood pressure. Normal range[90-120]
SELECT COUNT(PatientID) FROM campusx.insurance
WHERE bloodpressure between 90 and 120;

--  8. No of patient below 17 years of age having normal blood pressure as per below formula -
-- BP normal range = 80+(age in years × 2) to 100 + (age in years × 2)
SELECT COUNT(PatientID) FROM campusx.insurance
WHERE age<17 and
(bloodpressure between 80+(age*2) and 100 +(age*2));

-- 9. What is the average claim amount for non-smoking female patients who are diabetic?
SELECT AVG(claim) FROM campusx.insurance
Where smoker = 'No' and gender = 'female' and diabetic ='Yes';

-- 10. Write a SQL query to update the claim amount for the patient 
-- with PatientID = 1234 to 5000.
UPDATE campusx.insurance SET claim = 5000
WHERE PatientID = 1234;
SELECT * FROM campusx.insurance WHERE PatientID = 1234;

-- 11. Write a SQL query to delete all records for patients 
-- who are smokers and have no children
DELETE FROM campusx.insurance
WHERE smoker = 'Yes' and children = 0;








