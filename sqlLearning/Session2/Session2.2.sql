-- CRUD (Update and delete)--
use techForAllWithMonish;
show tables;
select * from employee;

-- Update--
/* Query1 : update Lastname of Divya as Chandru for emp_id 5
SYNTAX:
UPDATE {table_name}
SET {col_name}= {value}
WHERE id={}
*/
UPDATE employee
SET LastName='Chandru'
WHERE Emp_id=5;

/* Every time you try to update a value in a table ..it must be done 
with a primary key col.
If not ,you want to disable safe updates =0 (which is not enabled by default)
 */

/* QUERY: to update entire table , should not use where clause (it is used to update for a particular id)
*/
SET SQL_SAFE_UPDATES = 0;
UPDATE employee
SET Salary= (Salary +(Salary *(8/100)));

SET SQL_SAFE_UPDATES = 1;
-- DELETE COMMAND--
/* QUERY: to delete a employee record for id =6 
SYNTAX:
DELETE FROM {table_name}
WHERE {key_colName} ={}
*/
DELETE FROM employee
WHERE Emp_id=6; -- same as update if where clause is not used .It will delete the entire table--

-- {DIFFERENCE BETWEEN ALTER & UPDATE COMMAND IS EXPLAINED IN PAGE NO:17}--

-- Alter Commands --
DESC employee;
/* QUERY: change the LastName varchar(20) to varchar(30) 
Here-> The question is related to changing the schema/structure/definition
of the table .So we should use ALTER command .
SYNTAX: 
ALTER TABLE {table_name} MODIFY(already present col i want to modify) {col_name} {datatype} {any_constraints}
*/
ALTER TABLE employee MODIFY LastName varchar(30) not null;

/* QUERY: to add a new col called mobile datatype as varchar(10)
Here-> The question is related to changing the schema/structure/description(DESC)
of the table .So we should use ALTER command .
SYNTAX: 
ALTER TABLE {table_name} ADD {col_name} {datatype} {any_constraints}
*/
ALTER TABLE employee ADD Mobile varchar(10) NOT NULL;

DESC employee;

/* QUERY: to delete a column called mobile datatype as varchar(10)
Here-> The question is related to changing the schema/structure/description(DESC)
of the table .So we should use ALTER command .
SYNTAX: 
ALTER TABLE {table_name} DROP {col_name} 
*/
ALTER TABLE employee DROP Mobile;
DESC employee;

-- ADDING-- 
ALTER TABLE employee ADD Mobile varchar(10) NOT NULL;
-- MODIFYING--
ALTER TABLE employee MODIFY LastName varchar(30) not null;
-- DROPING A COL--
ALTER TABLE employee DROP Mobile;

-- Aggregation--
SELECT COUNT(*) FROM Employee;
SELECT COUNT(*) AS TotalEmployee FROM Employee; /*with Alias NAME */
SELECT MAX(Salary) AS Maximum_Salary FROM Employee;
SELECT MIN(Salary) AS Minimum_Salary FROM Employee;
SELECT SUM(Salary) AS Total_Salary FROM Employee;






