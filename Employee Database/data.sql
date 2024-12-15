CREATE TABLE employees (
    emp_no   INT    NOT NULL,
    birth_date  DATE  NOT NULL,
    first_name  VARCHAR(14)  NOT NULL,
    last_name   VARCHAR(16)  NOT NULL,
    gender  char(1) check(gender in('M','F'))  NOT NULL,    
    hire_date   DATE   NOT NULL,
    PRIMARY KEY (emp_no)
);


create table departments(
dept_no char(4) not null,
dept_name varchar(40) not null,
primary key(dept_no),
unique (dept_name)
);


create table dept_manager(
    emp_no int not null,
    dept_no char(4) not null,
    from_date date not null,
    to_date date not null,
    foreign key(emp_no) references employees (emp_no) on delete cascade,
    foreign key (dept_no) references  departments (dept_no) on delete cascade,
    primary key(emp_no , dept_no
    ));

 create table dept_emp(
    emp_no int not null,
    dept_no char(4) not null,
    from_date date not null,
    to_date date not null,
    foreign key(emp_no) references employees (emp_no) on delete cascade,
    foreign key (dept_no) references departments (dept_no) on delete cascade,
    primary key(emp_no , dept_no));

create table titles(
    emp_no int not null,
    title varchar(50) not null,
    to_date date,
    from_date date not null,
    foreign key (emp_no) references employees (emp_no) on delete cascade,
    primary key(emp_no, title, from_date));

create table salaries(
   emp_no int not null,
   salary int not null,
   from_date date not null,
   to_date date not null,
   foreign key(emp_no) references employees (emp_no) on delete cascade,
   primary key(emp_no, from_date));

 create or  replace view dept_emp_latest_date as
    SELECT emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date  FROM dept_emp  
  GROUP BY emp_no;

SQL> desc dept_emp_latest_date;
 Name              Null?    Type
 ----------------- -------- ------------
 EMP_NO            NOT NULL NUMBER(38)
 FROM_DATE                  DATE
 TO_DATE                    DATE

create or replace view current_dept_emp as
   select l.emp_no, dept_no, l.from_date, l.to_date
   from dept_emp d
   inner join dept_emp_latest_date l
   on d.emp_no=l.emp_no and d.from_date=l.from_date and l.to_date = d.to_date;

SQL> desc current_dept_emp
 Name              Null?    Type
 ----------------- -------- ------------
 EMP_NO            NOT NULL NUMBER(38)
 DEPT_NO           NOT NULL CHAR(4)
 FROM_DATE                  DATE
 TO_DATE                    DATE

insert into employees values(10001,to_date('1953-09-02','yyyy-mm-dd'),'Georgi','Facello','M',to_date('1986-06-26','yyyy-mm-dd'));
insert into employees values(10002,to_date('1964-06-02','yyyy-mm-dd'),'Bezalel','Simmel','F',to_date('1985-11-21','yyyy-mm-dd'));
insert into employees values(10003,to_date('1959-12-03','yyyy-mm-dd'),'Parto','Bamford','M',to_date('1986-08-28','yyyy-mm-dd'));
insert into employees values(10004,to_date('1954-05-01','yyyy-mm-dd'),'Chirstian','Koblick','M',to_date('1986-12-01','yyyy-mm-dd'));
insert into employees values(10005,to_date('1955-01-21','yyyy-mm-dd'),'Kyoichi','Maliniak','M',to_date('1989-09-12','yyyy-mm-dd'));
insert into employees values(10006,to_date('1953-04-20','yyyy-mm-dd'),'Anneke','Preusig','F',to_date('1989-06-02','yyyy-mm-dd'));