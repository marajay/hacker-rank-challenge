--Query the difference between the maximum and minimum populations in CITY.
select max(population)- min(population)
from city;

--Query the average population for all cities in CITY, rounded down to the nearest integer.
select floor(avg(population))
from city;

-- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN
select Name
from city
where countrycode = 'JPN';

/*Given the CITY and COUNTRY tables, query the names of all the continents 
(COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer*/

select  country.continent, floor(AVG(city.population)) 
from city,country
where country.code = city.countrycode
group by country.continent;

-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
select city.name
from city
join country 
ON city.countrycode = country.code
where continent = "Africa";

-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
select sum(city.population)
from city
join country 
ON city.countrycode = country.code 
where continent = "Asia";

/*Query the greatest value of the Northern Latitudes (LAT_N)
from STATION that is less than 137.2345 Truncate your answer to 4 decimal places.*/

select Truncate(max(LAT_N),4)
from station
where LAT_N < 137.2345;

/*Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than  and less than .
Truncate your answer to  decimal places*/

select Truncate(sum(LAT_N),4)
from station
where LAT_N between 38.78880 and 137.2345;

/*You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.
Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students
who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than
one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is
lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade
(1-7) assigned to them, order those particular students by their marks in ascending order.*/

SELECT 
CASE 
     WHEN grd.grade < 8 THEN NULL 
     WHEN grd.grade >= 8 THEN std.name END,
     grd.grade, std.marks 
FROM students std, grades grd
WHERE std.marks BETWEEN grd.min_mark AND grd.max_mark
ORDER BY grd.grade DESC, std.name ASC;


