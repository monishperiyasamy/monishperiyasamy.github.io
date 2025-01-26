/* USE Notes and Aggregation and Grouping.sql file for better understanding
*/

use TechForAllWithMonish;
SELECT * FROM Employee;
SELECT * FROM Courses;
SELECT * FROM Learners;


/*QUERY 1
Count the number of students who joined via diff SOJ,
*/
SELECT L_SOJ,COUNT(LearnerID) as Total FROM Learners
GROUP BY L_SOJ;

/*QUERY 2
Count the number of students who joined only via LinkedIn,YouTube
*/
SELECT L_SOJ,COUNT(LearnerID) as Total FROM Learners
GROUP BY L_SOJ
HAVING L_SOJ='LinkedIn' or L_SOJ='YouTube';
/* Order of Execution:
FROM-> GROUP BY-> HAVING->SELECT
Whatever column specified after group , then only these are the col that should be specified after SELECT .Then after 
that only Aggregation Function should be specified not anything else
*/
-- alter method:
SELECT L_SOJ,COUNT(LearnerID) as Total FROM Learners
WHERE L_SOJ='LinkedIn' or L_SOJ='YouTube'
GROUP BY L_SOJ;
/* Order of execution:
FROM->WHERE->GROUP BY->SELECT 
*/

/*QUERY 3 
Count of Learners by Source of Joining (SOJ) and Location
*/
SELECT L_SOJ,Location ,COUNT(*) AS TotalLearners 
FROM Learners
GROUP BY L_SOJ,Location;

/*QUERY 4
Corresponding to individual SOJ, give the max YOE any person holds
*/
SELECT L_SOJ,MAX(Years_Of_Exp) AS MAX_YOE FROM Learners
GROUP BY L_SOJ;

/*QUERY 4
Corresponding to individual SOJ, give the avg YOE any person holds
-- By defauly AVG() it will return in decimal value--
*/
SELECT L_SOJ,AVG(Years_Of_Exp) AS AVG_YOE FROM Learners
GROUP BY L_SOJ;

-- Dropping Unique Constraints. In Order to address QUERY 5--
ALTER TABLE Learners 
DROP INDEX L_Email; --  because unique constraints are implemented as unique indexes.--


DESC Learners;


/*QUERY 5
Display the records of those learners who have joined the course via more than one SOJ
*/
SELECT L_FirstName,L_LastName,L_Phone, Count(DISTINCT L_SOJ) AS Total_SOJ FROM Learners
GROUP BY L_Phone,L_FirstName,L_LastName
HAVING Total_SOJ >1; -- TO apply filter on the top group by.Never use WHERE () after GROUP BY()--


/*-- Dropping Primary Key Constraints.--
ALTER TABLE Learners 
DROP PRIMARY KEY; 

-- dropping AUTO INCREMENT 
ALTER TABLE {table_name}
modify {col_name} {datatype} ...
*/

-- Difference Delete VS Truncate Command--
/* DECIMAL DATATYPE:
*/
ALTER TABLE Courses
MODIFY CourseDuration DECIMAL(5,2);  -- 5-> max total number of digits , 3 --> maximum num of digits after decimal
INSERT INTO Courses (CourseName,CourseDuration,CourseFee) VALUES  ('RDBMS + SQL', 12.2, 4099);
SELECT * FROM Courses;

/* ABOUT TIMESTAMP
*/
ALTER TABLE Courses
ADD Changed_At TIMESTAMP default NOW(); -- when i insert a new record in a table . It will record the time in that col for all rows whenever any changes happen in the table--

INSERT INTO Courses (CourseName,CourseDuration,CourseFee) VALUES  ('Agile Methodlogy', 2, 499); -- 2025-01-26 18:49:20--
select * from Courses;

-- for update 
UPDATE Courses
set CourseFee=12600
where CourseId=21; -- still the timestamp remains in 2025-01-26 18:49:20--

/* But above is not applicable , whenever we try to update the record that is already available in the table 
so, 
*/
ALTER TABLE Courses
MODIFY Changed_At timestamp default now() on UPDATE NOW();

UPDATE Courses
set CourseFee=19600
where CourseId=21; -- 2025-01-26 18:59:42--











