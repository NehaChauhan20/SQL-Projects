CREATE DATABASE Employee_Payroll_Management_System ;
USE Employee_Payroll_Management_System;

CREATE TABLE Employee(
Employee_Id INT PRIMARY KEY,
First_Name VARCHAR(25),
Last_Name VARCHAR(25),
Hire_Date DATE,
City VARCHAR(15),
State VARCHAR(15)
);

CREATE TABLE Department(
Dept_Id INT PRIMARY KEY,
Dept_Name VARCHAR(50)
);

ALTER TABLE department MODIFY Dept_Name VARCHAR(50);

CREATE TABLE Salary(
Salary_Id INT,
Gross_Salary INT,
Hourly_Pay INT,
State_Tax INT,
Federal_Tax INT,
Emp_Id INT ,
FOREIGN KEY (Emp_Id) REFERENCES Employee(Employee_Id)
);

CREATE TABLE Attendance(
Attendance_Id INT PRIMARY KEY,
Hours_Worked INT   
);

CREATE TABLE Employee_Attendance(
Employee_Id INT,
Attendance_Id INT,
FOREIGN KEY (Employee_Id) REFERENCES Employee (Employee_Id),
FOREIGN KEY (Attendance_Id) REFERENCES Attendance (Attendance_Id)
);

CREATE TABLE Leavee(
Leave_Id INT,
Employee_id INT,
Leave_Date DATE,
FOREIGN KEY (Employee_id) REFERENCES Employee (Employee_Id)
);














