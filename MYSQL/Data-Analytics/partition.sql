-- Partition
create database n_partition;
use neuron;
use n_partition;

CREATE TABLE n_course (
    course_name VARCHAR(50),
    course_id INT(10),
    course_title VARCHAR(60),
    corse_desc VARCHAR(60),
    launch_date DATE,
    course_fee INT,
    course_mentor VARCHAR(60),
    course_launch_year INT
);

select * from n_course;

insert into n_course values
('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019),
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ;

select * from n_course;

-- record of course_launch_year = 2020
select * from n_course where course_launch_year = 2020;

-- create table with partition 
drop table n_course1;

CREATE TABLE n_course1 (
    course_name VARCHAR(50),
    course_id INT(10),
    course_title VARCHAR(60),
    course_desc VARCHAR(80),
    launch_date DATE,
    course_fee INT,
    course_mentor VARCHAR(60),
    course_launch_year INT
) PARTITION BY RANGE (course_launch_year)
 (PARTITION p0 VALUES LESS THAN (2019) ,
 PARTITION p1 VALUES LESS THAN (2020) ,
 PARTITION p2 VALUES LESS THAN (2021) , 
 PARTITION p3 VALUES LESS THAN (2022) , 
 PARTITION p4 VALUES LESS THAN (2023));

desc n_course1;
insert into n_course1 values
('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ;

-- fetch the recorse having coursselaunch_yeaar=2020
select * from n_course1 where course_launch_year = 2020 ;

select * from n_course where course_launch_year = 2020;

select partition_name , table_name , table_rows from information_schema.partitions 
 where table_name = 'n_course1';

-- create table by partition range= create partition by using hash
CREATE TABLE n_course2 (
    course_name VARCHAR(50),
    course_id INT(10),
    course_title VARCHAR(60),
    course_desc VARCHAR(80),
    launch_date DATE,
    course_fee INT,
    course_mentor VARCHAR(60),
    course_launch_year INT
) PARTITION BY HASH (course_launch_year) PARTITIONS 5;

-- Partition table 
SELECT 
    partition_name, table_name, table_rows
FROM
    information_schema.partitions
WHERE
    table_name = 'ineuron_course2';

CREATE TABLE ineuron_course3 (
    course_name VARCHAR(50),
    course_id INT(10),
    course_title VARCHAR(60),
    course_desc VARCHAR(80),
    launch_date DATE,
    course_fee INT,
    course_mentor VARCHAR(60),
    course_launch_year INT
) PARTITION BY HASH (course_launch_year) PARTITIONS 10;

select partition_name , table_name , table_rows from information_schema.partitions
 where table_name = 'ineuron_course3';

insert into ineuron_course3 values
('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019);

-- partition by key type:

CREATE TABLE n_course4 (
    course_name VARCHAR(50),
    course_id INT(10) PRIMARY KEY,
    course_title VARCHAR(60),
    course_desc VARCHAR(80),
    launch_date DATE,
    course_fee INT,
    course_mentor VARCHAR(60),
    course_launch_year INT
) PARTITION BY KEY () PARTITIONS 10; 

select partition_name , table_name , table_rows from information_schema.partitions
 where table_name = 'n_course4';

insert into n_course4 values
('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105, 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 1011 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 1012 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 1013 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 1014 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 1015 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019);

select * from n_course4 ;

-- generate md5 algorithm
SELECT MD5('MERN');
SELECT MD5('java');
SELECT MD5('fsds');

CREATE TABLE n_course5 (
    course_name VARCHAR(50) UNIQUE KEY NOT NULL,
    course_id INT(10),
    course_title VARCHAR(60),
    course_desc VARCHAR(80),
    launch_date DATE,
    course_fee INT,
    course_mentor VARCHAR(60),
    course_launch_year INT
) PARTITION BY KEY (COURSE_NAME) PARTITIONS 10; 

-- partition by list
CREATE TABLE n_course6 (
    course_name VARCHAR(50),
    course_id INT(10),
    course_title VARCHAR(60),
    course_desc VARCHAR(80),
    launch_date DATE,
    course_fee INT,
    course_mentor VARCHAR(60),
    course_launch_year INT
) PARTITION BY LIST (course_launch_year) (PARTITION p0 VALUES IN (2019 , 2020) , PARTITION p1 VALUES IN (2022 , 2021));

select * from n_course6 ;
insert into n_course6 values
('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105, 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 1011 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 1012 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 1013 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 1014 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 1015 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019);
select * from n_course6 ;

select partition_name , table_name , table_rows from information_schema.partitions 
where table_name = 'n_course6';

-- partition by range column
CREATE TABLE n_course7 (
    course_name VARCHAR(50),
    course_id INT(10),
    course_title VARCHAR(60),
    course_desc VARCHAR(80),
    launch_date DATE,
    course_fee INT,
    course_mentor VARCHAR(60),
    course_launch_year INT
) PARTITION BY RANGE COLUMNS (COURSE_NAME , COURSE_ID , COURSE_LAUNCH_YEAR) 
(PARTITION p0 VALUES LESS THAN ('aiops' , 105 , 2019) ,
 PARTITION p1 VALUES LESS THAN ('fsds' , 110 , 2021) ,
 PARTITION p2 VALUES LESS THAN ('MERN' , 116 , 2023));
select partition_name , table_name , 
table_rows from information_schema.partitions 
where table_name = 'ineuron_course7';

select ('aiops',105,2019) < ('fsds' ,110,2021);
select ('a') > ('b'); # comparision

insert ignore into n_course7 values
('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105, 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 1011 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 1012 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 1013 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 1014 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 1015 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019);

select * from n_course7 ;

-- partition by list column

CREATE TABLE n_course8 (
    course_name VARCHAR(50),
    course_id INT(10),
    course_title VARCHAR(60),
    course_desc VARCHAR(80),
    launch_date DATE,
    course_fee INT,
    course_mentor VARCHAR(60),
    course_launch_year INT
) PARTITION BY LIST COLUMNS (COURSE_NAME)
 (PARTITION p0 VALUES IN ('aiops' , 'data analytics' , 'Dl' , 'RL') ,
 PARTITION p1 VALUES IN ('fsds' , 'big data' , 'blockchain') ,
 PARTITION p2 VALUES IN ('MERN' , 'java' , 'interview prep' , 'fsda'));
select * from ineuron_course8 ;

insert ignore into n_course8 values
('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105, 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 1011 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 1012 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 1013 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 1014 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 1015 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019);
select * from n_course8 ;

-- sub_partition: using ombination of range and hash

CREATE TABLE n_course9 (
    course_name VARCHAR(50),
    course_id INT(10),
    course_title VARCHAR(60),
    course_desc VARCHAR(80),
    launch_date DATE,
    course_fee INT,
    course_mentor VARCHAR(60),
    course_launch_year INT
) PARTITION BY RANGE (course_launch_year) SUBPARTITION BY HASH
 (course_launch_year) SUBPARTITIONS 5 
(PARTITION p0 VALUES LESS THAN (2019) ,
 PARTITION p1 VALUES LESS THAN (2020) ,
 PARTITION p2 VALUES LESS THAN (2021) , PARTITION p3 VALUES LESS THAN (2022));

SELECT 
    *
FROM
    n_course9;
select partition_name , table_name , table_rows from information_schema.partitions 
where table_name = 'ineuron_course9';