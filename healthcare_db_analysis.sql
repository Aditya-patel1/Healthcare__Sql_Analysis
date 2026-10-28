/*
   HEALTHCARE DATABASE ANALYSIS (SQL)
   Author      : Balvant Singh
   Description : A relational healthcare database built to
                 practice SQL JOINs, GROUP BY, HAVING, Subqueries,
                 and Window Functions for reporting and business insights.
   Dialect     : MySQL
*/


-- ============================================================
-- SECTION 1: DATABASE & TABLE CREATION
-- ============================================================

CREATE DATABASE HealthcareDB;
USE HealthcareDB;

-- Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    FloorNo INT
);

-- Doctors Table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(50),
    DepartmentID INT,
    Experience INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Patients Table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    City VARCHAR(40),
    Phone VARCHAR(15)
);

-- Appointments Table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);


-- ============================================================
-- SECTION 2: DATA INSERTION
-- ============================================================

-- Departments Data
INSERT INTO Departments VALUES
(101,'Cardiology',2),
(102,'Neurology',3),
(103,'Orthopedics',4),
(104,'Dermatology',5),
(105,'Pediatrics',2),
(106,'ENT',1),
(107,'Oncology',6),
(108,'General Medicine',1),
(109,'Urology',4),
(110,'Emergency',0);

-- Doctors Data
INSERT INTO Doctors VALUES
(201,'Dr. Amit',101,10,120000),
(202,'Dr. Neha',102,8,100000),
(203,'Dr. Rahul',103,12,150000),
(204,'Dr. Priya',104,7,90000),
(205,'Dr. Mohit',105,5,85000),
(206,'Dr. Ankit',106,15,160000),
(207,'Dr. Riya',107,9,130000),
(208,'Dr. Aman',108,4,70000),
(209,'Dr. Sneha',109,11,140000),
(210,'Dr. Arjun',110,20,180000),
(211,'Dr. Kavita',101,6,92000),
(212,'Dr. Rohit',102,14,155000),
(213,'Dr. Simran',103,9,128000),
(214,'Dr. Vivek',104,3,65000),
(215,'Dr. Pooja',105,8,99000),
(216,'Dr. Kunal',106,13,145000),
(217,'Dr. Sonia',107,10,138000),
(218,'Dr. Deepak',108,7,95000),
(219,'Dr. Meera',109,5,87000),
(220,'Dr. Nitin',110,16,170000);

-- Patients Data
INSERT INTO Patients VALUES
(301,'Aarav','Male',25,'Lucknow','9000000001'),
(302,'Ananya','Female',22,'Kanpur','9000000002'),
(303,'Rohan','Male',34,'Delhi','9000000003'),
(304,'Priya','Female',29,'Noida','9000000004'),
(305,'Rahul','Male',40,'Agra','9000000005'),
(306,'Sneha','Female',31,'Lucknow','9000000006'),
(307,'Karan','Male',45,'Delhi','9000000007'),
(308,'Nisha','Female',26,'Kanpur','9000000008'),
(309,'Amit','Male',37,'Noida','9000000009'),
(310,'Pooja','Female',24,'Lucknow','9000000010'),
(311,'Ajay','Male',28,'Delhi','9000000011'),
(312,'Komal','Female',36,'Agra','9000000012'),
(313,'Ritik','Male',27,'Lucknow','9000000013'),
(314,'Sonia','Female',33,'Kanpur','9000000014'),
(315,'Mohit','Male',42,'Delhi','9000000015'),
(316,'Neha','Female',21,'Noida','9000000016'),
(317,'Vikas','Male',30,'Lucknow','9000000017'),
(318,'Kajal','Female',39,'Agra','9000000018'),
(319,'Abhishek','Male',46,'Delhi','9000000019'),
(320,'Riya','Female',20,'Kanpur','9000000020'),
(321,'Tarun','Male',32,'Lucknow','9000000021'),
(322,'Isha','Female',41,'Delhi','9000000022'),
(323,'Arjun','Male',23,'Agra','9000000023'),
(324,'Payal','Female',35,'Lucknow','9000000024'),
(325,'Deepak','Male',44,'Noida','9000000025'),
(326,'Anjali','Female',27,'Delhi','9000000026'),
(327,'Harsh','Male',38,'Kanpur','9000000027'),
(328,'Muskan','Female',29,'Lucknow','9000000028'),
(329,'Nitin','Male',48,'Agra','9000000029'),
(330,'Shreya','Female',26,'Noida','9000000030'),
(331,'Yash','Male',24,'Lucknow','9000000031'),
(332,'Aditi','Female',31,'Delhi','9000000032'),
(333,'Manish','Male',36,'Kanpur','9000000033'),
(334,'Divya','Female',28,'Lucknow','9000000034'),
(335,'Saurabh','Male',40,'Agra','9000000035'),
(336,'Khushi','Female',22,'Noida','9000000036'),
(337,'Gaurav','Male',43,'Delhi','9000000037'),
(338,'Palak','Female',34,'Lucknow','9000000038'),
(339,'Rakesh','Male',39,'Kanpur','9000000039'),
(340,'Tanya','Female',25,'Delhi','9000000040'),
(341,'Shivam','Male',29,'Lucknow','9000000041'),
(342,'Ritu','Female',37,'Agra','9000000042'),
(343,'Vivek','Male',33,'Noida','9000000043'),
(344,'Megha','Female',27,'Delhi','9000000044'),
(345,'Akash','Male',45,'Lucknow','9000000045'),
(346,'Sakshi','Female',30,'Kanpur','9000000046'),
(347,'Lokesh','Male',41,'Agra','9000000047'),
(348,'Jyoti','Female',24,'Lucknow','9000000048'),
(349,'Hemant','Male',35,'Delhi','9000000049'),
(350,'Nandini','Female',32,'Noida','9000000050');

