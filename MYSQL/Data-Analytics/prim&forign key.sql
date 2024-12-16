## primary key and foreign key

create database if not exists key_prim;

use key_prim;
#drop database key_prim;

#parent table
CREATE TABLE IF NOT EXISTS parent (
    course_id INT NOT NULL,
    course_name VARCHAR(60),
    course_status VARCHAR(40),
    number_of_enro INT,
    PRIMARY KEY (course_id)
);

insert into parent values(01,"FSDA",'active',100);
insert into parent values(02,"FSDA",'not-active',100);

SELECT 
    *
FROM
    parent;

#child table

CREATE TABLE IF NOT EXISTS child (
    student_id INT NOT NULL,
    course_name VARCHAR(60),
    student_mail VARCHAR(60),
    student_status VARCHAR(40),
    course_id1 INT,
    FOREIGN KEY (course_id1)
        REFERENCES parent (course_id)
);

select * from child;

insert into child values(101,"FSDA",'test@gmail.com','active',05);#05 is not present in parent table
insert into child values(101,"FSDA",'test@gmail.com','active',01);
insert into child values(101,"FSDA",'test@gmail.com','active',01);
insert into child values(101,"FSDA",'test@gmail.com','active',01);
insert into child values(102,"FSDA",'test1@gmail.com','active',02);
insert into child values(103,"FSDA",'test22@gmail.com','active',02);

select * from child;  

CREATE TABLE payment (
    course_name VARCHAR(60),
    course_id INT,
    course_live_status VARCHAR(60),
    course_launch_date VARCHAR(60),
    FOREIGN KEY (course_id)
        REFERENCES parent (course_id)
);

select * from payment;  

insert into payment values ('fsda',01,'not-active','7th aug');
insert into payment values ('fsda',02,'active','7th aug');
insert into payment values ('fsda',06,'not-active','7th aug');

select * from payment;  

CREATE TABLE class (
    course_id INT,
    class_name VARCHAR(60),
    class_topic VARCHAR(60),
    class_duration INT,
    PRIMARY KEY (course_id),
    FOREIGN KEY (course_id)
        REFERENCES parent (course_id)
);

select * from class;  

alter table  parent drop primary key; # not working 

alter table class drop primary key;

alter table parent ADD CONSTRAINT test_prim primary key (course_id,course_name);# cant create multiple pri key

drop table parent; #parent table not drop

drop table class; # child table can be delete

CREATE TABLE test (
    id INT NOT NULL,
    name VARCHAR(60),
    email_id VARCHAR(60),
    mobile_no VARCHAR(9),
    address VARCHAR(50)
);

SELECT 
    *
FROM
    test;  
    
#add pri key

alter table test add primary key(id);

alter table test drop primary key; 

select * from test;  

alter table test add constraint test_prim primary key(id , email_id);
SELECT 
    *
FROM
    test;  

#Ex:

CREATE TABLE parent1 (
    id INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE child1 (
    id INT,
    parent_id INT,
    FOREIGN KEY (parent_id)
        REFERENCES parent1 (id)
);

insert into parent1 values(1);
insert into parent1 values(2);

select * from parent1 ;

insert into child1 values(1,1);

select * from child1 ;

insert into child1 values(2,2); 
delete from parent where id =1; # not deleted bcz foeign key

delete from child where id =1;

# cascade option

drop table child1;

CREATE TABLE child1 (
    id INT,
    parent_id INT,
    FOREIGN KEY (parent_id)
        REFERENCES parent1(id)
        ON DELETE CASCADE
);

insert into child1 values(1,1),(1,2),(3,2),(2,2);

select * from child1;

select * from parent1;
delete from parent1 where id  = 2;

update parent1 set id = 3 where id = 2;

drop table child1;

CREATE TABLE child1 (
    id INT,
    parent_id INT,
    FOREIGN KEY (parent_id)
        REFERENCES parent1(id)
        ON UPDATE CASCADE
);

insert into child1 values(1,1),(1,2),(3,2),(2,2);

select * from child1 ; 
select * from parent1;

delete from parent where id=1;
select * from child ; # automatic update child table
select * from parent;

update parent set id = 3 where id = 2;

CREATE TABLE child1 (
    id INT,
    parent_id INT,
    FOREIGN KEY (parent_id)
        REFERENCES parent1(id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

select * from child1 ; 
