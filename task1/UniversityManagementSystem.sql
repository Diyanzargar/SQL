-- DROP DATABASE IF EXISTS UniversityManagementSystem;

-- -- Create database
-- CREATE DATABASE UniversityManagementSystem;
-- USE UniversityManagementSystem;



-- TABLE 1: DEPARTMENTS

-- CREATE TABLE DEPARTMENTS (
--     DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
--     DepartmentName VARCHAR(100) NOT NULL UNIQUE,
--     Building VARCHAR(50),
--     Budget DECIMAL(15, 2) CHECK (Budget >= 0),
--     HeadProfessorID INT,
--     CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--     CONSTRAINT chk_dept_name_length CHECK (LENGTH(DepartmentName) >= 3)
-- );



-- TABLE 2: PROFESSORS

-- CREATE TABLE PROFESSORS (
--     ProfessorID INT AUTO_INCREMENT PRIMARY KEY,
--     FirstName VARCHAR(50) NOT NULL,
--     LastName VARCHAR(50) NOT NULL,
--     Email VARCHAR(100) NOT NULL UNIQUE,
--     Phone VARCHAR(15),
--     HireDate DATE NOT NULL,
--     Salary DECIMAL(10, 2) CHECK (Salary > 0),
--     DepartmentID INT,
--     IsActive BOOLEAN DEFAULT TRUE,
--     CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--     CONSTRAINT fk_prof_department FOREIGN KEY (DepartmentID) 
--         REFERENCES DEPARTMENTS(DepartmentID) 
--         ON DELETE SET NULL 
--         ON UPDATE CASCADE,
--     CONSTRAINT chk_email_format CHECK (Email LIKE '%@%.%')
-- );



-- TABLE 3: STUDENTS

-- CREATE TABLE STUDENTS (
-- 	StudentID INT auto_increment primary key,
--     FirstName varchar(50) not null,
--     LastName varchar(50) not null,
--     Email varchar(100) not null UNIQUE,
--     Phone VARCHAR(15),
--     DateOfBirth DATE NOT NULL,
--     EnrollmentDate DATE NOT NULL DEFAULT (CURDATE()),
--     DepartmentID INT,
--     IsActive BOOLEAN DEFAULT TRUE,
--     CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--     CONSTRAINT fk_student_department FOREIGN KEY (DepartmentID) 
--         REFERENCES DEPARTMENTS(DepartmentID) 
--         ON DELETE SET NULL 
--         ON UPDATE CASCADE,
--     CONSTRAINT chk_student_email CHECK (Email LIKE '%@%.%'));



-- TABLE 4: COURSES

-- CREATE TABLE COURSES (
--     CourseID INT AUTO_INCREMENT PRIMARY KEY,
--     CourseName VARCHAR(100) NOT NULL,
--     CourseCode VARCHAR(20) NOT NULL UNIQUE,
--     Credits INT NOT NULL CHECK (Credits BETWEEN 1 AND 6),
--     Description TEXT,
--     DepartmentID INT,
--     ProfessorID INT,
--     Semester ENUM('Fall', 'Spring', 'Summer') NOT NULL,
--     Year INT NOT NULL CHECK (Year >= 2000),
--     MaxStudents INT DEFAULT 30 CHECK (MaxStudents > 0),
--     IsActive BOOLEAN DEFAULT TRUE,
--     CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--     CONSTRAINT fk_course_department FOREIGN KEY (DepartmentID) 
--         REFERENCES DEPARTMENTS(DepartmentID) 
--         ON DELETE SET NULL 
--         ON UPDATE CASCADE,
--     CONSTRAINT fk_course_professor FOREIGN KEY (ProfessorID) 
--         REFERENCES PROFESSORS(ProfessorID) 
--         ON DELETE SET NULL 
--         ON UPDATE CASCADE,
--     CONSTRAINT uk_course_semester_year UNIQUE (CourseCode, Semester, Year)
-- );



-- TABLE 5: ENROLLMENTS

-- CREATE TABLE ENROLLMENTS (
--     EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
--     StudentID INT NOT NULL,
--     CourseID INT NOT NULL,
--     EnrollmentDate DATE NOT NULL DEFAULT (CURDATE()),
--     Semester ENUM('Fall', 'Spring', 'Summer') NOT NULL,
--     Year INT NOT NULL CHECK (Year >= 2000),
--     Grade CHAR(2),
--     Status ENUM('Enrolled', 'Completed', 'Dropped', 'Withdrawn') DEFAULT 'Enrolled',
--     CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--     CONSTRAINT fk_enroll_student FOREIGN KEY (StudentID) 
--         REFERENCES STUDENTS(StudentID) 
--         ON DELETE CASCADE 
--         ON UPDATE CASCADE,
--     CONSTRAINT fk_enroll_course FOREIGN KEY (CourseID) 
--         REFERENCES COURSES(CourseID) 
--         ON DELETE CASCADE 
--         ON UPDATE CASCADE,
--     CONSTRAINT uk_student_course_semester UNIQUE (StudentID, CourseID, Semester, Year),
--     CONSTRAINT chk_grade CHECK (Grade IN ('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D', 'F', 'I', 'W'))
-- );



-- TABLE 6: ASSIGNMENTS

-- CREATE TABLE ASSIGNMENTS (
--     AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
--     CourseID INT NOT NULL,
--     Title VARCHAR(200) NOT NULL,
--     Description TEXT,
--     DueDate DATETIME NOT NULL,
--     MaxPoints INT NOT NULL CHECK (MaxPoints > 0),
--     AssignmentType ENUM('Homework', 'Quiz', 'Midterm', 'Final', 'Project', 'Lab') NOT NULL,
--     CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--     CONSTRAINT fk_assignment_course FOREIGN KEY (CourseID) 
--         REFERENCES COURSES(CourseID) 
--         ON DELETE CASCADE 
--         ON UPDATE CASCADE
-- 	);



-- TABLE 7: GRADES

-- CREATE TABLE GRADES (
--     GradeID INT AUTO_INCREMENT PRIMARY KEY,
--     EnrollmentID INT NOT NULL,
--     AssignmentID INT NOT NULL,
--     PointsEarned DECIMAL(5, 2) NOT NULL CHECK (PointsEarned >= 0),
--     SubmissionDate DATETIME,
--     Feedback TEXT,
--     IsLate BOOLEAN DEFAULT FALSE,
--     CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--     CONSTRAINT fk_grade_enrollment FOREIGN KEY (EnrollmentID) 
--         REFERENCES ENROLLMENTS(EnrollmentID) 
--         ON DELETE CASCADE 
--         ON UPDATE CASCADE,
--     CONSTRAINT fk_grade_assignment FOREIGN KEY (AssignmentID) 
--         REFERENCES ASSIGNMENTS(AssignmentID) 
--         ON DELETE CASCADE 
--         ON UPDATE CASCADE,
--     CONSTRAINT uk_enrollment_assignment UNIQUE (EnrollmentID, AssignmentID)
-- );


-- ADD FOREIGN KEY FOR HEAD PROFESSOR


-- ALTER TABLE DEPARTMENTS
-- ADD CONSTRAINT fk_dept_head_professor FOREIGN KEY (HeadProfessorID) 
--     REFERENCES PROFESSORS(ProfessorID) 
--     ON DELETE SET NULL 
--     ON UPDATE CASCADE;


