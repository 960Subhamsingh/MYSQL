-- show the if existing databases
show databases;
-- Drop if existing databases
drop database neuron;

-- create table if not existing in neuron databases
create database if not exists neuron;

-- connect he neuron databases 
use neuron;

-- create table if not_exists 
CREATE TABLE IF NOT EXISTS bank_details (
    age INT,
    job VARCHAR(30),
    marital VARCHAR(30),
    education VARCHAR(30),
    `default` VARCHAR(30),
    balance INT,
    housing VARCHAR(30),
    loan VARCHAR(30),
    contact VARCHAR(30),
    `day` INT,
    `month` VARCHAR(30),
    duration INT,
    campaign INT,
    pday INT,
    previous INT,
    poutcome VARCHAR(30),
    y VARCHAR(30)
);

-- display the  table structure 
desc bank_details;

-- Display the rows and columns
SELECT 
    *
FROM
    bank_details;

-- insert the single data in existing table
insert into bank_details values(58,"management","married","tertiary","no",2143,"yes","no","unknown",5,"may",261,1,-1,0,"unknown","no");

-- insert the multiple data in existing table of neuron database
insert into bank_details values
(44,"technician","single","secondary","no",29,"yes","no","unknown",5,"may",151,1,-1,0,"unknown","no"),
(33,"entrepreneur","married","secondary","no",2,"yes","yes","unknown",5,"may",76,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",1506,"yes","no","unknown",5,"may",92,1,-1,0,"unknown","no"),
(33,"unknown","single","unknown","no",1,"no","no","unknown",5,"may",198,1,-1,0,"unknown","no"),
(35,"management","married","tertiary","no",231,"yes","no","unknown",5,"may",139,1,-1,0,"unknown","no"),
(28,"management","single","tertiary","no",447,"yes","yes","unknown",5,"may",217,1,-1,0,"unknown","no"),
(42,"entrepreneur","divorced","tertiary","yes",2,"yes","no","unknown",5,"may",380,1,-1,0,"unknown","no"),
(58,"retired","married","primary","no",121,"yes","no","unknown",5,"may",50,1,-1,0,"unknown","no"),
(43,"technician","single","secondary","no",593,"yes","no","unknown",5,"may",55,1,-1,0,"unknown","no"),
(41,"admin.","divorced","secondary","no",270,"yes","no","unknown",5,"may",222,1,-1,0,"unknown","no"),
(29,"admin.","single","secondary","no",390,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",6,"yes","no","unknown",5,"may",517,1,-1,0,"unknown","no"),
(58,"technician","married","unknown","no",71,"yes","no","unknown",5,"may",71,1,-1,0,"unknown","no"),
(58,"technician","married","unknown","no",71,"yes","no","unknown",5,"may",71,1,-1,0,"unknown","no"),
(51,"retired","married","primary","no",229,"yes","no","unknown",5,"may",353,1,-1,0,"unknown","no"),
(45,"admin.","single","unknown","no",13,"yes","no","unknown",5,"may",98,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",52,"yes","no","unknown",5,"may",38,1,-1,0,"unknown","no"),
(60,"retired","married","primary","no",60,"yes","no","unknown",5,"may",219,1,-1,0,"unknown","no"),
(33,"services","married","secondary","no",0,"yes","no","unknown",5,"may",54,1,-1,0,"unknown","no"),
(28,"blue-collar","married","secondary","no",723,"yes","yes","unknown",5,"may",262,1,-1,0,"unknown","no"),
(56,"management","married","tertiary","no",779,"yes","no","unknown",5,"may",164,1,-1,0,"unknown","no"),
(32,"blue-collar","single","primary","no",23,"yes","yes","unknown",5,"may",160,1,-1,0,"unknown","no"),
(25,"services","married","secondary","no",50,"yes","no","unknown",5,"may",342,1,-1,0,"unknown","no"),
(40,"retired","married","primary","no",0,"yes","yes","unknown",5,"may",181,1,-1,0,"unknown","no"),
(44,"admin.","married","secondary","no",-372,"yes","no","unknown",5,"may",172,1,-1,0,"unknown","no"),
(39,"management","single","tertiary","no",255,"yes","no","unknown",5,"may",296,1,-1,0,"unknown","no"),
(52,"entrepreneur","married","secondary","no",113,"yes","yes","unknown",5,"may",127,1,-1,0,"unknown","no"),
(46,"management","single","secondary","no",-246,"yes","no","unknown",5,"may",255,2,-1,0,"unknown","no"),
(36,"technician","single","secondary","no",265,"yes","yes","unknown",5,"may",348,1,-1,0,"unknown","no"),
(57,"technician","married","secondary","no",839,"no","yes","unknown",5,"may",225,1,-1,0,"unknown","no"),
(49,"management","married","tertiary","no",378,"yes","no","unknown",5,"may",230,1,-1,0,"unknown","no"),
(60,"admin.","married","secondary","no",39,"yes","yes","unknown",5,"may",208,1,-1,0,"unknown","no"),
(59,"blue-collar","married","secondary","no",0,"yes","no","unknown",5,"may",226,1,-1,0,"unknown","no"),
(51,"management","married","tertiary","no",10635,"yes","no","unknown",5,"may",336,1,-1,0,"unknown","no");

-- count how values availabel in bank_details table
SELECT 
    COUNT(*)
FROM
    bank_details;
    
-- show age, loan, job column in the table
SELECT 
    age, loan, job
FROM
    bank_details;
    
-- show the null column 
SELECT 
    `default`
FROM
    bank_details;
    
-- top 5 data show 
SELECT 
    *
FROM
    bank_details
LIMIT 5;

-- top 10 data show
SELECT 
    *
FROM
    bank_details
LIMIT 10;

-- Display details of all employees whose age is 33 years
SELECT 
    *
FROM
    bank_details
WHERE
    age = 33;
    
-- Display details of all employees whose age is 58 years
SELECT 
    *
FROM
    bank_details
WHERE
    age = 58;

-- Display details of all employees whose job is retired and age is 58 years
SELECT 
    *
FROM
    bank_details
WHERE
    age = 58 AND job = 'retired';

-- Display details of all employees whose job is admin and unmarried
SELECT 
    *
FROM
    bank_details
WHERE
    marital = 'single' AND job = 'admin.';

-- Display details of all employees whose education is unknown and unmarried
SELECT 
    *
FROM
    bank_details
WHERE
    education = 'unknown'
        OR marital = 'single';

-- Display details of all employees  education is unknown,  marital is single  and balance is 447?
SELECT 
    *
FROM
    bank_details
WHERE
    (education = 'unknown'
        OR marital = 'single')
        AND balance = 447;

-- display all job with unique values
SELECT DISTINCT
    job
FROM
    bank_details;

-- display  all order by of age column
SELECT 
    *
FROM
    bank_details
ORDER BY age;

-- display  all order by of age column in desc 
SELECT 
    *
FROM
    bank_details
ORDER BY age DESC;

/* Q.with this data try to find out sum of balance 
1. try to find out average of balance
2. try to out who is haviing a min balance
3. try to out who is haviing a maximum balance
4. try to prepare a list all the person who having loan 
5. try to find out a person average balance for all the people whose job role is admmin
6. try to find out a record without job whose age is below 45
7. try to find a record where education is primary and person is jobless
8. try to find record whose bank balance is having a negative balance
9. try to find out a record who is not having house at all along with there balance 
*/

/* 1:* try to find out average of balance */
SELECT 
    AVG(balance)
FROM
    bank_details;

/* 2: try to out who is haviing a min balance */

SELECT 
    *
FROM
    bank_details
ORDER BY balance
LIMIT 1;
use neuron;
show tables;
select *, min(balance) from bank_details; # not corrct 

select * from bank_details where balance in (select min(balance) from bank_details); 

select * from bank_details where balance = (select min(balance) from bank_details); 

/* 3: try to out who is haviing a maximum balance */
select * from bank_details where balance in (select max(balance) from bank_details); 

select * from bank_details where balance = (select max(balance) MaxBalance from bank_details); 

select * from bank_details order by balance desc limit 1;

/* 4: try to prepare a list all the person who having loan */
SELECT 
    *
FROM
    bank_details
WHERE
    loan = 'yes';

/* 5: try to find out a person average balance for all the people whose job role is admmin */
SELECT 
    *
FROM
    bank_details
WHERE balance in (SELECT avg(balance) FROM  bank_details where  job = 'admin.');

/* 6: try to find out a record without job whose age is below 45 */

SELECT 
    *
FROM
    bank_details
WHERE
    job = 'unknown' AND age <= 45;

/* 7: try to find a record where education is primary and person is jobless */

SELECT 
    *
FROM
    bank_details
WHERE
    education = 'primary'
        AND job = 'unknown';

/* 8: try to find record whose bank balance is having a negative balance */

SELECT 
    *
FROM
    bank_details
WHERE
    balance < 0;

/* 9:. try to find out a record who is not having house at all along with there balance 
*/
SELECT 
    balance, housing
FROM
    bank_details
WHERE
    housing = 'no';

-- create procedure
-- select all row and columns in procedure
DELIMITER &&
CREATE procedure sk()
BEGIN
SELECT 
    *
FROM
    bank_details;
END &&

CALL sk()

-- find the max balance with procedure
DELIMITER &&
CREATE procedure bal_max()
BEGIN
SELECT 
    *
FROM
    bank_details
WHERE
    balance IN (SELECT 
            MAX(balance)
        FROM
            bank_details);
END &&

call bal_max()

-- in statement use in procedure 
-- It takes input of user
-- call time user provide values 

DELIMITER &&
CREATE procedure job_role(in SWATI varchar (30))
BEGIN
SELECT 
    AVG(balance)
FROM
    bank_details
WHERE
    job = SWATI;
END &&

call job_role('admin.');
call job_role('retired');
call job_role('unknown');

-- take  input of education and job with bank table  to use  procedure
DELIMITER &&
CREATE procedure ba_edu_job(in v1 varchar (30),in v2 varchar (30))
BEGIN
SELECT 
    *
FROM
    bank_details
WHERE
    education = v1 AND job = v2;
END &&

call ba_edu_job;
CALL sk();
call ba_edu_job( 'tertiary','management');

-- create view with selected column in bank_details table;

create view bank_view as select age , job , marital, balance, education from bank_details;

select avg(balance) from bank_view where job='admin.';
