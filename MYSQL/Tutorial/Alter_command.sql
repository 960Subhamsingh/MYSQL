-- change column name 

alter table employee change  MyUnknownColumn  emp_id int;

alter table departments_data change emp_id Dep_id int;


alter table employees change `Full Name` `Name` VARCHAR(25);

alter table  employees change  `Annual Salary` `salary` int ;

UPDATE employees SET  `Annual salary`  = SUBSTRING(`Annual salary`, 2);

ALTER TABLE employees MODIFY `Annual Salary` INT;

--Union

SELECT 
    first_name, last_name
FROM
    hr.employee 
UNION SELECT 
    first_name, last_name
FROM
    hr.departments_data;

--UNION DISTINCT

SELECT 
    COUNT(*), first_name, last_name
FROM
    employee
GROUP BY first_name , last_name 
UNION DISTINCT SELECT 
    NULL, first_name, last_name
FROM
    departments_data;

-- we can use UNION ALL to show all values

SELECT 
    first_name, last_name
FROM
    employee 
UNION ALL SELECT 
    first_name, last_name
FROM
    departments_data;

------------------
SELECT 
    first_name, last_name, number, 'Old Lady' AS Label
FROM
    departments_data
WHERE
    number > 40 AND gender = 'F' 
UNION SELECT 
    first_name, last_name, 'Old Man'
FROM
    employee
WHERE
    age > 40 AND gender = 'Male' 
UNION SELECT 
    first_name, last_name, 'Highly Paid Employee'
FROM
    employee_salary
WHERE
    salary >= 70000
ORDER BY first_name;