create database rider;

use rider;

DROP TABLE IF EXISTS rides;

 CREATE TABLE  rides (
    driverid INT,
    name VARCHAR(50),
    rideid INT PRIMARY KEY,
    starttime DATETIME,
    endtime DATETIME,
    ETA INT,
    rating DECIMAL(2, 1)
);

INSERT INTO rides (driverid, name, rideid, starttime, endtime, ETA, rating) VALUES

(1, 'John', 101, '2024-09-01 08:00:00', '2024-09-01 08:30:00', 35, 4.8),

(2, 'Emily', 102, '2024-09-01 09:00:00', '2024-09-01 09:45:00', 50, 4.7),

(3, 'David', 103, '2024-09-01 10:00:00', '2024-09-01 10:50:00', 55, 4.5),

(4, 'Jessica', 104, '2024-09-01 11:00:00', '2024-09-01 11:30:00', 40, 4.9),

(5, 'Michael', 105, '2024-09-01 12:00:00', '2024-09-01 12:25:00', 15, 4.6),

(1, 'John', 106, '2024-09-02 08:15:00', '2024-09-02 08:45:00', 40, 4.8),

(2, 'Emily', 107, '2024-09-02 09:30:00', '2024-09-02 10:15:00', 50, 4.7),

(3, 'David', 108, '2024-09-02 10:30:00', '2024-09-02 11:20:00', 52, 4.6),

(4, 'Jessica', 109, '2024-09-02 11:45:00', '2024-09-02 12:10:00', 15, 5.0),

(5, 'Michael', 110, '2024-09-02 12:30:00', '2024-09-02 12:55:00', 18, 4.5),

(1, 'John', 111, '2024-09-03 07:50:00', '2024-09-03 08:20:00', 35, 4.9),

(2, 'Emily', 112, '2024-09-03 09:10:00', '2024-09-03 09:50:00', 45, 4.8),

(3, 'David', 113, '2024-09-03 10:40:00', '2024-09-03 11:30:00', 45, 4.4),

(4, 'Jessica', 114, '2024-09-03 11:20:00', '2024-09-03 11:50:00', 20, 4.9),

(5, 'Michael', 115, '2024-09-03 12:10:00', '2024-09-03 12:40:00', 15, 4.7),

(1, 'John', 116, '2024-09-04 08:05:00', '2024-09-04 08:35:00', 28, 4.6),

(2, 'Emily', 117, '2024-09-04 09:25:00', '2024-09-04 10:05:00', 40, 4.8),

(3, 'David', 118, '2024-09-04 10:50:00', '2024-09-04 11:40:00', 48, 4.6),

(4, 'Jessica', 119, '2024-09-04 11:30:00', '2024-09-04 11:55:00', 22, 5.0),

(5, 'Michael', 120, '2024-09-04 12:20:00', '2024-09-04 12:45:00', 18, 4.1);


select * from rides;

select driverid, name,  datediff( starttime, endtime), ETA, rating from rides;

select driverid, name,  sum(case when datediff( starttime, endtime) <= ETA then 1 else 0 end) as complete ,avg(rating)  from rides 
group by driverid, name;
