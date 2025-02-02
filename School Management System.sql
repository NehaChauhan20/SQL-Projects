-- Create a Database
CREATE DATABASE School_Management;
USE School_Management;

-- Create a table Stud_ents
CREATE TABLE Stud_ents(
stud_id INT PRIMARY KEY,
stud_name VARCHAR(50),
gender VARCHAR(10),
phone_no VARCHAR(10),
email VARCHAR(50),
address VARCHAR(50)
);

-- Insert values in the table Stud_ents
INSERT INTO Stud_ents(stud_id,stud_name,gender,phone_no,email,address) VALUES 
(),
(),
(),
(),
(),
(),
(),
(),
(),
();

-- Select all vlaues from this table.
SELECT * FROM Stud_ents;

-- Create a table Teachers
CREATE TABLE Teachers(
teacher_id INT PRIMARY KEY,
teacher_name VARCHAR(50),
gender VARCHAR(10),
phone_no VARCHAR(10),
email VARCHAR(50),
address VARCHAR(50),
department VARCHAR(50),
hire_date DATE
);

-- Insert values in the table Teachers
INSERT INTO Teachers(teacher_id,teacher_name,gender,phone_no,email,address,department,hire_date) VALUES
(),
(),
();

-- Select all vlaues from this table.
SELECT * FROM Teachers;

-- Create a table Subjects
CREATE TABLE Subjects(
sub_id INT PRIMARY KEY,
sub_name VARCHAR(50)
);

-- Insert values in the table 
INSERT INTO Subjects(sub_id,sub_name) VALUES 
(),
(),
();

-- Select all vlaues from this table.
SELECT * FROM Subjects;

-- Create a table Classes
CREATE TABLE Classes(
class_id INT PRIMARY KEY,
class_name VARCHAR(50),
subject_id INT,
teacher_id INT,
FOREIGN KEY (subject_id) REFERENCES subjects(sub_id),
FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
); 

-- Insert values in the table Classes
INSERT INTO Classes(class_id,class_name,subject_id,teacher_id) VALUES
(),
(),
();

-- Select all vlaues from this table.
SELECT * FROM Classes;

