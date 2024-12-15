 
create table Details(
Order_ID   text    NULL ,
 Amount  int(11) NULL,
 Profit  int(11)  NULL,
 Quantity     int(11)  NULL, 
 Category      text    NULL , 
 Sub_Category  text    NULL,
 PaymentMode   text
 );
 
 

show variables like "secure_file_priv";

load data infile "D:/Project/MYSQL/MYSQL/Tutorial/Details.csv"
into table details
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

LOAD DATA INFILE 'D:/Project/MYSQL/MYSQL/Tutorial/Details.csv'
INTO TABLE details
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT @@secure_file_priv;

LOAD DATA INFILE 'D:/Details.csv'
INTO TABLE  details
FIELDS TERMINATED BY ','
TERMINATED BY '\n'
ignore 1 rows
(Order_ID, Amount,Profit, Quantity, Category , Sub_Category, PaymentMode);
