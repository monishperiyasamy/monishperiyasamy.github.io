SHOW DATABASES; /* shows all available DB in MySQL software */

-- Creating databse--
CREATE DATABASE techForAllWithMonish; /* Create new DB */
/* if I try to excute the above command, I will get error as Can't create DB.Because it already exists. */
CREATE DATABASE  IF NOT EXISTS techForAllWithMonish;
/* if I try to excute the above command, I will show warning instead of error as Can't create DB.Because it already exists. */

-- To Choose Particular DB--
USE techForAllWithMonish;

-- To identify current DB that is in use--
SELECT DATABASE(); /* without choosing DB , we can't execute thus cmd*/

-- CRUD operation--
-- Creating a new table--
CREATE TABLE employee(
FirstName varchar(20),
LastName varchar(20),
Age int,
Salary int,
Location varchar(40)
);

-- To get description about the table--
DESC employee;/* without choosing DB , we can't execute thus cmd*/

-- show all the tables that is available in DB--
SHOW TABLES;/* without choosing DB , we can't execute thus cmd*/



