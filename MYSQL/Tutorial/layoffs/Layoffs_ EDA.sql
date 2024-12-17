-- SQL Project - Data Cleaning
-- https://www.kaggle.com/datasets/swaptr/layoffs-2022

-- create database of layoffs
create database layoffs;

-- connect the database
use layoffs;
-- Import csv file 'layoffs'

-- now when we are data cleaning we usually follow a few steps
-- 1. check for duplicates and remove any
-- 2. standardize data and fix errors
-- 3. Look at null values and see what 
-- 4. remove any columns and rows that are not necessary - few ways

-- 1. Remove Duplicates
-- First let's check for duplicates

SELECT company, industry, total_laid_off,`date`,ROW_NUMBER() OVER (
PARTITION BY company,industry, total_laid_off,`date`) AS row_num
from  layoffs.layoffs;

-- EDA

-- Here we are jsut going to explore the data and find trends or patterns or anything interesting like outliers

/*normally when you start the EDA process you have some idea of what you're looking for
with this info we are just going to look around and see what we find! */

SELECT 
    *
FROM
    layoffs;

-- EASIER QUERIES

--  Let's take a look at how this looks
SELECT 
    *
FROM
    layoffs
WHERE
    total_laid_off > 500;

-- find how  many companies are located in this place 'Stockholm'
SELECT 
    *
FROM
    layoffs
WHERE
    location = 'Stockholm';

-- find how  many companies are  not located in this place 'Stockholm'
SELECT 
    *
FROM
    layoffs
WHERE
    location != 'Stockholm';
    
-- We can use WHERE clause with date value also
SELECT 
    *
FROM
     layoffs
WHERE
    date > '2023-01-01';
-- LIKE STATEMENT

-- two special characters a % and a _

-- % means anything
-- find how  many companies name are start with 'a'
SELECT 
    *
FROM
    layoffs
WHERE
    company LIKE 'a%';

-- _ means a specific value
SELECT 
    *
FROM
    layoffs
WHERE
  -- company like '__a';
    company LIKE 'a__';


SELECT 
    *
FROM
    layoffs
WHERE
    industry LIKE 'a__%';

-- Find the max total_laid_off in layoff table . 
SELECT 
    MAX(total_laid_off)
FROM
    layoffs.layoffs;

-- Max and min percentage laid off column  in layoffs tables
SELECT 
    MAX(percentage_laid_off), MIN(percentage_laid_off)
FROM
    layoffs.layoffs
WHERE
    percentage_laid_off IS NOT NULL;

-- In which companies 1% i.s. basically 100% of the employees were fired
SELECT 
    *
FROM
    layoffs.layoffs
WHERE
    percentage_laid_off = 1;
    
-- Companies where 1% i.s. basically 100% of the employees were fired and in descending order as per percentage laid off

SELECT 
    *
FROM
    layoffs.layoffs
WHERE
    percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

-- SOMEWHAT TOUGHER AND MOSTLY USING GROUP BY--------------------------------------------------------------------------------------------------

-- Companies with the biggest single Layoff

SELECT 
    company, total_laid_off
FROM
    layoffs.layoffs
ORDER BY 2 DESC
LIMIT 5;
 
-- now that's just on a single day

-- Companies with the most Total Layoffs
-- Names of the top 10 companies with the highest number of layoffs
SELECT 
    company, SUM(total_laid_off)
FROM
    layoffs.layoffs
GROUP BY company
ORDER BY 2 DESC
LIMIT 10;

select * from layoffs;

-- by location
-- Top 10 companies with highest number of layoffs Company name and location

SELECT 
    location, SUM(total_laid_off)
FROM
    layoffs.layoffs
GROUP BY location
ORDER BY 2 DESC
LIMIT 10;


-- How many companies in each country have had layoffs in total.
-- How many companies have been laid off in each country?.
SELECT 
    country, SUM(total_laid_off)
FROM
    layoffs.layoffs
GROUP BY country
ORDER BY 2 DESC;

-- How many companies in each country had layoffs last year?
SELECT 
    YEAR(date) AS year, SUM(total_laid_off) AS total_layoff
FROM
    layoffs.layoffs
GROUP BY year;
 
 -- How many industries have seen layoffs?
 
SELECT 
    industry, SUM(total_laid_off)
FROM
    layoffs.layoffs
GROUP BY industry
ORDER BY 2 DESC;

-- How many  stage have seen layoffs?
SELECT 
    stage, SUM(total_laid_off)
FROM
    layoffs.layoffs
GROUP BY stage
ORDER BY 2 DESC;

-- TOUGHER QUERIES------------------------------------------------------------------------------------------------------------------------------------

-- Earlier we looked at the companies with the most layoffs. Now let's look at this year by year.
-- I want to  see

WITH Company_Year AS 
(
  SELECT company, YEAR(date) AS years, SUM(total_laid_off) AS total_laid_off
  FROM layoffs
  GROUP BY company, YEAR(date)
)
, Company_Year_Rank AS (
  SELECT company, years, total_laid_off, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
  FROM Company_Year
)
SELECT company, years, total_laid_off, ranking
FROM Company_Year_Rank
WHERE ranking <= 3
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;

-- Rolling Total of Layoffs Per Month
SELECT 
    month(date) AS Month,
     SUM(total_laid_off) AS total_laid_off
FROM
    layoffs
GROUP BY Month
ORDER BY 2 asc;

-- now use it in a CTE so we can query off of it
WITH DATE_CTE AS 
(
SELECT SUBSTRING(date,1,7) as dates, SUM(total_laid_off) AS total_laid_off
FROM layoffs 
GROUP BY dates
ORDER BY dates ASC
)
SELECT dates, SUM(total_laid_off) OVER (ORDER BY dates ASC) as rolling_total_layoffs
FROM DATE_CTE
ORDER BY dates ASC;

