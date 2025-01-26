USE  TechForAllWithMonish;
-- Creating another table [Courses]--
CREATE TABLE Courses(
CourseId int  AUTO_INCREMENT PRIMARY KEY,
CourseName varchar(30) not null,
CourseDuration int not null,
CourseFee int not null
);

INSERT INTO Courses(CourseName,CourseDuration,CourseFee) VALUES('SQL',6,899),
    ('OOPS',8,999),
    ('Python', 10, 1299),
    ('Java', 12, 1499),
    ('Data Structures', 8, 1399),
    ('Web Development', 14, 1999),
    ('Machine Learning', 16, 2499),
    ('Cloud Computing', 10, 1799),
    ('Cyber Security', 12, 1999),
    ('Blockchain', 15, 2299),
    ('Artificial Intelligence', 20, 2999),
    ('React', 8, 1599),
    ('Spring Boot', 10, 1699),
    ('Thymeleaf', 6, 1099),
    ('SQL Advanced', 8, 1199),
    ('Big Data', 18, 2799),
    ('DevOps', 14, 2399),
    ('C Programming', 6, 899),
    ('C++ Programming', 8, 1099),
    ('R Programming', 10, 1299),
    ('Data Analytics', 12, 1899),
    ('Software Testing', 10, 1499);
    

-- Altering the Auto_increment starting value--
/* SYNTAX:
ALTER TABLE {table_name} AUTO_INCREMENT={};
There should be only one col with auto increment in a table and that specific col should be not null
*/
ALTER TABLE Courses AUTO_INCREMENT=102;

-- Creating another table [Students]--
CREATE TABLE Students(
StudentID	INT	AUTO_INCREMENT,
S_FirstName	varchar(50) ,
S_LastName	varchar(50) ,
S_Email varchar(50) NOT NULL,
S_Phone	varchar(50) NOT NULL,
S_EnrollmentDate timestamp NOT NULL,
Selected_Course	INT NOT NULL,
Years_Of_Exp INT NOT NULL,
S_Company varchar(50) NOT NULL,
Batch_Start_Date timestamp NOT NULL,
Location varchar(50) NOT NULL,
PRIMARY KEY(StudentID)
)
DESC Students;

-- adding a contraints called UNIQUE for col --
ALTER TABLE Students ADD UNIQUE(S_Email,S_Phone);
/* we can add UNIQUE contraints for multiple col at a time but NOT NULL contraint cannot be added like this */

-- adding a contraints called NOT NULL for col --
ALTER TABLE Students MODIFY S_FirstName varchar(40) NOT NULL;
ALTER TABLE Students MODIFY S_LastName varchar(40) NOT NULL;
DESC Students;

-- Dropping Students Table--
DROP TABLE Students;

-- Creating a new table called [Learners]--
/* FOREIGN KEY : 
It prevent the Learnes from entering invalid id in Selected Course 
Parent table :Courses of col (Course_id)
Child tabel:Learners of col (Selected_Course)
here learnes cannot enter the value in Selected_Course that is 
not in the Course_id col of Courses table
*/

CREATE TABLE Learners (
    LearnerID INT AUTO_INCREMENT,
    L_FirstName VARCHAR(50) NOT NULL,
    L_LastName VARCHAR(50) NOT NULL,
    L_Email VARCHAR(50) ,
    L_Phone VARCHAR(10) NOT NULL ,
    L_EnrollmentDate TIMESTAMP NOT NULL,
    Selected_Course  INT NOT NULL,-- (course_id)--
    Years_Of_Exp INT NOT NULL,
    L_Company VARCHAR(50) ,
    L_SOJ VARCHAR(50) NOT NULL,
    Batch_Start_Date TIMESTAMP NOT NULL,
    Location VARCHAR(50) NOT NULL,
    PRIMARY KEY (LearnerID),
    UNIQUE(L_Email),
     FOREIGN KEY (Selected_Course) REFERENCES Courses(CourseId)
);
ALTER TABLE Learners AUTO_INCREMENT=102;
DESC Learners;
-- TimeStamp in (25 & 26) which was explained by Arpit Bhayani--

-- Inserting values into Learners Table--
/* and also ensure that enrollment date must be before the Batch_Start_Date .So alter the contraint */
ALTER TABLE Learners ADD CHECK (L_EnrollmentDate < Batch_Start_Date);

