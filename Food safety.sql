SELECT * FROM food.outbreaks;

SELECT * FROM food.outbreaks
Where Year IS NULL 
or Month IS  NULL;

SELECT * FROM food.outbreaks
Where Year IS NOT NULL 
or Month IS NOT NULL;

delete from food.outbreaks
where state is null
or location is null
or food  is null
or Ingredient is null
or Serotype is null
or Status is null;

select * from food.outbreaks;

Select * from  food.outbreaks
where Species = '';

Select distinct(Species) from  food.outbreaks;

Select distinct(Status) from  food.outbreaks;

Update food.outbreaks
set Status = 'Suspected'
where Status = 'Suspected; Suspected' or status = 'Suspected; Suspected; Suspected'
or status = 'Suspected; Suspected; Suspected; Suspected'
or status = 'Suspected; Suspected; Suspected; Suspected; Suspected';

Update food.outbreaks
set Status = 'Confirmed'
where Status = 'Confirmed; Confirmed'or status = 'Confirmed; Confirmed; Confirmed; Confirmed; Confirmed; Confirmed'
or status = 'Confirmed; Confirmed; Confirmed'
or status = 'Confirmed; Confirmed; Confirmed; Confirmed'
;

UPDATE food.outbreaks
SET Status = 'Confirmed and Suspected'
WHERE Status IN ('Confirmed; Suspected; Suspected', 'Confirmed; Confirmed; Suspected', 'Confirmed; Suspected', 
                 'Suspected; Confirmed', 'Confirmed; Confirmed; Suspected; Confirmed', 
                 'Suspected; Confirmed; Confirmed', 'Confirmed; Suspected; Confirmed; Confirmed; Confirmed; Confirmed; Confirmed', 
                 'Confirmed; Confirmed; Confirmed; Confirmed; Suspected', 
                 'Confirmed; Confirmed; Confirmed; Confirmed; Confirmed; Suspected; Suspected; Suspected; Suspected; Suspected; Suspected; Suspected; Suspected',
                 'Confirmed; Suspected; Confirmed', 'Suspected; Suspected; Confirmed; Suspected', 
                 'Confirmed; Confirmed; Suspected; Suspected', 'Suspected; Suspected; Confirmed; Suspected; Suspected; Confirmed');

Select distinct(Status) from  food.outbreaks;

Select Distinct(Species) from  food.outbreaks;

select distinct(Serotype) from  food.outbreaks;

Select*from  food.outbreaks;

Update food.outbreaks
set Location = 'Unkown'
where Location = '';

Update food.outbreaks
set Food = 'NA'
where Food = '';

Update food.outbreaks
set Ingredient = 'NA'
where Ingredient = '';

Update food.outbreaks
set Species = 'Unkown'
where Species = '';

Update food.outbreaks
set Serotype = 'Unkown'
where Serotype = '';

Update food.outbreaks
set Status = 'Pending'
where Status = '';

Update food.outbreaks
set Illnesses = '0'
where Illnesses = '';

Update food.outbreaks
set Hospitalizations = '0'
where Hospitalizations = '';

Update food.outbreaks
set Fatalities = '0'
where Fatalities = '';

Select * from food.outbreaks;


#number of reported cases of foodborne illnesses by year:
SELECT YEAR, COUNT(*) AS Number_of_Cases
FROM food.outbreaks
GROUP BY YEAR
ORDER BY Year;

#distribution of reported cases by location 
SELECT Location, COUNT(*) AS Number_of_Cases
FROM food.outbreaks
GROUP BY location
ORDER BY Number_of_Cases DESC;

#distribution of reported cases by state 
SELECT State, COUNT(*) AS Number_of_Cases
FROM food.outbreaks
GROUP BY State
ORDER BY Number_of_Cases DESC;

#types of foodborne illnesses reported
SELECT Serotype, COUNT(*) AS Number_of_Cases
FROM food.outbreaks
GROUP BY Serotype
ORDER BY Number_of_Cases DESC;

#relationship between reported cases and food
SELECT Food, COUNT(*) AS Number_of_Cases
FROM food.outbreaks
GROUP BY Food
ORDER BY Number_of_Cases DESC;

