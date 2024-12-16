-- Normalization and pivote table
-- create databases
create database vote;

-- connect the database
use vote;

drop table order_table;

-- create table 
CREATE TABLE order_table (
    order_id INT,
    employee_id INT,
    vendor_id INT
);

insert into order_table values (1, 258, 1580),
(2, 254, 1496),
(3, 257, 1494),
(4, 261, 1650),
(5, 251, 1654),
(6, 255, 1664);

select * from order_table;

-- creating pivot table
SELECT 
    vendor_id,
    IF(employee_id = 254, 1, NULL) AS emp254,
    IF(employee_id = 257, 1, NULL) AS emp257,
    IF(employee_id = 261, 1, NULL) AS emp261,
    IF(employee_id = 251, 1, NULL) AS emp251,
    IF(employee_id = 253, 1, NULL) AS emp253
FROM
    order_table;

SELECT 
    order_id,
    IF(employee_id = 254, 1, NULL) AS emp254,
    IF(employee_id = 257, 1, NULL) AS emp257,
    IF(employee_id = 261, 1, NULL) AS emp261,
    IF(employee_id = 251, 1, NULL) AS emp251,
    IF(employee_id = 253, 1, NULL) AS emp253
FROM
    order_table;