-- Create a table Enrollments
CREATE TABLE Enrollments(
enroll_id INT PRIMARY KEY,
student_id INT,
class_id INT,
enroll_date DATE,
FOREIGN KEY (student_id) REFERENCES Stud_ents(stud_id),
FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- Insert values in the table Enrollments
INSERT INTO Enrollments(enroll_id,student_id,class_id,enroll_date) VALUES
(41 , 10 , 112 , STR_TO_DATE('01-03-2024', '%d-%m-%Y')),
(42 , 20 , 112 , STR_TO_DATE('01-03-2024', '%d-%m-%Y') ),
(43 , 30 , 111 , STR_TO_DATE('04-03-2024', '%d-%m-%Y')),
(44 , 40 , 112 , STR_TO_DATE('01-03-2024', '%d-%m-%Y')),
(45 , 50 , 113 , STR_TO_DATE('07-03-2024', '%d-%m-%Y')),
(46 , 60 , 113 , STR_TO_DATE('07-03-2024', '%d-%m-%Y')),
(47 , 70 , 112 , STR_TO_DATE('01-03-2024', '%d-%m-%Y')),
(48 , 80 , 111 , STR_TO_DATE('04-03-2024', '%d-%m-%Y')),
(49 , 90 , 111 , STR_TO_DATE('04-03-2024', '%d-%m-%Y')),
(50 , 100 , 112 , STR_TO_DATE('01-03-2024', '%d-%m-%Y'));

-- Select all vlaues from this table.
SELECT * FROM Enrollments;

-- Create a table Attendance
CREATE TABLE Attendance(
attend_id INT PRIMARY KEY,
student_id INT,
class_id INT,
date DATE,
status VARCHAR(10),
FOREIGN KEY (student_id) REFERENCES Stud_ents(stud_id),
FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- Insert values in the table Attendance
INSERT INTO Attendance(attend_id,student_id,class_id,date,status) VALUES
(1 , 10 , 112 ,STR_TO_DATE('15-03-2024', '%d-%m-%Y'), 'Present'),
(2 , 20 , 112 , STR_TO_DATE('15-03-2024', '%d-%m-%Y') , 'Present'),
(3 , 30 , 111 , STR_TO_DATE('15-03-2024', '%d-%m-%Y') , 'Present'),
(4 , 40 , 112 , STR_TO_DATE('15-03-2024', '%d-%m-%Y') , 'Absent'),
(5 , 50 , 113 , STR_TO_DATE('15-03-2024', '%d-%m-%Y') , 'Present'),
(6 , 60 , 113 , STR_TO_DATE('15-03-2024', '%d-%m-%Y') , 'Present'),
(7 , 70 , 112 , STR_TO_DATE('15-03-2024', '%d-%m-%Y') , 'Present'),
(8 , 80 , 111 , STR_TO_DATE('15-03-2024', '%d-%m-%Y') , 'Present'),
(9 , 90 , 111 , STR_TO_DATE('15-03-2024', '%d-%m-%Y') , 'Absent'),
(10 , 100 , 112 , STR_TO_DATE('15-03-2024', '%d-%m-%Y') , 'Absent');

-- Select all vlaues from this table.
SELECT * FROM Attendance;

-- Create a table Grades
CREATE TABLE Grades(
grade_id INT PRIMARY KEY,
student_id INT,
class_id INT,
grade VARCHAR(2),
grade_date DATE,
FOREIGN KEY (student_id) REFERENCES Stud_ents(stud_id),
FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- Insert values in the table Grades
INSERT INTO Grades(grade_id,student_id,class_id,grade,grade_date) VALUES 
(121 , 10 , 112 , 'A' , STR_TO_DATE('20-04-2024', '%d-%m-%Y')),
(122 , 20 , 112 , 'A' , STR_TO_DATE('20-04-2024', '%d-%m-%Y')),
(123 , 30 , 111 , 'B' , STR_TO_DATE('20-04-2024', '%d-%m-%Y')),
(124 , 40 , 112 , 'A' , STR_TO_DATE('20-04-2024', '%d-%m-%Y')),
(125 , 50 , 113 , 'B' , STR_TO_DATE('20-04-2024', '%d-%m-%Y')),
(126 , 60 , 113 , 'A' , STR_TO_DATE('20-04-2024', '%d-%m-%Y')),
(127 , 70 , 112 , 'C' , STR_TO_DATE('20-04-2024', '%d-%m-%Y')),
(128 , 80 , 111 , 'A' , STR_TO_DATE('20-04-2024', '%d-%m-%Y')),
(129 , 90 , 111 , 'C' , STR_TO_DATE('20-04-2024', '%d-%m-%Y')),
(130 , 100 , 112 , 'B' , STR_TO_DATE('20-04-2024', '%d-%m-%Y'));

-- Select all vlaues from this table.
SELECT * FROM Grades;

-- What are the name of the student with ID 10, the names of the classes they are enrolled in, and the names of the teachers teaching those classes?
SELECT s.stud_name, c.class_name, t.teacher_name AS teacher_name
FROM Stud_ents s
JOIN Enrollments e ON s.stud_id = e.student_id
JOIN Classes c ON e.class_id = c.class_id
JOIN Teachers t ON c.teacher_id = t.teacher_id
WHERE s.stud_id = 10;

-- What are the attendance records for class ID 112, including the date, student names, and their attendance status?
SELECT a.date, s.stud_name, a.status
FROM Attendance a
JOIN Stud_ents s ON a.student_id = s.stud_id
WHERE a.class_id = 112;

--What are the grades, class names, grade dates, and student ID for the student with ID 10?
SELECT g.grade, c.class_name, g.grade_date, g.student_id
FROM Grades g
JOIN Classes c ON g.class_id = c.class_id
WHERE g.student_id = 10;

--Which teachers are teaching which classes? 
SELECT t.teacher_name, c.class_name
FROM Teachers t
JOIN Classes c ON t.teacher_id = c.teacher_id;

--What is the average grade for each class , and group by class.
SELECT c.class_name, AVG(g.grade) AS average_grade
FROM Grades g
JOIN Classes c ON g.class_id = c.class_id
GROUP BY c.class_name;

--How many students are enrolled in each class? 
SELECT c.class_name, COUNT(e.student_id) AS number_of_students
FROM Classes c
JOIN Enrollments e ON c.class_id = e.class_id
GROUP BY c.class_name;

--Retrieves the IDs of students who have been absent.  
SELECT s.stud_name
FROM Stud_ents s
WHERE s.stud_id NOT IN (
    SELECT student_id
    FROM Attendance
    WHERE status = 'Absent'
);

--Retrieves the IDs of students who have been present.  
SELECT s.stud_name
FROM Stud_ents s
WHERE s.stud_id NOT IN (
    SELECT student_id
    FROM Attendance
    WHERE status = 'Present'
);



























