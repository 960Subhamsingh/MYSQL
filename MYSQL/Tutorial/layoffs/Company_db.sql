DROP DATABASE IF EXISTS `company`;

CREATE DATABASE `Company`;

USE `company`;

CREATE TABLE employee(
  employee_id INT NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  birth_date DATE,
  PRIMARY KEY (employee_id)
);
 
 
INSERT INTO employee (employee_id, first_name, last_name, age, gender, birth_date)
VALUES (1,'Sita', 'Knope', 44, 'Female','1979-09-25');
INSERT INTO employee (employee_id, first_name, last_name, age, gender, birth_date)
VALUES (3,'Suman', 'Haver', 36, 'Male', '1987-03-04');
INSERT INTO employee (employee_id, first_name, last_name, age, gender, birth_date)
VALUES (4, 'Roma', 'Kumari', 29, 'Female', '1994-03-27');
INSERT INTO employee (employee_id, first_name, last_name, age, gender, birth_date)
VALUES (5, 'Sonu', 'Gergich', 61, 'Male', '1962-08-28');
INSERT INTO employee (employee_id, first_name, last_name, age, gender, birth_date)
VALUES (6, 'Gita', 'Kumari', 46, 'Female', '1977-07-30');
INSERT INTO employee (employee_id, first_name, last_name, age, gender, birth_date)
VALUES (7, 'ANU', 'Kumari', 35, 'Female', '1988-12-01');
INSERT INTO employee (employee_id, first_name, last_name, age, gender, birth_date)
VALUES (8, 'Ram', 'Kumar', 43, 'Male', '1980-11-11');
INSERT INTO employee (employee_id, first_name, last_name, age, gender, birth_date)
VALUES (9, 'Mohan', 'Wyatt', 38, 'Male', '1985-07-26');
INSERT INTO employee (employee_id, first_name, last_name, age, gender, birth_date)
VALUES (10, 'Aditya', 'Dwyer', 34, 'Male', '1989-03-25');
INSERT INTO employee (employee_id, first_name, last_name, age, gender, birth_date)
VALUES (11, 'Shyam', 'Kumar', 40, 'Male', '1983-06-14');
INSERT INTO employee (employee_id, first_name, last_name, age, gender, birth_date)
VALUES (12, 'Sonu' 'Kumar', 37, 'Male', '1986-07-27');

CREATE TABLE employee_salary (
  employee_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  occupation VARCHAR(50),
  salary INT,
  dept_id INT
);

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'sita', 'Knope', 'Deputy Director of Parks and Recreation', 75000,1),
(2, 'Suman', 'Haver', 'Director of Parks and Recreation', 70000,1),
(3, 'Roma', 'Haver', 'Entrepreneur', 50000,1),
(4, 'Sonu', 'Ludgate', 'Assistant to the Director of Parks and Recreation', 25000,1),
(5, 'Gita', 'Kumari', 'Office Manager', 50000,1),
(6, 'Annu', 'Kumari', 'Office Manager', 60000,1),
(7, 'Annu', 'Kumari', 'Nurse', 55000,4),
(8, 'Ram', 'kumar', 'City Manager', 90000,3),
(9, 'Shyam', 'Kumar', 'State Auditor', 70000,6),
(10, 'Aditya', 'kumarr', 'Shoe Shiner and Musician', 20000, NULL),
(11, 'Mohan', 'Kumar', 'City Planner', 57000, 3),
(12, 'Sita', 'Kumari', 'Parks Director', 65000,1);


CREATE TABLE departments (
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name varchar(50) NOT NULL,
  PRIMARY KEY (department_id)
);

INSERT INTO departments (department_name)
VALUES
('Parks and Recreation'),
('Animal Control'),
('Public Works'),
('Healthcare'),
('Library'),
('Finance');

-- Case Statement 

-- A Case Statement allows you to add logic to your Select Statement, sort of like an if else statement in other programming languages or even things like Excel

SELECT * 
FROM employee;

SELECT first_name, 
last_name, 
CASE
	WHEN age <= 20 THEN 'Young'
    when age>=20 then 'A_Young'
END Age
FROM employee;
--

SELECT 
    first_name,
    last_name,
    CASE
        WHEN age <= 30 THEN 'Young'
        WHEN age BETWEEN 31 AND 50 THEN 'Meadiam Age'
        WHEN age >= 50 THEN 'On Death\'s Door'
    END  as age
FROM
    employee;

-- Now we don't just have to do simple labels like we did, we can also perform calculations
-- Let's look at giving bonuses to employees

SELECT 
    *
FROM
    employee_salary;

-- Pawnee Council sent out a memo of their bonus and pay increase structure so we need to follow it
-- Basically if they make less than 45k then they get a 5% raise - very generous
-- if they make more than 45k they get a 7% raise
-- they get a bonus of 10% if they work for the Finance Department

SELECT 
    first_name,
    last_name,
    salary,
    CASE
        WHEN salary > 45000 THEN salary + (salary * 0.05)
        WHEN salary < 45000 THEN salary + (salary * 0.07)
    END AS new_salary
FROM
    employee_salary;

-- Unfortunately Pawnee Council was extremely specific in their wording and Jerry was not included in the pay increases. Maybe Next Year.

-- Now we need to also account for Bonuses, let's make a new column
SELECT 
    first_name,
    last_name,
    salary,
    CASE
        WHEN salary > 45000 THEN salary + (salary * 0.05)
        WHEN salary <55000 THEN salary + (salary * 0.07)
    END AS new_salary,
    CASE
        WHEN first_name = 'Annu' THEN salary * 0.10
    END AS Bonus
FROM
    employee_salary;

-- as you can see Ben is the only one who get's a bonus
