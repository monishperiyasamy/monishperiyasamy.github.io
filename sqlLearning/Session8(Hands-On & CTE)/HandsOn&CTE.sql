-- 1. Create database--
CREATE DATABASE  if not exists ecommerce_sales_data ;
USE ecommerce_sales_data ;

-- 2. Create a table ..so that we can import the dataset and analyse--

/* For creating table, Instead of creating manually
1) Download and Install Anaconda
2)Now , install csv kit in Anaconda prompt .This package helps to convert any csv file to sql cmd format 
// Command to install csv kit :pip install csvkit
//Command to generate SQL file : csvsql --dialect mysql --snifflimit 10000 Sales_Dataset.csv >Result.sql 
( By giving this command the create table query is created automatically with constraints in Result sql file)
*/
-- Automatically generated command --
CREATE TABLE `Sales_Dataset` (
	order_id VARCHAR(15) NOT NULL, 
	order_date DATE NOT NULL, 
	ship_date DATE NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 5) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	year DECIMAL(38, 0) NOT NULL
);

-- 3 Load the data available in .csv file  to the "Sales_Dataset" table
LOAD DATA INFILE 'C:\\Users\\monis\\OneDrive\\Documents\\sqlLearning\\Hands-On\\Sales_Dataset.csv' 
INTO TABLE Sales_Dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; 

-- Error: Mysql is running at secure-file-private error--
/* With Personal laptop:
1) Go to : C:\ProgramData\MySQL\MySQL Server 8.0 
2) Open Notepad with right click --> Run as Administrator
3)After opening click file and go the path (1) 
4)Change to All Files and Open 'my' file
5) Then search for secure using CTRL F cmd then you find,
secure-file-priv="C:/ProgramData/MySQL/MySQL Server 8.0/Uploads"
6) Change to :secure-file-priv=""

-- Error that I am faced even after following the above steps
=> It is due to security permission of csv file , Select csv file ,properties -> security tab, click EDIT then add Everyone 
*/

SELECT * FROM Sales_Dataset;

/* QUERY 1
Identify Top 3 States with highest Total Shipping cost
*/

SELECT state, sum(shipping_cost)  as total_shippingCost FROM Sales_Dataset
GROUP BY  state
ORDER BY total_shippingCost desc
LIMIT 3;

-- COMMAN TABLE EXPRESSION--
WITH states as(
SELECT state, sum(shipping_cost)  as total_shippingCost FROM Sales_Dataset
GROUP BY  state
ORDER BY total_shippingCost desc
LIMIT 3
)
SELECT * FROM states;
/* Saving the result inside a virtual table called states here.
You must use the virtual table ..if not CTE will not work.
It availabe only for the session ..use it after with()  clause immediately
*/ 
 
 -- WHEN YOU SHOULD GO FOR CTE--
 /*
 whenever there is lot of subqueries or joins are there in your sql queries,you can use this
 */

-- IN CASE STATEMENTS SESSION (SESSION 7)-- 
USE TechForAllWithMonish;
SELECT * FROM Courses;
SELECT * FROM Learners;
SELECT * FROM Employee;
SELECT * FROM TechOrders;

-- Display the premimum users of TechForAllWithMonish--
-- Total_Orders > avg_orders
WITH premimumUsers as
(select  Temp.Order_StudentId,Learners.L_FirstName,Learners.L_LastName,Temp.TotalOrders,SUM(Temp.TotalOrders) OVER() / COUNT(TotalOrders) OVER() AS Avg_Orders_Entire_Student
 FROM
(
SELECT Order_StudentId,count(Order_StudentId) as TotalOrders
From TechOrders
Group by Order_StudentId
)AS Temp
JOIN Learners
ON Temp.Order_StudentId=Learners.LearnerID
) SELECT Order_StudentId,premimumUsers.L_FirstName,premimumUsers.L_LastName FROM premimumUsers
WHERE TotalOrders> Avg_Orders_Entire_Student;

