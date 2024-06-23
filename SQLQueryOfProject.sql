CREATE DATABASE Course_Management_System;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255) NOT NULL
);

INSERT INTO Departments VALUES (1,'Computer Science');
INSERT INTO Departments VALUES(2, 'Mathematics');
INSERT INTO Departments VALUES (3, 'Physics');

SELECT *
from Departments 


CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    CONSTRAINT FK_Instructors_Departments FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Instructors VALUES (1, 'Mehwish', 'Shabeer', 1, 'Mehwish@gmail.com');
INSERT INTO Instructors VALUES(2, 'Javed', 'Iqbal', 2, 'Javed@gmail.com');
INSERT INTO Instructors VALUES(3, 'Farwa', 'Batool', 3, 'Farwa@gmail.com');


SELECT *
from  Instructors 

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    DepartmentID INT NOT NULL,
    Credits INT NOT NULL,
    InstructorID INT NOT NULL,
    CONSTRAINT FK_Courses_Departments FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    CONSTRAINT FK_Courses_Instructors FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits, InstructorID)
VALUES 
(1, 'Introduction to Programming', 1, 3, 1),
(2, 'Calculus I', 2, 4, 2),
(3, 'Physics I', 3, 4, 3);

SELECT *
from Courses 

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    DateOfBirth DATE,
    Email VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO Students VALUES (1, 'Areeba', 'seher', '2004-01-01', 'Reeba@example.com');
INSERT INTO Students VALUES(2, 'Bakhtawar', 'farooq', '2003-02-02', 'Bakht@example.com');
INSERT INTO Students VALUES(3, 'Wahab', 'Khan', '2004-08-25', 'Harib@example.com');



SELECT *
from Students

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    Grade CHAR(2),
    CONSTRAINT FK_Enrollments_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT FK_Enrollments_Courses FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments VALUES (1,1,1,'2024-01-10','A');
INSERT INTO Enrollments VALUES (2, 2, 2, '2024-01-15', 'B');
INSERT INTO Enrollments VALUES (2, 2, 2, '2024-01-15', 'B');



SELECT *
from Enrollments


SELECT 
    Students.StudentID,
    Students.FirstName,
    Students.LastName,
    Students.Email,
    Enrollments.CourseID,
    Enrollments.EnrollmentDate,
    Enrollments.Grade
FROM 
    Students
INNER JOIN 
    Enrollments
ON 
    Students.StudentID = Enrollments.StudentID;
	--- inner join along with courses
	SELECT 
    Students.StudentID,
    Students.FirstName,
    Students.LastName,
    Students.Email,
    Courses.CourseName,
    Enrollments.EnrollmentDate,
    Enrollments.Grade
FROM 
    Students
INNER JOIN 
    Enrollments
ON 
    Students.StudentID = Enrollments.StudentID
INNER JOIN
    Courses
ON
    Enrollments.CourseID = Courses.CourseID;



	
 UPDATE Departments
 SET DepartmentName = 'Physics'
 where DepartmentName = 'Urdu';