-- Appointments Data
INSERT INTO Appointments VALUES
(401,301,201,'2026-07-01','Completed'),
(402,302,202,'2026-07-01','Completed'),
(403,303,203,'2026-07-02','Cancelled'),
(404,304,204,'2026-07-02','Completed'),
(405,305,205,'2026-07-03','Pending'),
(406,306,206,'2026-07-03','Completed'),
(407,307,207,'2026-07-04','Completed'),
(408,308,208,'2026-07-04','Pending'),
(409,309,209,'2026-07-05','Completed'),
(410,310,210,'2026-07-05','Completed'),
(411,311,211,'2026-07-06','Completed'),
(412,312,212,'2026-07-06','Cancelled'),
(413,313,213,'2026-07-07','Completed'),
(414,314,214,'2026-07-07','Pending'),
(415,315,215,'2026-07-08','Completed'),
(416,316,216,'2026-07-08','Completed'),
(417,317,217,'2026-07-09','Completed'),
(418,318,218,'2026-07-09','Pending'),
(419,319,219,'2026-07-10','Completed'),
(420,320,220,'2026-07-10','Completed'),
(421,321,201,'2026-07-11','Pending'),
(422,322,202,'2026-07-11','Completed'),
(423,323,203,'2026-07-12','Completed'),
(424,324,204,'2026-07-12','Cancelled'),
(425,325,205,'2026-07-13','Completed'),
(426,326,206,'2026-07-13','Pending'),
(427,327,207,'2026-07-14','Completed'),
(428,328,208,'2026-07-14','Completed'),
(429,329,209,'2026-07-15','Completed'),
(430,330,210,'2026-07-15','Pending'),
(431,331,211,'2026-07-16','Completed'),
(432,332,212,'2026-07-16','Completed'),
(433,333,213,'2026-07-17','Pending'),
(434,334,214,'2026-07-17','Completed'),
(435,335,215,'2026-07-18','Completed'),
(436,336,216,'2026-07-18','Cancelled'),
(437,337,217,'2026-07-19','Completed'),
(438,338,218,'2026-07-19','Pending'),
(439,339,219,'2026-07-20','Completed'),
(440,340,220,'2026-07-20','Completed'),
(441,341,201,'2026-07-21','Completed'),
(442,342,202,'2026-07-21','Pending'),
(443,343,203,'2026-07-22','Completed'),
(444,344,204,'2026-07-22','Completed'),
(445,345,205,'2026-07-23','Cancelled'),
(446,346,206,'2026-07-23','Completed'),
(447,347,207,'2026-07-24','Pending'),
(448,348,208,'2026-07-24','Completed'),
(449,349,209,'2026-07-25','Completed'),
(450,350,210,'2026-07-25','Completed');


-- ============================================================
-- SECTION 3: BASIC RETRIEVAL & FILTERING
-- ============================================================

-- All doctors
SELECT * FROM Doctors;

-- All departments
SELECT * FROM Departments;

-- Female patients
SELECT * FROM Patients
WHERE Gender = 'Female';

-- Doctors earning more than 100000
SELECT * FROM Doctors
WHERE Salary > 100000;

-- Doctors earning more than 120000
SELECT * FROM Doctors
WHERE Salary > 120000;

-- Doctors with more than 10 years of experience
SELECT * FROM Doctors
WHERE Experience > 10;

-- Patients older than 35
SELECT * FROM Patients
WHERE Age > 35;

-- Doctors sorted by salary (highest first)
SELECT * FROM Doctors
ORDER BY Salary DESC;


-- ============================================================
-- SECTION 4: AGGREGATE FUNCTIONS
-- ============================================================

-- Total number of doctors
SELECT COUNT(*) AS TotalDoctors
FROM Doctors;

-- Highest doctor salary
SELECT MAX(Salary) AS MaxSalary
FROM Doctors;

-- Lowest doctor salary
SELECT MIN(Salary) AS MinSalary
FROM Doctors;

-- Average doctor salary
SELECT AVG(Salary) AS AvgSalary
FROM Doctors;

-- Total salary paid to all doctors
SELECT SUM(Salary) AS TotalSalary
FROM Doctors;


-- ============================================================
-- SECTION 5: GROUP BY & HAVING
-- ============================================================

