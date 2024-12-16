-- create databases 
create database dress_data;
-- connect the dress_data  database
use dress_data;

#drop database dress_data;

-- create table if not exits
CREATE TABLE IF NOT EXISTS dress (
    `Dress_ID` VARCHAR(30),
    `Style` VARCHAR(30),
    `Price` VARCHAR(30),
    `Rating` VARCHAR(30),
    `Size` VARCHAR(30),
    `Season` VARCHAR(30),
    `NeckLine` VARCHAR(30),
    `SleeveLength` VARCHAR(30),
    `waiseline` VARCHAR(30),
    `Material` VARCHAR(30),
    `FabricType` VARCHAR(30),
    `Decoration` VARCHAR(30),
    `Pattern Type` VARCHAR(30),
    `Recommendation` VARCHAR(30)
);

/*
LOAD DATA INFILE  
'D:/Project/MYSQL/MYSQL/Data-Analytics/DataSet.csv'
into table dress
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS secure-file-priv
*/

# load dataset by table import  wizard

drop table dataset;

select * from dress;

CREATE TABLE IF NOT EXISTS test (
    test_id INT AUTO_INCREMENT,
    test_name VARCHAR(30),
    test_mailid VARCHAR(30),
    test_adress VARCHAR(30),
    PRIMARY KEY (test_id)
);

insert into test values (1,'sudhanshu','sudhanshu@ineuron.ai','benglaore'),
(2,'krish','krish@gmail.com', 'bengalore'),
(3,'hitesh' ,'hitesh@ineuron.ai','bengalore'),
(4,'shubahm' , 'shudham@gmail.com', 'jaipur');


select * from test ;

CREATE TABLE IF NOT EXISTS test2 (
    test_id INT NOT NULL AUTO_INCREMENT,
    test_name VARCHAR(30),
    test_mailid VARCHAR(30),
    test_adress VARCHAR(30), 
    PRIMARY KEY (test_id)
);

insert into test2 (test_name , test_mailid , test_adress) values ('sudhanshu','sudhanshu@ineuron.ai','benglaore'),
('krish','krish@gmail.com', 'bengalore'),
('hitesh' ,'hitesh@ineuron.ai','bengalore'),
('shubahm' , 'shudham@gmail.com', 'jaipur');

select * from test2;

CREATE TABLE IF NOT EXISTS test3 (
    test_id INT,
    test_name VARCHAR(30),
    test_mailid VARCHAR(30),
    test_adress VARCHAR(30),
    test_salary INT CHECK (test_salary > 10000)
);

insert into test3 values (1,'sudhanshu','sudhanshu@ineuron.ai','benglaore' , 50000),
(2,'krish','krish@gmail.com', 'bengalore' , 30000),
(3,'hitesh' ,'hitesh@ineuron.ai','bengalore' , 111000),
(4,'shubahm' , 'shudham@gmail.com', 'jaipur',20000);

alter table test3 add check  (test_id > 0) ;
insert into test3 values
 (10,'sudhanshu','sudhanshu@ineuron.ai','benglaore' , 50000);

select * from test3;

CREATE TABLE IF NOT EXISTS test4 (
    test_id INT,
    test_name VARCHAR(30),
    test_mailid VARCHAR(30),
    test_adress VARCHAR(30) CHECK (test_adress = 'bengalore'),
    test_salary INT CHECK (test_salary > 10000)
);

insert into test4 values
 (1,'sudhanshu','sudhanshu@ineuron.ai','bengalore' , 50000);

select * from test4;

CREATE TABLE IF NOT EXISTS test5 (
    test_id INT NOT NULL,
    test_name VARCHAR(30),
    test_mailid VARCHAR(30),
    test_adress VARCHAR(30) CHECK (test_adress = 'bengalore'),
    test_salary INT CHECK (test_salary > 10000)
);

select * from test5;

insert into test5 ( test_id,test_name , test_mailid , test_adress,test_salary) values
 (1,'sudhanshu','sudhanshu@ineuron.ai','bengalore' , 50000);

select * from test5;

CREATE TABLE IF NOT EXISTS test6 (
    test_id INT NOT NULL DEFAULT 0,
    test_name VARCHAR(30),
    test_mailid VARCHAR(30),
    test_adress VARCHAR(30) CHECK (test_adress = 'bengalore'),
    test_salary INT CHECK (test_salary > 10000)
);

insert into test6 ( test_name , test_mailid , test_adress,test_salary) values 
('sudhanshu','sudhanshu@ineuron.ai','bengalore' , 50000);

SELECT 
    *
FROM
    test6;

insert into test6 ( test_id,test_name , test_mailid , test_adress,test_salary) values
 (101 , 'sudhanshu1','sudhanshu@ineuron.ai','bengalore' , 50000);

CREATE TABLE IF NOT EXISTS test7 (
    test_id INT NOT NULL DEFAULT 0,
    test_name VARCHAR(30),
    test_mailid VARCHAR(30) UNIQUE,
    test_adress VARCHAR(30) CHECK (test_adress = 'bengalore'),
    test_salary INT CHECK (test_salary > 10000)
);
	
insert into test7 ( test_name , test_mailid , test_adress,test_salary) values
 ('sudhanshu','sudhanshu@ineuron.ai','bengalore' , 50000);

create table if not exists test8( 
test_id int NOT NULL auto_increment  ,
test_name varchar(30)  NOT NULL default 'unknown' , 
test_mailid varchar(30) unique NOT NULL,
test_adress varchar(30) check (test_adress= 'bengalore') NOT NULL,
test_salary int check(test_salary > 10000) NOT NULL,
primary key (test_id));

select * from test8;

insert into test8 ( test_id , test_name , test_mailid , test_adress,test_salary) values
(101 , 'sudhanshu','sudhanshu55@ineuron.ai','bengalore' , 50000);

insert into test8 ( test_name , test_mailid , test_adress,test_salary) values
 ('sudhanshu','sudhanshu90@ineuron.ai','bengalore' , 50000);

SELECT 
    *
FROM
    test8;




