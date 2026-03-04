                                       -- HR Data Analysis--
create database HR_Data;
use HR_data;
select * from hr_data;

-- To change the name of column namd' 
ALTER TABLE hr_data
RENAME COLUMN `ï»¿emp_Id` TO Emp_id;

select * from hr_data;

-- count the  total Emps
select  distinct count(emp_id) as emp_count from hr_data;
-- Total no of Employees are 1470


 -- Attrition Rate
select round(((select count(attrition) from hr_data where attrition ="Yes")/sum(employee_count))*100,2)
attrition from hr_data;
-- Attrition Rate 16.12 % 

--   dept=Sale
select round(((select count(attrition) from hr_data where attrition ="Yes" and department="Sales")/sum(employee_count))*100,2)
attrition from hr_data
where department="Sales";

--  Active Employees
select sum(employee_count) -(select count(attrition)
from  hr_data where attrition= "Yes")  Active_Emp from hr_data;
--  Active Employees = 1233;

--  Active Employees =Male and Female
-- gender =Male 
select sum(employee_count) -(select count(attrition)
from  hr_data where attrition= "Yes")  Active_Emp_male from hr_data
where Gender="Male";

-- gender =Female 
select sum(employee_count) -(select count(attrition)
from  hr_data where attrition= "Yes")  Active_Emp_Female from hr_data
where Gender="female";

-- Average Age
select round(avg(age),0) avg_age from hr_data;
-- Average Age=37

--  Attrition by Gender  
select gender ,count(attrition) as  count_attrition from  hr_data 
where attrition= "Yes"
group by gender;
-- Female = 87
-- Male	= 150
 
 -- --  Attrition by Gender and education
select gender ,count(attrition) as  count_attrition from  hr_data 
where attrition= "Yes" and education="high School"
group by gender;

select gender ,count(attrition) as  count_attrition from  hr_data 
where attrition= "Yes" and education="Master's Degree" 
group by gender;

select gender ,count(attrition) as  count_attrition from  hr_data 
where attrition= "Yes" and education="Bachelor's Degree" 
group by gender;

select gender ,count(attrition) as  count_attrition from  hr_data 
where attrition= "Yes" and education="Associates Degree" 
group by gender;


-- Attrition by  Dept wise 
select department,count(attrition) as  count_attrition from  hr_data 
where attrition= "Yes" 
group by Department
order by count_attrition desc;

-- in Percentage 
SELECT 
    Department,
    COUNT(*) AS count_attrition,
    ROUND(
        COUNT(*) * 100.0 / 
        (SELECT COUNT(*) FROM hr_data WHERE Attrition = 'Yes'),
        2
    ) AS attrition_percentage
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY count_attrition DESC;
 
-- Attrition by  Dept  and gender wise  
select gender ,count(attrition) as  count_attrition from  hr_data 
where attrition= "Yes" and department="Sales" 
group by gender;

select gender ,count(attrition) as  count_attrition from  hr_data 
where attrition= "Yes" and department="R&D" 
group by gender;

select gender ,count(attrition) as  count_attrition from  hr_data 
where attrition= "Yes" and department="Hr" 
group by gender;

-- Numbers of Emp by Age Group ,
select age,sum(employee_count) as total_emp from hr_data
group by age
order by age asc ;

-- Numbers of Emp by Age band 
select age_band,count(attrition) as attrition_count from hr_data
where attrition="Yes"
group by age_band
order by age_band asc;

-- Numbers of Emp by Age band and gender wise 
select age_band,gender, count(attrition) as attrition_count from hr_data
where attrition ="Yes" 
group by age_band,gender
order by age_band,gender asc;


SELECT age_band, gender, 
       COUNT(attrition) AS attrition_count,
       ROUND(COUNT(attrition) * 100.0 / (SELECT COUNT(*) FROM hr_data WHERE attrition = 'Yes'), 2) AS attrition_pct
FROM hr_data 
WHERE attrition = 'Yes' 
GROUP BY age_band, gender 
ORDER BY age_band, gender ASC;

-- Numbers of Emp by Age band and Dept 
SELECT 
    age, Department, SUM(employee_count) AS total_emp
FROM
    hr_data
WHERE
    Department = 'R&D'
GROUP BY age
ORDER BY age ASC;

          --  attrition   by  Education Field
select education_field,count(attrition) as count_attrition from hr_data
where attrition="yes"
group by Education_field
order by count(attrition) desc ;

 --  Dept wise
select education_field,count(attrition) as count_attrition from hr_data
where attrition="yes" and department="Sales"
group by Education_field
order by count(attrition) desc ;
select * from hr_data;

select education_field,count(attrition) as count_attrition from hr_data
where attrition="yes" and department="R&D"
group by Education_field
order by count(attrition) desc ;

select education_field,count(attrition) as count_attrition from hr_data
where attrition="yes" and department="hr"
group by Education_field
order by count(attrition) desc ;
select * from hr_data;

--  Job satisfication   Rating
SELECT 
    job_role,
    SUM(CASE WHEN job_satisfaction = 1 THEN employee_count ELSE 0 END) AS `1`,
    SUM(CASE WHEN job_satisfaction = 2 THEN employee_count ELSE 0 END) AS `2`,
    SUM(CASE WHEN job_satisfaction = 3 THEN employee_count ELSE 0 END) AS `3`,
    SUM(CASE WHEN job_satisfaction = 4 THEN employee_count ELSE 0 END) AS `4`
FROM hr_data
GROUP BY job_role
ORDER BY job_role;

SELECT 
    job_role,
    SUM(CASE WHEN job_satisfaction = 1 THEN employee_count ELSE 0 END) AS `1`,
    SUM(CASE WHEN job_satisfaction = 2 THEN employee_count ELSE 0 END) AS `2`,
    SUM(CASE WHEN job_satisfaction = 3 THEN employee_count ELSE 0 END) AS `3`,
    SUM(CASE WHEN job_satisfaction = 4 THEN employee_count ELSE 0 END) AS `4`,
	SUM(employee_count) AS total_emp
FROM hr_data
GROUP BY job_role
ORDER BY job_role;

-- No. of Emp by age group
select age_band,gender,sum(employee_count) as total_em from hr_data
group by age_band, gender
order by age_band, gender;


select * from hr_data ;



