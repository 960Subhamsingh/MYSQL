# primary key and foreign key

create database prim;

use prim;
#drop database prim;

CREATE TABLE IF NOT EXISTS neuron (
    course_id INT NOT NULL,
    course_name VARCHAR(60),
    course_status VARCHAR(40),
    number_of_enro INT
    -- PRIMARY KEY (course_id)
);

insert into neuron values(01,"FSDA",'active',100);
insert into neuron values(02,"FSDA",'not-active',100);
insert into neuron values(05,"SSDA",'not-active',100);
SELECT 
    *
FROM
    neuron;


CREATE TABLE IF NOT EXISTS student_neuron (
    student_id INT NOT NULL,
    course_name VARCHAR(60),
    student_mail VARCHAR(60),
    student_status VARCHAR(40),
    course_id1 INT,
    FOREIGN KEY (course_id1)
        REFERENCES neuron (course_id)
        ON DELETE CASCADE
);

SELECT 
    *
FROM
    student_neuron;

insert into student_neuron values(101,"FSDA",'test@gmail.com','active',05);
insert into student_neuron values(101,"FSDA",'test@gmail.com','active',01);
insert into student_neuron values(101,"FSDA",'test@gmail.com','active',01);
insert into student_neuron values(101,"FSDA",'test@gmail.com','active',01);

SELECT 
    *
FROM
    student_neuron;  

select * from neuron;
delete from student_neuron where course_id1 = 5;

CREATE TABLE payment (
    course_name VARCHAR(60),
    course_id INT,
    course_live_status VARCHAR(60),
    course_launch_date VARCHAR(60),
    FOREIGN KEY (course_id)
        REFERENCES ineuron (course_id)
);

insert into payment values ('fsda',01,'not-active','7th aug');
insert into payment values ('fsda',05,'active','7th aug');
insert into payment values ('fsda',06,'not-active','7th aug');

SELECT 
    *
FROM
    payment;  

CREATE TABLE class (
    course_id INT,
    class_name VARCHAR(60),
    class_topic VARCHAR(60),
    class_duration INT,
    PRIMARY KEY (course_id),
    FOREIGN KEY (course_id)
        REFERENCES neuron (course_id)
);

SELECT 
    *
FROM
    class;
  
alter table neuron drop primary key; # not working 

alter table class drop primary key;
drop table neuron;
desc neuron;
alter table neuron ADD CONSTRAINT test_prim primary key (course_id,course_name);
drop table neuron; #parent table not drop

drop table class;

CREATE TABLE test (
    id INT NOT NULL,
    name VARCHAR(60),
    email_id VARCHAR(60),
    mobile_no VARCHAR(9),
    address VARCHAR(50)
);

select * from test;  

alter table test add primary key(id);

alter table test drop primary key; 

alter table test add constraint test_prim primary key(id , email_id);

select * from test;  

drop table parent;

CREATE TABLE parent (
    id INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE child (
    id INT,
    parent_id INT,
    FOREIGN KEY (parent_id)
        REFERENCES parent (id)
);

insert into parent values(1);
insert into parent values(2);

SELECT 
    *
FROM
    parent;

insert into child values(1,1);

select * from child ;

insert into child values(2,2); # not working

DELETE FROM parent 
WHERE
    id = 1; # not deleted
    
DELETE FROM child 
WHERE
    id = 1;

# cascade option

drop table child;

CREATE TABLE child (
    id INT,
    parent_id INT,
    FOREIGN KEY (parent_id)
        REFERENCES parent (id)
        ON DELETE CASCADE
);

insert into child values(1,1),(1,2),(3,2),(2,2);

select * from child;

select * from parent;
delete from parent where id  = 1;

update parent set id = 3 where id = 2;

drop table child;

CREATE TABLE child (
    id INT,
    parent_id INT,
    FOREIGN KEY (parent_id)
        REFERENCES parent (id)
        ON UPDATE CASCADE
);

insert into child values(1,1),(1,2),(3,2),(2,2);

select * from child ; 
select * from parent;

delete from child where id=1;
select * from child ; # automatic update child table
select * from parent;

update parent set id = 1 where id = 1;

drop table child;

CREATE TABLE child (
    id INT,
    parent_id INT,
    FOREIGN KEY (parent_id)
        REFERENCES parent (id)
        ON UPDATE CASCADE
);

insert into child1 values(1,1),(1,2),(3,2),(2,2);

select * from parent; 

UPDATE parent 
SET 
    id = 3
WHERE
    id = 2;

CREATE TABLE child1 (
    id INT,
    parent_id INT,
    FOREIGN KEY (parent_id)
        REFERENCES parent (id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

select * from child1 ; 
