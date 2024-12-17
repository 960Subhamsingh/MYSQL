/* first thing we want to do is create a layoffs_staging  table. 
This is the one we will work in and clean the data. We want a table with the raw data in case something happens
*/

CREATE TABLE layoffs.layoffs_staging 
LIKE layoffs.layoffs;

-- Insert the 'LayOff_Staging' table using the 'Playoffs' table
INSERT INTO layoffs.layoffs_staging  
SELECT * FROM layoffs.layoffs;

SELECT *
FROM (
	SELECT company, industry, total_laid_off,`date`,
		ROW_NUMBER() OVER (
			PARTITION BY company,`date`
			) AS row_num
	FROM 
		layoffs.layoffs_staging
) duplicates
WHERE 
	row_num > 1;
    
-- let's just look at oda company  to confirm
SELECT 
    *
FROM
    layoffs.layoffs_staging
WHERE
    company = 'Oda';

-- it looks like these are all legitimate entries and shouldn't be deleted. We need to really look at every single row to be accurate

-- these are our real duplicates 
SELECT * FROM (
	SELECT company, location, industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions,
		ROW_NUMBER() OVER (
			PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions
			) AS row_num
	FROM 
		layoffs.layoffs_staging2
) duplicates
WHERE 
	row_num > 1;

-- these are the ones we want to delete where the row number is > 1 or 2 or greater essentially
-- now you may want to write it like this:
WITH DELETE_CTE AS 
(
SELECT *
FROM (
	SELECT company, location, industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions,
		ROW_NUMBER() OVER (
			PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions
			) AS row_num
	FROM 
		layoffs.layoffs_staging
) duplicates
WHERE 
	row_num > 1
) DELETE  FROM DELETE_CTE;

------------------
 WITH DELETE_CTE AS (
	SELECT company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions, 
    ROW_NUMBER() OVER (PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
	FROM layoffs.layoffs_staging
)
DELETE FROM layoffs.layoffs_staging
WHERE (company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions, row_num) IN (
	SELECT company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions, row_num
	FROM DELETE_CTE
) AND row_num > 1;


-- one solution, which I think is a good one. Is to create a new column and add those row numbers in. Then delete where row numbers are over 2, then delete that column
-- so let's do it!!

ALTER TABLE layoffs.layoffs_staging ADD row_num INT;
ALTER TABLE layoffs.layoffs_staging drop row_num;

SELECT *
FROM layoffs.layoffs_staging;

CREATE TABLE `layoffs`.`layoffs_staging2` (
`company` text,
`location`text,
`industry`text,
`total_laid_off` INT,
`percentage_laid_off` text,
`date` text,
`stage`text,
`country` text,
`funds_raised_millions` int,
row_num INT
);

INSERT INTO `layoffs`.`layoffs_staging2`
(`company`,
`location`,
`industry`,
`total_laid_off`,
`percentage_laid_off`,
`date`,
`stage`,
`country`,
`funds_raised_millions`,
`row_num`)
SELECT `company`,
`location`,
`industry`,
`total_laid_off`,
`percentage_laid_off`,
`date`,
`stage`,
`country`,
`funds_raised_millions`,
		ROW_NUMBER() OVER (
			PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions
			) AS row_num
	FROM 
		layoffs.layoffs_staging;

-- now that we have this we can delete rows were row_num is greater than 2

DELETE FROM layoffs.layoffs_staging2 WHERE row_num >= 2;

select * from layoffs.layoffs_staging2;

-- 2. Standardize Data

SELECT 
    *
FROM
    layoffs.layoffs_staging2;

-- if we look at industry it looks like we have some null and empty rows, let's take a look at these
SELECT DISTINCT
    industry
FROM
    layoffs.layoffs_staging2
ORDER BY industry;

SELECT 
    *
FROM
    layoffs.layoffs_staging2
WHERE
    industry IS NULL OR industry = ''
ORDER BY industry;

-- let's take a look at these
SELECT 
    *
FROM
    layoffs.layoffs_staging2
WHERE
    company LIKE 'Bally%';
    
-- nothing wrong here
SELECT 
    *
FROM
    layoffs.layoffs_staging2
WHERE
    company LIKE 'airbnb%';

-- it looks like airbnb is a travel, but this one just isn't populated.
-- I'm sure it's the same for the others. What we can do is
-- write a query that if there is another row with the same company name, it will update it to the non-null industry values
-- makes it easy so if there were thousands we wouldn't have to manually check them all

-- we should set the blanks to nulls since those are typically easier to work with
UPDATE layoffs.layoffs_staging2 
SET 
    industry = NULL
WHERE
    industry = '';

-- now if we check those are all null

SELECT 
    *
FROM
    layoffs.layoffs_staging2
WHERE
    industry IS NULL OR industry = ''
ORDER BY industry;

-- now we need to populate those nulls if possible

UPDATE layoffs.layoffs_staging2 t1
        JOIN
    layoffs.layoffs_staging2 t2 ON t1.company = t2.company 
SET 
    t1.industry = t2.industry
WHERE
    t1.industry IS NULL
        AND t2.industry IS NOT NULL;

-- and if we check it looks like Bally's was the only one without a populated row to populate this null values
SELECT 
    *
FROM
    layoffs.layoffs_staging2
WHERE
    industry IS NULL OR industry = ''
ORDER BY industry;

-- ---------------------------------------------------

-- I also noticed the Crypto has multiple different variations. We need to standardize that - let's say all to Crypto
SELECT DISTINCT
    industry
FROM
    layoffs.layoffs_staging2
ORDER BY industry;

UPDATE layoffs.layoffs_staging2 
SET 
    industry = 'Crypto'
WHERE
    industry IN ('Crypto Currency' , 'CryptoCurrency');

-- now that's taken care of:
SELECT DISTINCT
    industry
FROM
    layoffs.layoffs_staging2
ORDER BY industry;

-- --------------------------------------------------
-- we also need to look at 

SELECT 
    *
FROM
    layoffs.layoffs_staging2;

-- everything looks good except apparently we have some "United States" and some "United States." with a period at the end. Let's standardize this.
SELECT DISTINCT
    country
FROM
    layoffs.layoffs_staging2
ORDER BY country;

UPDATE layoffs.layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country);

