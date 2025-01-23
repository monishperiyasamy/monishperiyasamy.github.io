use techForAllWithMonish
-- Inserting values into Table--
/* METHOD 1  Syntax:
INSERT INTO {table_name}  values ("", , );
the order of the values is in the same order as the columns in the table.
*/
INSERT INTO employee VALUES ("Monisha", "Periyasamy",21, 50000, "Coimbatore");
INSERT INTO employee VALUES ("Arjun", "Kumar", 25, 30000, "Bangalore");
INSERT INTO employee VALUES ("Priya", "Sharma", 28, 35000, "Mumbai");
INSERT INTO employee VALUES ("Vishal", "Reddy", 23, 40000, "Hyderabad");
INSERT INTO employee VALUES ("Divya", "Patel", 26, 45000, "Ahmedabad");
INSERT INTO employee VALUES ("Rajesh", "Singh", 30, 50000, "Delhi");
INSERT INTO employee VALUES ("Sneha", "Das", 24, 55000, "Kolkata");
INSERT INTO employee VALUES ("Amit", "Verma", 27, 60000, "Chennai");
INSERT INTO employee VALUES ("Nisha", "Jain", 29, 65000, "Pune");

/* METHOD 2  Syntax:
INSERT INTO {table_name} (col1, col1, col3...)  values ("", , );
the order of the values is in the same order as the columns specified now.
*/
INSERT INTO employee(Age,Salary, Location, LastName, FirstName) VALUES ( 24, 70000, "Erode", "Chopra", "Neeraj");
/* when I use this method the correct dataype values must be provided for the respective column , it cannot be null */
SELECT * FROM employee;

-- Dropping a  table again--
DROP TABLE employee;

-- CONTRAINTS--
/* Not Null*  , to make sure the particular col value is NOT NULL*/
CREATE TABLE employee(
FirstName varchar(20)NOT NULL,
LastName varchar(20) NOT NULL,
Age int NOT NULL,
Salary int NOT NULL,
Location varchar(40) NOT NULL
);
DESC employee;
-- Dropping a  table--
DROP TABLE employee;
/* PRIMARY KEY , to make every employee distinguish 
METHOD 1
*/
CREATE TABLE employee(
Emp_id bigint PRIMARY KEY,
FirstName varchar(20)NOT NULL,
LastName varchar(20) NOT NULL,
Age int NOT NULL,
Salary int NOT NULL,
Location varchar(40) NOT NULL
);
/* METHOD 2 */
CREATE TABLE employee(
Emp_id bigint,
FirstName varchar(20)NOT NULL,
LastName varchar(20) NOT NULL,
Age int NOT NULL,
Salary int NOT NULL,
Location varchar(40) NOT NULL,
PRIMARY KEY (Emp_id)
);

-- Instering values in table again --
INSERT INTO employee VALUES (1, "Monisha", "Periyasamy", 21, 50000, "Coimbatore");
INSERT INTO employee VALUES (2, "Arjun", "Kumar", 25, 30000, "Bangalore");
INSERT INTO employee VALUES (3, "Priya", "Sharma", 28, 35000, "Mumbai");
INSERT INTO employee VALUES (4, "Vishal", "Reddy", 23, 40000, "Hyderabad");
INSERT INTO employee VALUES (5, "Divya", "Patel", 26, 45000, "Ahmedabad");
INSERT INTO employee VALUES (6, "Rajesh", "Singh", 30, 50000, "Delhi");
INSERT INTO employee VALUES (7, "Sneha", "Das", 24, 55000, "Kolkata");
INSERT INTO employee VALUES (8, "Amit", "Verma", 27, 60000, "Chennai");
INSERT INTO employee VALUES (9, "Nisha", "Jain", 29, 65000, "Pune");
INSERT INTO employee VALUES (10, "Karthik", "Menon", 22, 32000, "Trivandrum");
INSERT INTO employee VALUES (11, "Ananya", "Roy", 31, 70000, "Guwahati");
INSERT INTO employee VALUES (12, "Rohit", "Shah", 28, 55000, "Surat");
INSERT INTO employee VALUES (13, "Meera", "Nair", 26, 48000, "Kochi");
INSERT INTO employee VALUES (14, "Aditya", "Joshi", 27, 53000, "Jaipur");
INSERT INTO employee VALUES (15, "Pooja", "Bose", 29, 58000, "Lucknow");

-- Auto increment--
/* Instead of mentioning the primary Key every time.We can make it auto increment.
There will be only one col with auto increment in the table and that col must be with NOT NULL constraint 
*/
-- Dropping a  table again--
DROP TABLE employee;

-- Creating table again--
CREATE TABLE employee(
Emp_id bigint AUTO_INCREMENT,
FirstName varchar(20)NOT NULL,
LastName varchar(20) NOT NULL,
Age int NOT NULL,
Salary int NOT NULL,
Location varchar(40) NOT NULL,
PRIMARY KEY (Emp_id)
);
-- Inserting the values again--
INSERT INTO employee (FirstName, LastName, Age, Salary, Location) VALUES 
("Monisha", "Periyasamy", 21, 50000, "Coimbatore"),
("Arjun", "Kumar", 25, 30000, "Bangalore"),
("Priya", "Sharma", 28, 35000, "Mumbai"),
("Vishal", "Reddy", 23, 40000, "Hyderabad"),
("Divya", "Patel", 26, 45000, "Ahmedabad"),
("Rajesh", "Singh", 30, 50000, "Delhi"),
("Sneha", "Das", 24, 55000, "Kolkata"),
("Amit", "Verma", 27, 60000, "Chennai"),
("Nisha", "Jain", 29, 65000, "Pune"),
("Karthik", "Menon", 22, 32000, "Trivandrum"),
("Ananya", "Roy", 31, 70000, "Guwahati"),
("Rohit", "Shah", 28, 55000, "Surat"),
("Meera", "Nair", 26, 48000, "Kochi"),
("Aditya", "Joshi", 27, 53000, "Jaipur"),
("Pooja", "Bose", 29, 58000, "Lucknow");
/* You can skip column names only if:
You're inserting values for all columns in the order  that matches the order in the table.
But, here we do not want to insert the value for the col Emp_id.So col name must be specified
*/
SELECT * FROM employee;
/* to start auto_increment from the specific value cannot be defined in column definition. It can be done using alter command only*/

-- Select Statement--
/* Query 1: Select employee firstName,Lastname,Salary whose salary is greater than or equal to 50000
*/
SELECT FirstName,LastName,Salary from employee 
WHERE Salary>=50000;

-- ORDER BY ( By default it will sort in Ascending Order)--
/* Query 2: Select employee firstName,Lastname,Salary whose salary is greater than or equal to 50000 in descending order of salary
*/
SELECT FirstName,LastName,Salary from employee 
WHERE Salary>=50000
ORDER BY Salary DESC;

-- Limit (used to limit output)--1
/* Query 3: Select only top 2 employee firstName,Lastname,Salary whose salary is greater than or equal to 50000 in descending order of salary
*/
SELECT FirstName,LastName,Salary from employee 
WHERE Salary>=50000
ORDER BY Salary DESC
LIMIT 2;

-- Offset ( used to omit a specified number of rows before the beginning of the result set)--
/* Query 4: Select only top 4th & 5th employee firstName,Lastname,Salary whose salary is greater than or equal to 50000 in descending order of salary
*/
SELECT FirstName,LastName,Salary from employee 
WHERE Salary>=50000
ORDER BY Salary DESC
LIMIT 2 OFFSET 2;






