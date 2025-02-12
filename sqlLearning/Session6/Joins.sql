use TechForAllWithMonish;
SELECT * FROM Courses;
SELECT * FROM Learners;
SELECT * FROM Employee;
-- JOINS AND SUBQUERIES-- (IN SQL Joins in Computationally Expensive)

/* QUERY 1
Which courses has highest enrollment rate
*/

Select Learners.Selected_Course,CourseName,count(*) as enrollment_COUNT from Courses
JOIN Learners
ON CourseId = Learners.Selected_Course
GROUP BY Selected_Course
ORDER BY enrollment_COUNT;


-- to find the top course --

/* JUST BY limiting the result you will get sql as a output .To get accurate result use DENSE_RAK()
*/


select * from(Select Learners.Selected_Course,CourseName,count(*) as enrollment_COUNT, 
dense_rank() over(order by count(*) desc) as top_res from Courses
JOIN Learners
ON CourseId = Learners.Selected_Course
GROUP BY Selected_Course)as Temp
where top_res=1 ;


-- ALTERNATE WAY .. try sub query also--