-- now if we run this again it is fixed
SELECT DISTINCT
    country
FROM
    layoffs.layoffs_staging2
ORDER BY country;


-- Let's also fix the date columns:
SELECT 
    *
FROM
    layoffs.layoffs_staging2;

-- we can use str to date to update this field
UPDATE layoffs.layoffs_staging2 
SET 
    `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

-- now we can convert the data type properly
ALTER TABLE layoffs.layoffs_staging2
MODIFY COLUMN `date` DATE;

-- 3. Look at Null Values

-- the null values in total_laid_off, percentage_laid_off, and funds_raised_millions all look normal. I don't think I want to change that
-- I like having them null because it makes it easier for calculations during the EDA phase

-- so there isn't anything I want to change with the null values

-- 4. Delete any columns and rows we don't need

SELECT 
    *
FROM
    layoffs.layoffs_staging2
WHERE
    total_laid_off IS NULL
        AND percentage_laid_off IS NULL;
        
-- Delete Useless data we can't really use  
-- Remove useless data. We aren't actually using the total_laid_off and percantage_laid_of columns.

DELETE FROM layoffs.layoffs_staging2 
WHERE
    total_laid_off IS NULL
    AND percentage_laid_off IS NULL;

-- Drop row_num;
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

SELECT * 
FROM layoffs.layoffs_staging2;

WITH DELETE_CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
               ORDER BY (SELECT NULL)  -- Optional: Specify an ordering condition if needed
           ) AS row_num
    FROM layoffs.layoffs_staging2
)
DELETE FROM layoffs.layoffs_staging2
WHERE EXISTS (
    SELECT 1
    FROM DELETE_CTE dcte
    WHERE dcte.row_num >= 2
    AND dcte.company = layoffs.layoffs_staging2.company
    AND dcte.location = layoffs.layoffs_staging2.location
    AND dcte.industry = layoffs.layoffs_staging2.industry
    AND dcte.total_laid_off = layoffs.layoffs_staging2.total_laid_off
    AND dcte.percentage_laid_off = layoffs.layoffs_staging2.percentage_laid_off
    AND dcte.`date` = layoffs.layoffs_staging2.`date`
    AND dcte.stage = layoffs.layoffs_staging2.stage
    AND dcte.country = layoffs.layoffs_staging2.country
    AND dcte.funds_raised_millions = layoffs.layoffs_staging2.funds_raised_millions
);