-- Patient count by city
SELECT City, COUNT(*) AS TotalPatients
FROM Patients
GROUP BY City;

-- Patient count by gender
SELECT Gender, COUNT(*) AS TotalPatients
FROM Patients
GROUP BY Gender;

-- Average patient age by city
SELECT City, AVG(Age) AS AvgAge
FROM Patients
GROUP BY City;

-- Doctor count per department
SELECT DepartmentID, COUNT(*) AS TotalDoctors
FROM Doctors
GROUP BY DepartmentID;

-- Average salary per department
SELECT DepartmentID, AVG(Salary) AS AvgSalary
FROM Doctors
GROUP BY DepartmentID;

-- Highest salary per department
SELECT DepartmentID, MAX(Salary) AS MaxSalary
FROM Doctors
GROUP BY DepartmentID;

-- Departments having more than 1 doctor
SELECT DepartmentID, COUNT(*) AS TotalDoctors
FROM Doctors
GROUP BY DepartmentID
HAVING COUNT(*) > 1;

-- Departments where average salary exceeds 120000
SELECT DepartmentID, AVG(Salary) AS AvgSalary
FROM Doctors
GROUP BY DepartmentID
HAVING AVG(Salary) > 120000;

-- Appointment count by status
SELECT Status, COUNT(*) AS TotalAppointments
FROM Appointments
GROUP BY Status;


-- ============================================================
-- SECTION 6: JOINS
-- ============================================================

-- Doctors working in Cardiology department
SELECT d.DoctorID, d.DoctorName, dep.DepartmentName
FROM Doctors d
INNER JOIN Departments dep ON d.DepartmentID = dep.DepartmentID
WHERE dep.DepartmentName = 'Cardiology';

-- Doctor name with department name
SELECT d.DoctorName, dep.DepartmentName
FROM Doctors d
INNER JOIN Departments dep ON d.DepartmentID = dep.DepartmentID;

-- Doctor name, department name and floor number
SELECT d.DoctorName, dep.DepartmentName, dep.FloorNo
FROM Doctors d
INNER JOIN Departments dep ON d.DepartmentID = dep.DepartmentID;

-- Doctor name, department name, experience and salary (sorted)
SELECT d.DoctorName, dep.DepartmentName, d.Experience, d.Salary
FROM Doctors d
INNER JOIN Departments dep ON d.DepartmentID = dep.DepartmentID
ORDER BY d.Salary DESC;

-- All departments with their doctors, including departments with no doctors
SELECT dep.DepartmentName, d.DoctorName
FROM Departments dep
LEFT JOIN Doctors d ON dep.DepartmentID = d.DepartmentID;

-- Full outer join simulation: every department + every doctor, matched or not
SELECT *
FROM Departments dep
RIGHT JOIN Doctors d ON dep.DepartmentID = d.DepartmentID
UNION
SELECT *
FROM Departments dep
LEFT JOIN Doctors d ON dep.DepartmentID = d.DepartmentID;

-- Doctor-wise appointment listing
SELECT d.DoctorName, p.PatientName, a.AppointmentDate, a.Status
FROM Appointments a
INNER JOIN Doctors d ON a.DoctorID = d.DoctorID
INNER JOIN Patients p ON a.PatientID = p.PatientID;

-- Full appointment report across all four tables
SELECT
    a.AppointmentID,
    dep.DepartmentID,
    d.DoctorName,
    p.PatientName,
    p.City,
    a.Status,
    d.Salary,
    dep.DepartmentName,
    d.Experience,
    a.AppointmentDate
FROM Appointments a
INNER JOIN Doctors d ON a.DoctorID = d.DoctorID
INNER JOIN Patients p ON a.PatientID = p.PatientID
INNER JOIN Departments dep ON dep.DepartmentID = d.DepartmentID;


-- ============================================================
-- SECTION 7: SUBQUERIES
-- ============================================================

-- Doctor(s) with the highest salary
SELECT * FROM Doctors
WHERE Salary = (SELECT MAX(Salary) FROM Doctors);

-- Doctors earning above the average salary
SELECT * FROM Doctors
WHERE Salary > (SELECT AVG(Salary) FROM Doctors);

-- Average number of appointments handled per doctor
SELECT AVG(AppointmentCount) AS AvgAppointmentsPerDoctor
FROM (
    SELECT COUNT(*) AS AppointmentCount
    FROM Appointments
    GROUP BY DoctorID
) AS DoctorAppointmentCounts;


-- ============================================================
-- SECTION 8: WINDOW FUNCTIONS
-- ============================================================

-- Rank doctors by salary (ties share the same rank, next rank skips)
SELECT DoctorName, Salary,
       RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Doctors;

-- Dense rank doctors by salary (ties share the same rank, no gaps)
SELECT DoctorName, Salary,
       DENSE_RANK() OVER (ORDER BY Salary DESC) AS DenseSalaryRank
FROM Doctors;

-- Row number for each doctor ordered by salary
SELECT DoctorName, Salary,
       ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RowNum
FROM Doctors;
