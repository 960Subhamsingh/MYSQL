# Join,union and indexing,cte

-- create database
create database operation;

use operation;

CREATE TABLE IF NOT EXISTS course (
    course_id INT,
    course_name VARCHAR(50),
    course_desc VARCHAR(60),
    course_tag VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS student (
    student_id INT,
    student_name VARCHAR(30),
    student_mobile INT,
    student_course_enroll VARCHAR(30),
    student_course_id INT
);

insert into course values
(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');


insert into student values
(301 , "sudhanshu", 3543453,'yes', 101),
(302 , "sudhanshu", 3543453,'yes', 102),
(301 , "sudhanshu", 3543453,'yes', 105),
(302 , "sudhanshu", 3543453,'yes', 106),
(303 , "sudhanshu", 3543453,'yes', 101),
(304 , "sudhanshu", 3543453,'yes', 103),
(305 , "sudhanshu", 3543453,'yes', 105),
(306 , "sudhanshu", 3543453,'yes', 107),
(306 , "sudhanshu", 3543453,'yes', 103);

select * from course;
select * from student;

-- using inner join
-- show course_id,course_name, course_desc, student_id,student_name,student_course_id from course and student table
desc course;
SELECT 
    c.course_id,
    c.course_name,
    c.course_desc,
    s.student_id,
    s.student_name,
    s.student_course_id
FROM
    course c
        INNER JOIN
    student s ON c.course_id = s.student_course_id;

-- using left join
SELECT 
    c.course_id,
    c.course_name,
    c.course_desc,
    s.student_id,
    s.student_name,
    s.student_course_id
FROM
    course c
        right JOIN
    student s ON c.course_id = s.student_course_id;

SELECT 
    c.course_id,
    c.course_name,
    c.course_desc,
    s.student_id,
    s.student_name,
    s.student_course_id
FROM
    course c
        LEFT JOIN
    student s ON c.course_id = s.student_course_id
WHERE
    s.student_id IS NULL;

-- using right join
SELECT 
    c.course_id,
    c.course_name,
    c.course_desc,
    s.student_id,
    s.student_name,
    s.student_course_id
FROM
    course c
        RIGHT JOIN
    student s ON c.course_id = s.student_course_id;

SELECT 
    c.course_id,
    c.course_name,
    c.course_desc,
    s.student_id,
    s.student_name,
    s.student_course_id
FROM
    course c
        RIGHT JOIN
    student s ON c.course_id = s.student_course_id
WHERE
    c.course_id IS NULL;

-- using cross join
SELECT 
    c.course_id,
    c.course_name,
    c.course_desc,
    s.student_id,
    s.student_name,
    s.student_course_id
FROM
    course c
        CROSS JOIN
    student s ON c.course_id = s.student_course_id;

SELECT 
    c.course_id,
    c.course_name,
    c.course_desc,
    s.student_id,
    s.student_name,
    s.student_course_id
FROM
    course c
        CROSS JOIN
    student s;

-- indexing

show index from course;

CREATE TABLE IF NOT EXISTS course1 (
    course_id INT,
    course_name VARCHAR(50),
    course_desc VARCHAR(60),
    course_tag VARCHAR(50),
    INDEX (course_id)
);

show index from course1;

insert into course1 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');

show index from course1;

CREATE TABLE IF NOT EXISTS course2 (
    course_id INT,
    course_name VARCHAR(50),
    course_desc VARCHAR(60),
    course_tag VARCHAR(50),
    INDEX (course_id , course_name)
);


show index from course2;

CREATE TABLE IF NOT EXISTS course3 (
    course_id INT,
    course_name VARCHAR(50),
    course_desc VARCHAR(60),
    course_tag VARCHAR(50),
    INDEX (course_desc , course_name , course_tag)
);

show index from course3;

insert into course3 values
(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');

show index from course3;

select * from course3;

EXPLAIN  select * from course3 where  course_id = 106 ;

EXPLAIN ANALYZE select * from course3 where  course_id = 106 or 
course_name = 'fsds';

analyze table course3;

describe course3;

-- using unique index
-- drop table course4;

CREATE TABLE IF NOT EXISTS course4 (
    course_id INT,
    course_name VARCHAR(50),
    course_desc VARCHAR(60),
    course_tag VARCHAR(50),
    UNIQUE INDEX (course_desc)
);

show index from course4;
select * from course4;

CREATE TABLE IF NOT EXISTS course5 (
    course_id INT,
    course_name VARCHAR(50),
    course_desc VARCHAR(60),
    course_tag VARCHAR(50),
    INDEX (course_desc , course_name , course_tag)
);

show index from course5;
select * from course5;

-- union (join 2 table vertically)

select * from course;
select * from student;

SELECT 
    course_id, course_name
FROM
    course 
UNION SELECT 
    student_id, student_name
FROM
    student;

(select course_desc , course_name from course 
union 
select student_id , student_name from student );

(select course_desc , course_name from course 
union all
select student_id , student_name from student );

select * from course where  course_id = 106;

select * from course where  course_id in(101,102,106);

-- cte (common table expression)

with sample_students as (
select * from course where  course_id in(101,102,106))
select * from sample_students where course_tag = 'java' ;

with outcoume_corss as (SELECT 
    c.course_id,
    c.course_name,
    c.course_desc,
    s.student_id,
    s.student_name,
    s.student_course_id
FROM
    course c
        CROSS JOIN
    student s ) SELECT 
    course_id, course_name, student_id
FROM
    outcoume_corss
WHERE
    student_id = 301 ;
 
with ctetest as(select 1 as col1,2 as col2
union all 
select 3,4)select col1 from ctetest;

-- recursive cte
with recursive cte(n) as
(select 1 union all select n+1 from cte where n<5)
select * from cte;

with recursive swat as (SELECT 1 AS n, 1 AS p, - 1 AS q 
UNION ALL SELECT 
    n + 1, p + 1, q + 2
FROM
    swat
WHERE
    n < 5 )
select * from swat;



