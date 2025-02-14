use TechForAllWithMonish;

SELECT * FROM Courses;
SELECT * FROM Learners;
SELECT * FROM Employee;

-- CASE STATEMENTS IN SQL --
/*
Create a new column named "CourseFeeStatus"
CourseFee > 3999 -> Expensive course
CourseFee > 1499 -> Moderate Course
ELSE -> Cheap Course
*/

SELECT CourseId,CourseName,CourseDuration,CourseFee,
CASE
WHEN CourseFee>3999 THEN 'Expensive Course'
WHEN CourseFee>1499 THEN 'Moderate Course'
ELSE 'Cheap Course'
END AS CourseFeeStatus
FROM Courses;

-- CASE EXPRESSION IN SQL --
/* Categorize the courses : Type 1) Premimum course 2) Plus Course 3) Regular Course
*/
SELECT CourseID,CourseName,CourseFee,
CASE CourseFee -- Categorize the courses on the basis of which col---
WHEN 19600 THEN 'Premimum Course'
WHEN 2999 THEN 'Plus Course'
ELSE 'Regular Course'
END AS CourseType
FROM Courses;

-- CTE (Common Table Expression) --

-- Create a  new table "TechOrders" --
CREATE TABLE TechOrders(
OrderId int auto_increment primary key,
OrderDate timestamp not null,
Order_StudentId int not null,
OrderStatus varchar(20) not null,

);
-- Adding Foreign Key using ALTER COMMAND--
ALTER TABLE TechOrders
ADD foreign key(Order_StudentId) references Learners(LearnerID);
DESC TechOrders;

-- Inseting values into table "TechOrders"--
INSERT INTO TechOrders (OrderDate, Order_StudentId, OrderStatus) 
VALUES 
    (NOW(), 102, 'Pending'),
    (NOW(), 103, 'Shipped'),
    (NOW(), 104, 'Delivered'),
    (NOW(), 105, 'Pending'),
    (NOW(), 106, 'Cancelled'),
    (NOW(), 107, 'Shipped'),
    (NOW(), 108, 'Processing'),
    (NOW(), 109, 'Delivered'),
    (NOW(), 110, 'Pending'),
    (NOW(), 102, 'Shipped'),  -- 102 ordered twice
    (NOW(), 104, 'Processing'),  -- 104 ordered twice
    (NOW(), 106, 'Pending'),  -- 106 ordered twice
    (NOW(), 109, 'Cancelled'),  -- 109 ordered twice
    (NOW(), 110, 'Shipped');  -- 110 ordered twice
    
    SELECT * FROM TechOrders;

-- Total order per student--

SELECT Order_StudentId, count(Order_StudentId) as TotalOrders from TechOrders
GROUP BY Order_StudentId;

-- now looking for two more col "L_FirstName", "L_LastName"--
SELECT L_FirstName,L_LastName , Order_StudentId,count(Order_StudentId) over(PARTITION BY Order_StudentId) AS TotalOrders
From TechOrders
JOIN Learners 
ON TechOrders.Order_StudentId =Learners.LearnerID;
/* Duplicate values beacause
"One row per order" means that if a student has multiple orders, they appear multiple times after the JOIN. This leads to incorrect aggregation when computing the average."
To fix this, the first query ensures aggregation happens before the join, so each student appears only once, making the average calculation correct.
*/


-- alternate way--
SELECT LearnerID,  L_FirstName,L_LastName , TotalOrders  
FROM Learners 
JOIN
(SELECT Order_StudentId, count(Order_StudentId) as TotalOrders from TechOrders
GROUP BY Order_StudentId)as Temp
ON Learners.LearnerID=Temp. Order_StudentId;

-- Looking for one more column called Avg_Orders --> for entire Student along with the four columns
SELECT *,SUM(Temp.TotalOrders) OVER() / COUNT(TotalOrders) OVER() AS Avg_Orders_Entire_Student FROM
(SELECT DISTINCT  Order_StudentId, L_FirstName,L_LastName , count(Order_StudentId) over(PARTITION BY Order_StudentId) AS TotalOrders
From TechOrders
JOIN Learners 
ON TechOrders.Order_StudentId =Learners.LearnerID)AS Temp;

/*
"One row per order" means that if a student has multiple orders, they appear multiple times after the JOIN. This leads to incorrect aggregation when computing the average."
To fix this, the first query ensures aggregation happens before the join, so each student appears only once, making the average calculation correct.
So i used Distinct ..If i remove distinct avg value is not computed properly
*/


-- ALTER WAY
select  Temp.Order_StudentId,Learners.L_FirstName,Learners.L_LastName,Temp.TotalOrders,SUM(Temp.TotalOrders) OVER() / COUNT(TotalOrders) OVER() AS Avg_Orders_Entire_Student
 FROM
(
SELECT Order_StudentId,count(Order_StudentId) as TotalOrders
From TechOrders
Group by Order_StudentId
)AS Temp
JOIN Learners
ON Temp.Order_StudentId=Learners.LearnerID;


-- OVER()
/*
to display the results for the entire num of records that we have
*/


-- THE QUERY WE USED ABOVE IS VERY COMPLEX ..SO WE GO FOR CTE--




