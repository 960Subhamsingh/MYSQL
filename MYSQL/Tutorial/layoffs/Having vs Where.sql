-- Having vs Where

-- Both were created to filter rows of data, but they filter 2 separate things
-- Where is going to filters rows based off columns of data
-- Having is going to filter rows based off aggregated columns when grouped

SELECT 
    gender, AVG(age)
FROM
    employees
GROUP BY gender;


-- let's try to filter on the avg age using where

SELECT  
    gender, AVG(age)
FROM
    employees
WHERE
    AVG(age) > 40
GROUP BY gender;
/*
this doesn't work because of order of operations. On the backend Where comes before the group by. 
So you can't filter on data that hasn't been grouped yet
 this is why Having was created
*/

SELECT 
    gender, AVG(age) AS AVG_age
FROM
    employees
GROUP BY gender
HAVING AVG_age > 40;
