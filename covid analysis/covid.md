
- ***Covid 19 Data Exploration***

***Skills used:***  Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types


- ***show databases***
```
create database covid;
```
```
use covid;
```
```
show tables;
```
```
select * from covid;
```
```
SELECT 
    location
FROM
    Covid; 
```
 
-  ***Select Data that we are going to be starting with***
~~~
SELECT 
    Location,
    date,
    total_cases,
    new_cases,
    total_deaths,
    population
FROM
    Covid
WHERE
    continent IS NOT NULL
ORDER BY 1 , 2;
~~~

- ***Total Cases vs Total Deaths***

- ***Shows likelihood of dying if you contract covid in your country***

~~~
 SELECT 
    Location,
    date,
    total_cases,
    total_deaths,
    (total_deaths / total_cases) * 100 AS DeathPercentage
 FROM
    Covid
 WHERE
    location LIKE '%Somalia%'
        AND continent IS NOT NULL
 ORDER BY 1 , 2;
~~~

- ***Countries with Highest Infection Rate compared to Population***
~~~
SELECT 
    location,
    population,
    MAX(total_cases) AS Highest_Infectio,
    MAX((total_cases / population)) * 100 AS Infected_people
FROM
    covid
GROUP BY location , population
ORDER BY Infected_people;
~~~ 
- ***Countries with Highest Death Count per Population***
```
SELECT 
    Location,
    MAX(CAST(Total_deaths AS SIGNED)) AS TotalDeathCount
FROM
    covid
WHERE
    continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeathCount DESC;

```
- ***BREAKING THINGS DOWN BY CONTINENT***

- ***Showing contintents with the highest death count per population***
```
SELECT 
    continent,
    MAX(CAST(Total_deaths AS SIGNED)) AS TotalDeathCount
FROM
    covid.Covid
WHERE
    continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC;
```

-- GLOBAL NUMBERS
```
SELECT 
    SUM(new_cases) AS total_cases,
    SUM(CAST(new_deaths AS SIGNED)) AS total_deaths,
    round(SUM(CAST(new_deaths AS SIGNED)) / SUM(New_Cases) * 100,2) AS DeathPercentage
FROM
    covid.covid
WHERE
    continent IS NOT NULL
ORDER BY 1 , 2;

```

-  ***Total Population vs Vaccinations***
- ***Shows Percentage of Population that has recieved at least one Covid Vaccine***
```
select * from covid;

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as PeopleVaccinated
--, (PeopleVaccinated/population)*100
From CovidDeaths dea
Join covidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3
````



 