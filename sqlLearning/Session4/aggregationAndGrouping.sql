show databases;
create database aggregationAndGrouping;

use aggregationAndGrouping;


CREATE TABLE Course_Update (
    CourseID INT AUTO_INCREMENT, 
    CourseName VARCHAR(50) NOT NULL, 
    CourseDuration_Months DECIMAL(3,1) NOT NULL, 
    CourseFee INT NOT NULL, 
    PRIMARY KEY(CourseID)
);
alter table Course_Update modify column CourseDuration_Months INT NOT NULL;
DESC Course_Update;
INSERT INTO Course_Update (CourseName, CourseDuration_Months, CourseFee) Values("Statistics for Data", 6.7, 7000);

ALTER TABLE Course_Update add column ChangedAt timestamp default NOW();
INSERT INTO Course_Update (CourseName, CourseDuration_Months, CourseFee) 
VALUES ("Machine Learning Basics", 5.5, 8500);

UPDATE Course_Update
set CourseFee = 80000 where CourseName="Machine Learning";


CREATE TABLE candidates (
    candidate_id INT,
    skill VARCHAR(50)
);

INSERT INTO candidates (candidate_id, skill) VALUES
(123, 'Python'),
(123, 'Tableau'),
(123, 'PostgreSQL'),
(234, 'R'),
(234, 'PowerBI'),
(234, 'SQL Server'),
(345, 'Python'),
(345, 'Tableau');

select  count(skill) from candidates
group by skill;