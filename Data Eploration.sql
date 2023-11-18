--select * 
--from dbo.covidDeaths$
--order by 3,4

--select *
--from dbo.CovidVaccinations$
--order by 3,4

--Looking at Total Cases vs Total Deaths globally
select Location, Date, Total_Cases, new_cases, total_deaths, population, (total_deaths/total_cases)*100 as percentage
from dbo.covidDeaths$
where Date = '2020-04-15' and Location = 'Sudan'
order by 1,2

-- Looking at Total Cases vs Population in percentage World Wide
select Location, Date, Total_Cases, new_cases, total_deaths, population, (total_cases/population)*100 as percentage
from dbo.covidDeaths$
-- Looking at Total Cases vs Population in Sudan in percentage
select Location, Date, Total_Cases, new_cases, total_deaths, population, (total_cases/population)*100 as percentage
from dbo.covidDeaths$
where Location = 'Sudane'
order by 1,2





-- Loooking at Countries with Highest Infectiion Rate compared to Population
select Location, Date, Total_Cases, new_cases, total_deaths, population, (total_cases/population)*100 as percentage
from dbo.covidDeaths$


-- Looking at Total Cases vs Population in Sudan in percentage
select Location, Population, Max( Total_Cases) as  Highest_Infection_Count,	Max((total_cases/population))*100 as percentage_Highes_Infection
from dbo.CovidDeaths$
group by Location, Population
order by percentage_Highes_Infection desc

--Showing Countries with Highest Death Count per Population
select Location,  MAX(Cast(total_deaths as int)) as Total_Deaths_Count
from dbo.CovidDeaths$
Where Location not in ('Africa', 'Asia', 'World', 'North America', 'South America', 'Europe', 'European Union')
group by Location
order by Total_Deaths_Count desc

--Showing Continent highst  Count per Population
select Location, MAX(cast(Total_deaths as int)) as Total_Deaths_Count
from [COVID19 Project].dbo.CovidDeaths$
Where continent is null
Group by Location
Order By Total_Deaths_Count desc

-- Showing The Continent With Highest death count per population
select Location, MAX(cast(Total_deaths as int)) as Total_Deaths_Count
from [COVID19 Project].dbo.CovidDeaths$
Where continent is null
Group by Location
Order By Total_Deaths_Count desc

-- Continents Numbers

select continent, MAX(cast(Total_deaths as int)) as Total_Deaths_Count
from [COVID19 Project].dbo.CovidDeaths$

where Continent is not null
Group by continent
order by 1,2
--Global Numbers
select  SUM(new_cases) as Total_Cases, SUM(CAST(New_Deaths as int)) as Total_Deaths, SUM(CAST(New_Deaths as int))/SUM(new_cases)*100 as Death_Percentage
from [COVID19 Project].dbo.CovidDeaths$
Where Continent is not Null
order by 1,2

-- joining two Tables 

-- using CTE
With popvsvac (continent, location, date, population, New_Vaccinations, rolling_people_vac)
as
(

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as rolling_people_vac
from [COVID19 Project].dbo.covid19 dea 
join [COVID19 Project].dbo.CovidVaccinations$ vac
on dea.location = vac.location
and dea.date = vac.date

where dea.continent is not null
--order by 2,3
)
SELECT *, (rolling_people_vac/POPULATION)*100
FROM popvsvac