INSERT INTO Learners (L_FirstName, L_LastName, L_Email, L_Phone, L_EnrollmentDate, Selected_Course, Years_Of_Exp, L_Company, L_SOJ, Batch_Start_Date, Location)
VALUES
    ("Akash", "Mishra", "akash@gmail.com", '9998887776', '2024-01-21', 1, 4, "Amazon", "LinkedIn", '2024-02-29', "Bengaluru"),
    ("Aranya", "Kumari", "aranya@gmail.com", '9992887776', '2024-01-12', 1, 2, "EXL", "YouTube", '2024-02-29', "Noida"),
    ("Rashmi", "Tanwar", "rashmi@gmail.com", '8398887776', '2024-01-12', 2, 1, "SBI Bank", "Advertisement", '2024-01-16', "Rohtak"),
    ("Dheeraj", "Kumar", "dheeraj@gmail.com", '7298887776', '2024-01-15', 1, 6, "Paytm", "Others", '2024-02-29', "Bengaluru"),
    ("Divya", "Bhatt", "divya@gmail.com", '9998886776', '2024-01-12', 2, 3, "Thales", "LinkedIn", '2024-01-16', "Gurugram"),
    ("Devyansh", "Bhatia", "devyansh@gmail.com", '9998876776', '2024-01-12', 3, 3, "Thales", "LinkedIn", '2024-03-25', "Gurugram"),
     ("Monisha","Periyasamy","","9944006719",'2024-01-12',6,1,"Esko" ,"Youtube",'2024-04-04',"Erode"),
     ("Monisha","Sivakumar","moni@gmail.com","9150730225",'2024-03-12',6,1,null ,"Youtube",'2024-04-04',"Erode");
     /* if time is not specified at the time of insertion, it will take 00:00:00 by deafault*/
SELECT * FROM Learners;


-- Data Analysis[Employee] [Courses] [Learners]--
/* QUERY 1:
Display the details of the employee ,who is getting maximum salary */
SELECT * FROM Employee
ORDER BY Salary DESC
LIMIT 1;
/* order of execution:
FROM -> SELECT ->ORDER BY(sorting the data) -> LIMIT
order by coming after select is because . The work of order by is to sort the data.In order to sort the data , we should have data already right? 
*/
-- Alter way :--
SELECT * FROM Employee
WHERE Salary =(SELECT MAX(Salary) FROM Employee);



/*QUERY 2
Display the details of the employee who is getting maximum salary with age greater than 30
*/
SELECT * FROM Employee
WHERE Age>30
ORDER BY  Salary  DESC -- same as already told, to sort the data we need  data but ( in the data we are applying the condition of age ) after this filteration only the data for sorting is moved for order by--
LIMIT 1;
/*order of execution:
FROM -> WHERE-> SELECT->ORDER BY->LIMIT
first we apply filter , which data to select then we order by those filtered data finally limit the result set
*/


/*QUERY 3:
Display the total num of enrollments in the website of techForAllWithMonish
*/
SELECT COUNT(*) AS Total_Enrollment FROM Learners; -- 7--
SELECT COUNT(L_Email)  FROM Learners;-- 6-- 
/* As we know that count(col) count only the non-null values .Count(*) count the entire row also with null values.*/


/*QUERY 4:
Display the total num of enrollments for couse id 3 in the website of techForAllWithMonish
*/
SELECT COUNT( LearnerID) AS Total_Enrollment_forID3 FROM Learners 
WHERE Selected_Course=1;
/*order of execution:
FROM --> WHERE --> SELECT COUNT(*)

/*QUERY 5
Count the number of students who had enrolled in the month January
*/
SELECT COUNT(*) AS total_Enrollment_JAN From Learners
WHERE L_EnrollmentDate LIKE '____-01-%';
/*QUERY 5.1
Count the number of students who had enrolled ON 21st Jan
*/
SELECT COUNT(*) AS total_Enrollment_21JAN From Learners
WHERE L_EnrollmentDate LIKE '____-01-21%';-- 21% , % is used after 21 is because ,it is TimeStamp there will be value(time) after date for eg: 2024-01-21 00:00:00--

-- alternate way 5.1 :
SELECT COUNT(*) as  total_Enrollment_JAN From Learners
WHERE MONTH(L_EnrollmentDate) = 1;

SELECT COUNT(*) as  total_Enrollment_JAN From Learners
WHERE L_EnrollmentDate BETWEEN '2024-01-01' AND '2024-01-31'


/*QUERY 6
update the YOE as 3 and company as Amazon for the Learner Rashmi and her id 104
*/
UPDATE Learners
SET Years_Of_Exp=3,L_Company="Amazon"
WHERE LearnerID=104;

/*QUERY 7 
Count the different number of companies that learners belongs to
*/
SELECT COUNT(DISTINCT L_Company) as Companies from Learners;
/*QUERY 8
count the total number of different companies and the total number of learners in each company.
*/
SELECT L_Company,COUNT(*) as Total_Learners_Working FROM Learners
GROUP BY L_Company
HAVING L_Company is not null; -- since mo has not entered here company name, if it is not specified it will show NULL in a company col--



