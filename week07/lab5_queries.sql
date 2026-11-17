-- =========================================================
-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
-- Database: sen307_vugsen2412377
-- Name: Student User
-- Matric: VUG/SEN/24/12377
-- =========================================================

USE sen307_vugsen2412377;

-- Task 1: Students in one department, sorted A-Z
-- Explanation: Joins the Student table with Department on dept_id, filters for Software Engineering, and sorts alphabetically.
SELECT s.matric_no, s.full_name, d.dept_name
FROM Student s
JOIN Department d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC; 

-- Task 2: Courses with their lecturers (INNER JOIN)
-- Explanation: Uses two INNER JOINs through CourseAllocation to map each course title to its assigned lecturer(s).
SELECT c.course_code, c.course_title, l.full_name AS lecturer_name
FROM Course c
JOIN CourseAllocation ca ON c.course_id = ca.course_id
JOIN Lecturer l ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_code;

-- Task 3: Students and their courses (LEFT JOIN)
-- Explanation: Uses LEFT JOINs from Student through Enrolment to Course so that students without courses are still included.
SELECT s.matric_no, s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
ORDER BY s.full_name;

-- Task 4: Filtering with AND/OR / IN / BETWEEN
-- Explanation: Combines multiple conditions using AND, IN, and BETWEEN to filter students based on gender, department IDs, and birth year range.
SELECT matric_no, full_name, gender, date_of_birth, dept_id
FROM Student
WHERE gender = 'F' 
  AND dept_id IN (1, 3) 
  AND date_of_birth BETWEEN '2004-01-01' AND '2005-12-31'
ORDER BY full_name;

-- Task 5: Paginating enrolments with LIMIT and OFFSET
-- Explanation: Uses ORDER BY enrolment_id with LIMIT 10 and OFFSET to retrieve paginated batches of 10 enrolment records deterministically (preventing random row order across pages).

-- Page 1 (rows 1-10)
SELECT * 
FROM Enrolment
ORDER BY enrolment_id ASC
LIMIT 10 OFFSET 0;

-- Page 2 (rows 11-20)
SELECT * 
FROM Enrolment
ORDER BY enrolment_id ASC
LIMIT 10 OFFSET 10;


-- Challenge (Optional): Task 3 rewritten using RIGHT JOIN
-- Explanation: Reverses the table join order so Student is on the right side, producing the exact same result as the LEFT JOIN. The LEFT JOIN version is much easier to read because it flows naturally from the primary entity (Student) to related records.
SELECT s.matric_no, s.full_name, c.course_title
FROM Course c
RIGHT JOIN Enrolment e ON c.course_id = e.course_id
RIGHT JOIN Student s ON e.student_id = s.student_id
ORDER BY s.full_name;