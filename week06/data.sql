USE sen307_vugsen2412377;

-- 1. Reset tables safely to prevent duplicate entry errors
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE CourseAllocation;
TRUNCATE TABLE Enrolment;
TRUNCATE TABLE Course;
TRUNCATE TABLE Student;
TRUNCATE TABLE Lecturer;
TRUNCATE TABLE Department;

-- 2. Insert Departments
INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

-- 3. Insert Courses with subqueries for department IDs
INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3,
'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('SEN301', 'Software Architecture', 3,
'Architectural styles, design patterns, microservices and how to structure large software systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('COS301', 'Operating Systems', 3,
'Processes, threads, CPU scheduling, memory management and file systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('COS305', 'Computer Networks', 3,
'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('AIN301', 'Introduction to Artificial Intelligence', 3,
'Intelligent agents, search algorithms, knowledge representation and reasoning.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN305', 'Machine Learning', 3,
'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN307', 'Natural Language Processing', 3,
'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('DTS301', 'Data Visualization and Analytics', 2,
'Exploratory data analysis, charts, dashboards and telling stories with data.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('DTS305', 'Big Data Technologies', 3,
'Distributed storage and processing of very large datasets with Hadoop and Spark.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('CYB301', 'Network Security', 3,
'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
(SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

-- 4. Insert Lecturers (10 in total)
INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUA/ST/103', 'Prof Chidi Nnamdi', 'c.nnamdi@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUA/ST/104', 'Dr Zainab Usman', 'z.usman@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUA/ST/105', 'Dr Emeka Adebayo', 'e.adebayo@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUA/ST/106', 'Engr Folake Ibrahim', 'f.ibrahim@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUA/ST/107', 'Dr Taribo Danjuma', 't.danjuma@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUA/ST/108', 'Dr Blessing Eze', 'b.eze@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUA/ST/109', 'Dr Yakubu Ahmed', 'y.ahmed@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
('VUA/ST/110', 'Dr Grace Okon', 'g.okon@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

-- 5. Insert Students (20 in total, including your matric number)
INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('VUG/SEN/24/12377', 'Student User', 'M', '2004-05-12', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUG/SEN/24/1002', 'Ada Obi', 'F', '2005-03-14', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUG/CIS/24/1003', 'John Musa', 'M', '2004-11-02', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUG/CIS/24/1004', 'Kalu Onyeamachi', 'M', '2003-08-21', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUG/AIN/24/1005', 'Fatima Abubakar', 'F', '2006-01-15', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUG/AIN/24/1006', 'Chinedu Okeke', 'M', '2005-07-30', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUG/DTS/24/1007', 'Aminu Audu', 'M', '2004-02-18', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUG/DTS/24/1008', 'Nkechi Egwu', 'F', '2007-04-10', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUG/CYB/24/1009', 'Babajide Soyinka', 'M', '2003-12-05', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
('VUG/CYB/24/1010', 'Funke Akindele', 'F', '2005-09-22', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
('VUG/SEN/24/1011', 'Emeka Nwosu', 'M', '2004-06-11', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUG/SEN/24/1012', 'Bisi Alabi', 'F', '2006-03-19', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUG/CIS/24/1013', 'Tunde Bakare', 'M', '2005-10-08', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUG/CIS/24/1014', 'Halima Bello', 'F', '2004-04-25', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUG/AIN/24/1015', 'Ibrahim Garba', 'M', '2003-11-14', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUG/AIN/24/1016', 'Yejide Ogundipe', 'F', '2007-01-02', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUG/DTS/24/1017', 'Victor Umeh', 'M', '2005-08-17', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUG/DTS/24/1018', 'Aisha Lawal', 'F', '2006-05-31', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUG/CYB/24/1019', 'Usman Danfodio', 'M', '2004-09-09', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
('VUG/CYB/24/1020', 'Chiamaka Igwe', 'F', '2005-12-28', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

-- 6. Insert Enrolments (40 rows)
INSERT INTO Enrolment (student_id, course_id) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1),
(1, 2), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 9), (9, 10), (10, 10),
(11, 1), (11, 2), (12, 1), (12, 2), (13, 3), (13, 4), (14, 3), (14, 4), (15, 5), (15, 6),
(16, 5), (16, 7), (17, 8), (17, 9), (18, 8), (18, 9), (1, 3), (2, 4), (3, 2), (4, 5),
(5, 6), (6, 7), (7, 10);

-- 7. Insert Course Allocations (10 allocations)
INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
(1, 1), (1, 2), 
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 6),
(8, 7),
(9, 8);

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

-- 8. Verification Query (Should show 5 departments with their respective course counts)
SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;