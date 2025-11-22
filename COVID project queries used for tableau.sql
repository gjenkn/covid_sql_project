/* Queries used for Tableau part of the project */

-- 1
Select 
    SUM(new_cases) as total_cases, 
    SUM(new_deaths) as total_deaths, 
    CAST(SUM(new_deaths) AS FLOAT) / CAST(SUM(new_cases) AS FLOAT) * 100 AS DeathPercentage
From PortfolioProject..CovidDeaths
where continent is not null;

-- 2. continent and total death count
-- (EU is included in Europe already)

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is null and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc


-- 3.
Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
Group by Location, Population
order by PercentPopulationInfected desc


-- 4
Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
--Where location like '%states%'
Group by Location, Population, date
order by PercentPopulationInfected desc