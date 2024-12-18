#Now let's look at string functions. These help us change and look at strings differently.

SELECT 
    *
FROM
    employees;


#Length will give us the length of each value
SELECT 
    LENGTH('MONU');

#Now we can see the length of each name
SELECT 
    name, LENGTH(name) AS length
FROM
    employees;

#Upper will change all the string characters to upper case
SELECT UPPER('subham');

SELECT 
    name, UPPER(name) as uppercase
FROM
    employees;

#lower will change all the string characters to lower case
SELECT LOWER('Subham');

SELECT 
    name, LOWER(name)
FROM
    employees;

#Now if you have values that have white space on the front or end, we can get rid of that white space using TRIM
SELECT TRIM('Subham');

#Now if we have white space in the middle it doesn't work
SELECT LTRIM('     I           love          SQL');

#There's also L trim for trimming just the left side
SELECT LTRIM('     I love SQL');

#There's also R trim for trimming just the Right side
SELECT RTRIM('I love SQL    ');


#Now we have Left. Left is going to allow us to take a certain amount of strings from the left hand side.
SELECT LEFT('Alexander', 4);

SELECT 
    name, LEFT(name, 4)
FROM
    employees;

#Right is basically the opposite - taking it starting from the right side
SELECT RIGHT('Alex kumar', 6);

SELECT 
    name, RIGHT(name, 4)
FROM
    employees;

#Now let's look at substring, this one I personally love and use a lot.
#Substring allows you to specify a starting point and how many characters you want so you can take characters from anywhere in the string. 
SELECT SUBSTRING('subham kumar', 2, 3);

#We could use this on phone to get the area code at the beginning.
SELECT 
    `Hire Date` , SUBSTRING(`Hire Date` , 1, 4) AS Hire_Date
FROM
    employees;
    
#We can also use replace
SELECT 
    REPLACE(name, 'a', 'z')
FROM
    employees;

#Next we have locate - we have 2 arguments we can use here: we can specify what we are searching for and where to search
#It will return the position of that character in the string.
SELECT LOCATE('x', 'Alex kumar x');

#Now Alexander has 2 e's - what will happen if we try to locate it
SELECT LOCATE('e', 'Alexander');
#It will return the location of just the first position.

#Let's try it on our first name
SELECT 
    name, LOCATE('a', name)
FROM
    employees;

#You can also locate longer strings
SELECT 
    name, LOCATE('Mic', name)
FROM
    employees;

#Now let's look at concatenate - it will combine the strings together
SELECT CONCAT('Alex', 'gender');

#Here we can combine the first and the last name columns together
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employee;
