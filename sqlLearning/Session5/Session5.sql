USE TechForAllWithMonish;
show tables;
SELECT * FROM Employee;
SELECT * FROM 	Courses;
SELECT * FROM Learners;


-- WINDOW FUNCTION--
/* QUERY 1
For Each Location, what is the count of employee and avg salary of employee in those location
*/

SELECT Location, Count(Location) AS TotalEmployee, SUM(Salary) as TotalSalary ,Avg(Salary) as AvgSalaryOfLocation FROM Employee
GROUP BY Location;
-- Order of Execution :FROM --> GROUP BY --> SELECT --


/* QUERY 2
For Each Location, what is the count of employee and avg salary of employee in those location 
and also display the firstName,LastName of each record
*/
-- Approach used first :
SELECT FirstName, LastName ,Location, Count(Location) AS TotalEmployee, SUM(Salary) as TotalSalary ,Avg(Salary) as AvgSalaryOfLocation FROM Employee
GROUP BY Location,FirstName,LastName;
/* This is the Brute force approach that we use.But this apporach does  not work when both person have same firstname and lastname , It show as 
Monisha  Periyasamy Coimbatore 2  67789090
Instead of this :
Monisha Periyasamy Coimbatore 1 67789090
Monisha Periyasamy Coimbatore 1 67789090

here Comes JOINS Concept

*/
-- PARTITION BY
/* The above join is not fesible , it increases the complexity 
PARTITION BY  is same as like GROUP BY but it allows us to display the non -aggregated col
*/
SELECT 
    FirstName, 
    LastName, 
    Location,  
    COUNT(Location) OVER (PARTITION BY Location) AS Location_TotalEmployee,  
    AVG(Salary) OVER (PARTITION BY Location) AS Avg_Salary
FROM Employee;


SELECT VERSION();

-- ROW_NUMBER () VS RANK() VS DENSERANK() --

/* Query 3 (	ROW_NUMBER)
Looking forward to create a new column , in that col employee with 
higher salary get their respective priority 
*/
SELECT FirstName,LastName,Salary,
ROW_NUMBER() OVER(ORDER BY Salary DESC ) AS Priority 
From EMployee;
 
/* There is a issue in this , because people having same salary
are given diff priority values. ROW_NUMBER () always assign unique values.
Here comes RANK()
*/

-- RANK()
SELECT FirstName,LastName,Salary,
RANK() OVER(ORDER BY Salary DESC ) AS Priority 
From EMployee;
/* The issue of prioritising diff value for same salary is resolved.
But the priority 2 is skipped directly it jumped to priority 3.
Here comes DENSE_RANK()
*/
-- DENSE_RANK() --
SELECT FirstName,LastName,Salary,
DENSE_RANK() OVER(ORDER BY Salary DESC ) AS Priority 
From EMployee;

/* When there is no dup entire then above three function gives the same 
results 
*/

-- QUERY 4 . Display the employee record having 1st highest salary --
SELECT * FROM 
(SELECT FirstName,LastName,Salary,
DENSE_RANK() OVER(ORDER BY Salary DESC ) AS Priority 
From EMployee) AS Temp
WHERE Priority =1
/* thE above query shows all the employee who is getting 1st highest 
salary  .But I want the first person who is getting 1st highest salary
*/
SELECT * FROM 
(SELECT FirstName,LastName,Salary,
ROW_NUMBER() OVER(ORDER BY Salary DESC ) AS Priority 
From EMployee) AS Temp
WHERE Priority =1;
-- alter way (NOT RECOMMENDED)--
SELECT * FROM 
(SELECT FirstName,LastName,Salary,
ROW_NUMBER() OVER(ORDER BY Salary DESC ) AS Priority 
From EMployee) AS Temp
WHERE Priority =1
LIMIT 1;

/*QUERY 5
Specify the details of highest salary people in each location
*/
-- My query--
SELECT FirstName,LastName,  Location,
MAX(Salary) OVER (Partition by Location)  AS HighestSalary
FROM Employee;

-- Mentor Query
Select * from
(SELECT FirstName,LastName, Location,Salary,
 ROW_NUMBER() OVER (Partition by Location ORDER BY Salary)  AS Priority
FROM Employee ) AS Temp
WHERE Priority=1;

/* 
Wherever we use ROW_NUMBER(), RANK(), DENSE_RANK() mandatory condition is to use ORDER BY .
 PARTITION BY is optional 
 */
 
 -- LEETCODE QUESTIONS  
 -- 178 
 /* Write a solution to find the rank of the scores. The ranking should be calculated according to the following rules:

The scores should be ranked from the highest to the lowest.
If there is a tie between two scores, both should have the same ranking. --{ DENSE_RANK() or RANK()} Row_Number cannot be used , becuase it provide unique rank for each record
After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
Return the result table ordered by score in descending order. -- { Here it confirms that we have use DENSE_RANK() }

The result format is in the following example.
*/
SELECT score,DENSE_RANK() OVER (ORDER BY score desc) AS rank FROM Scores; -- IN Practice Screenshot 2025-02-04 113524.png--