##relationship between reported cases and ing
SELECT Ingredient, COUNT(*) AS Number_of_Cases
FROM food.outbreaks
GROUP BY Ingredient
ORDER BY Number_of_Cases DESC;

#seasonal trends in reported cases of foodborne illnesses
SELECT Month, COUNT(*) AS Number_of_Cases
FROM food.outbreaks
GROUP BY Month
ORDER BY Number_of_Cases desc;

#relationship between reported cases and specific Species
SELECT Species, COUNT(*) AS Number_of_Cases
FROM food.outbreaks
GROUP BY Species
ORDER BY Number_of_Cases DESC;

#No. of confirmed cases
Select count(*) As Number_of_Cases from food.outbreaks
Where Status = "Confirmed";

#No. of confirmed cases in year 2005
Select count(*) As Number_of_Cases from food.outbreaks
Where Status = "Confirmed" And Year = 2005;

#No. of suspected cases
Select count(*) As Number_of_Cases from food.outbreaks
Where Status = "Suspected";

#No. of Suspected cases in year 2005
Select count(*) As Number_of_Cases from food.outbreaks
Where Status = "Suspected" And Year = 2005;

Select count(*) As Number_of_Cases from food.outbreaks
Where Status = "Confirmed and Suspected";

#top 10 states with the highest number of reported illnesses
SELECT state, sum(Illnesses) AS Total_Illnesses
FROM food.outbreaks
GROUP BY state
ORDER BY Total_Illnesses DESC
LIMIT 10;

#top 10 states with the highest number of reported Hospitalizations
SELECT state, sum(Hospitalizations) AS Total_Hospitalizations
FROM food.outbreaks
GROUP BY state
ORDER BY Total_Hospitalizations DESC
LIMIT 10;

#top 10 states with the highest number of reported Fatalities
SELECT state, sum(Fatalities) AS Total_Fatalities
FROM food.outbreaks
GROUP BY state
ORDER BY Total_Fatalities DESC
LIMIT 10;

#total number of reported illnesses by year and month
SELECT year, month, SUM(illnesses) AS Total_Illnesses
FROM food.outbreaks
GROUP BY year, month
ORDER BY year, month;

#distribution of illness status
SELECT status, COUNT(*) AS Case_Count
FROM food.outbreaks
GROUP BY status;

#Monthly trend of hospitalizations:
SELECT YEAR, MONTH, SUM(Hospitalizations) AS Total_Hospitalizations
FROM food.outbreaks
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH;
    
#Monthly trend of fatalities:
SELECT YEAR, MONTH, SUM(Fatalities) AS Total_Fatalities
FROM food.outbreaks
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH;
  
#Cases by status and state:
SELECT State, Status, COUNT(*) AS Case_Count
FROM food.outbreaks
GROUP BY State,Status;

#Total illnesses and hospitalizations by food and ingredient:    
SELECT Food, Ingredient, SUM(Illnesses) AS Total_Illnesses, SUM(Hospitalizations) AS Total_Hospitalizations
FROM food.outbreaks
GROUP BY Food, Ingredient;

#Cases by Location:
SELECT COUNT(*) AS Case_Count, Location 
FROM food.outbreaks
GROUP BY Location;

#Species
SELECT distinct(Species) FROM food.outbreaks;

#State with Fatalities:
SELECT State, Count(Fatalities) As Fatality_Count
FROM food.outbreaks
Group By State;

#Case count by species:
Select Species,Count(*) As Case_count
FROM food.outbreaks
GROUP BY Species;

#Case count by top 5 species:
Select Species,Count(*) As Case_count
FROM food.outbreaks
GROUP BY Species
order by Case_count desc
limit 5;

#Highest Fatalities by species:
Select Species, sum(Fatalities) As Fatality_Count
FROM food.outbreaks
GROUP BY Species
order by Fatality_Count desc
limit 5;

#Highest Illnesses by species:
Select Species, sum(Illnesses) As Illnesses_Count
FROM food.outbreaks
GROUP BY Species
order by Illnesses_Count desc
limit 5;

#Highest Hospitalizations by species:
Select Species, sum(Hospitalizations) As Hospitalizations_Count
FROM food.outbreaks
GROUP BY Species
order by Hospitalizations_Count desc
limit 5;

Select * From food.outbreaks
where year between 1997 and 2016;

select * from food.outbreaks;



