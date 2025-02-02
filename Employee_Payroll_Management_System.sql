-- Create a Databse
CREATE DATABASE Employee_Payroll_Management_System ;
USE Employee_Payroll_Management_System;

-- Create Table Employee
CREATE TABLE Employee(
Employee_Id INT PRIMARY KEY,
First_Name VARCHAR(25),
Last_Name VARCHAR(25),
Hire_Date DATE,
City VARCHAR(15),
State VARCHAR(15)
);

--Insert values in the table Employee
INSERT INTO Employee (Employee_Id, First_Name, Last_Name, Hire_Date, City, State) VALUES 
 (101, 'Hitesh', 'Chaudhary', STR_TO_DATE('23-03-2020', '%d-%m-%Y'), 'Panaji', 'Goa'),
 (102, 'Rajesh', 'Yadav', STR_TO_DATE('22-03-2021', '%d-%m-%Y'), 'Madhubani', 'Bihar'),
 (103, 'Saniya', 'Dixit', STR_TO_DATE('04-05-2020', '%d-%m-%Y'), 'Pune', 'Maharashtra'),
 (104, 'Alizeh', 'Khan', STR_TO_DATE('09-09-2020', '%d-%m-%Y'), 'Lucknow', 'UP'),
 (105, 'Neha', 'Chauhan', STR_TO_DATE('01-01-2023', '%d-%m-%Y'), 'New Delhi', 'Delhi'),
 (106, 'Muskan', 'Chauhan', STR_TO_DATE('27-01-2023', '%d-%m-%Y'), 'New Delhi', 'Delhi'),
 (107, 'Tarang', 'Bhuraria', STR_TO_DATE('19-02-2021', '%d-%m-%Y'), 'Alwar', 'Rajasthan'),
 (108, 'Sneha', 'Beniwal', STR_TO_DATE('20-02-2021', '%d-%m-%Y'), 'Meerut', 'UP'),
 (109, 'Sameer', 'Khan', STR_TO_DATE('15-03-2020', '%d-%m-%Y'), 'New Delhi', 'Delhi'),
 (110, 'Sameer', 'Maheshwari', STR_TO_DATE('26-04-2023', '%d-%m-%Y'), 'Ahmedabad', 'Gujarat');

-- Create Table Department
CREATE TABLE Department(
Dept_Id INT PRIMARY KEY,
Dept_Name VARCHAR(50)
);

--Insert values in the table Department
INSERT INTO Department (Dept_Id , Dept_Name) VALUES
 (001 , 'Human Resources'),
 (002 , 'Software Engeenier'),
 (003 , 'Data Analyst'),
 (004 , 'Buisness Intelligence'),
 (005 , 'Data Scientiest'),
 (006 , 'Quality Control');

ALTER TABLE department MODIFY Dept_Name VARCHAR(50);

-- Create Table Salary
CREATE TABLE Salary(
Salary_Id INT,
Gross_Salary INT,
Hourly_Pay INT,
State_Tax INT,
Federal_Tax INT,
Emp_Id INT ,
FOREIGN KEY (Emp_Id) REFERENCES Employee(Employee_Id)
);

--Insert values in the table Salary
INSERT INTO Salary (Salary_Id , Gross_Salary , Hourly_Pay , State_Tax , Federal_Tax , Emp_Id) VALUES 
 (1 , 57000 , 40 , 200 , 1000 , 101),
 (2 , 80000 , 50 , 500 , 1400 , 102),
 (3 , 60000 , 40 , 300 , 1200 , 103),
 (4 , 45000 , 30 , 150 , 900 , 104),
 (5 , 100000 , 60 , 400 , 1500 , 105),
 (6 , 65000 , 30 , 350 , 1300 , 106),
 (7 , 70000 , 40 , 200 , 1000 , 107),
 (8 , 75000 , 50 , 300 , 1200 , 108),
 (9 , 100000 , 60 , 500 , 1700 , 109),
 (10 , 60000 , 40 , 200 , 1400 , 110);

-- Create Table Attendance
CREATE TABLE Attendance(
Attendance_Id INT PRIMARY KEY,
Hours_Worked INT   
);

--Insert values in the table Attendance
 INSERT INTO Attendance (Attendance_Id , Hours_Worked) VALUES
 (90 , 10),
 (91 , 20),
 (92 , 30),
 (93 , 40),
 (94 , 45),
 (95 , 50),
 (96 , 55);

-- Create Table Employee_Attendance
CREATE TABLE Employee_Attendance(
Employee_Id INT,
Attendance_Id INT,
FOREIGN KEY (Employee_Id) REFERENCES Employee (Employee_Id),
FOREIGN KEY (Attendance_Id) REFERENCES Attendance (Attendance_Id)
);

--Insert values in the table Employee_Attendance
INSERT INTO Employee_Attendance (Employee_Id, Attendance_Id) VALUES
 (101 , 90),
 (102 , 96),
 (103 , 90),
 (104 , 92),
 (105 , 94),
 (106 , 91),
 (107 , 95),
 (108 , 93),
 (109 , 96),
 (110 , 92);

-- Create Table Leavee
CREATE TABLE Leavee(
Leave_Id INT,
Employee_id INT,
Leave_Date DATE,
FOREIGN KEY (Employee_id) REFERENCES Employee (Employee_Id)
);

--Insert values in the table Leavee
INSERT INTO Leavee (Leave_Id , Employee_id , Leave_Date) VALUES
 (40 , 101 ,  STR_TO_DATE('1-02-2024' ,'%d-%m-%Y') ),
 (41 , 102 ,  STR_TO_DATE('2-02-2024' ,'%d-%m-%Y') ),
 (42 , 103 , STR_TO_DATE('3-02-2024' ,'%d-%m-%Y') ),
 (43 , 104 , STR_TO_DATE('4-02-2024' ,'%d-%m-%Y') ),
 (44 , 105 , STR_TO_DATE('5-02-2024' ,'%d-%m-%Y') ),
 (45 , 106 , STR_TO_DATE('6-02-2024' ,'%d-%m-%Y') ),
 (46 , 107 , STR_TO_DATE('7-02-2024' ,'%d-%m-%Y') ),
 (47 , 108 , STR_TO_DATE('8-02-2024' ,'%d-%m-%Y') ),
 (48 , 109 , STR_TO_DATE('9-02-2024' ,'%d-%m-%Y') ),
 (49 , 110 , STR_TO_DATE('10-02-2024' ,'%d-%m-%Y') );
 
-- This Selects all the values from the tables.
 SELECT * FROM Employee;
 SELECT * FROM Department;
 SELECT * FROM Salary;
 SELECT * FROM Attendance;
 SELECT * FROM Employee_Attendance;
 SELECT * FROM Leavee;
 
-- Retrieve all records from both the Employee and Employee_Attendance tables, including those that do not have matching entries in the other table. 
 SELECT * FROM Employee AS Emp
 LEFT JOIN Employee_Attendance AS Atten
 ON Emp.Employee_Id = Atten.Employee_Id
 UNION
 SELECT * FROM Employee AS Emp
 RIGHT JOIN Employee_Attendance AS Atten
 ON Emp.Employee_Id = Atten.Employee_Id
  














