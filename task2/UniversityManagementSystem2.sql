-- DROP DATABASE IF EXISTS UniversityManagementSystem;

-- -- Create database
-- CREATE DATABASE UniversityManagementSystem;
-- USE UniversityManagementSystem;



-- -- TABLE 1: DEPARTMENTS

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



-- -- TABLE 2: PROFESSORS

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



-- -- TABLE 3: STUDENTS

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



-- -- TABLE 4: COURSES

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



-- -- TABLE 5: ENROLLMENTS

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



-- -- TABLE 6: ASSIGNMENTS

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



-- -- TABLE 7: GRADES

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


-- -- ADD FOREIGN KEY FOR HEAD PROFESSOR


-- ALTER TABLE DEPARTMENTS
-- ADD CONSTRAINT fk_dept_head_professor FOREIGN KEY (HeadProfessorID) 
--     REFERENCES PROFESSORS(ProfessorID) 
--     ON DELETE SET NULL 
--     ON UPDATE CASCADE;


-- TASK 2: PRACTICE 1: INSERT


-- INSERT INTO DEPARTMENTS (DepartmentName, Building, Budget) VALUES
-- ('Computer Science', 'Tech Building A', 500000.00),
-- ('Mathematics', 'Science Hall B', 350000.00),
-- ('Physics', 'Science Hall C', 450000.00),
-- ('Business Administration', 'Business Complex', 600000.00),
-- ('English Literature', 'Arts Building', 300000.00);



-- INSERT INTO PROFESSORS (FirstName, LastName, Email, Phone, HireDate, Salary, DepartmentID) VALUES
-- ('John', 'Smith', 'john.smith@university.edu', '555-0101', '2015-08-15', 85000.00, 1),
-- ('Sarah', 'Johnson', 'sarah.johnson@university.edu', '555-0102', '2016-01-10', 82000.00, 1),
-- ('Michael', 'Davis', 'michael.davis@university.edu', '555-0103', '2014-09-01', 78000.00, 2),
-- ('Emily', 'Wilson', 'emily.wilson@university.edu', '555-0104', '2017-03-20', 80000.00, 3),
-- ('Robert', 'Brown', 'robert.brown@university.edu', '555-0105', '2013-07-15', 90000.00, 4);



-- -- Update Departments with Head Professors
-- UPDATE DEPARTMENTS SET HeadProfessorID = 1 WHERE DepartmentID = 1;
-- UPDATE DEPARTMENTS SET HeadProfessorID = 2 WHERE DepartmentID = 2;
-- UPDATE DEPARTMENTS SET HeadProfessorID = 3 WHERE DepartmentID = 3;
-- UPDATE DEPARTMENTS SET HeadProfessorID = 4 WHERE DepartmentID = 4;


-- INSERT INTO STUDENTS (FirstName, LastName, Email, Phone, DateOfBirth, EnrollmentDate, DepartmentID) VALUES
-- ('Alice', 'Anderson', 'alice.anderson@student.edu', '555-1001', '2003-05-15', '2021-09-01', 1),
-- ('Bob', 'Martinez', 'bob.martinez@student.edu', '555-1002', '2002-11-20', '2021-09-01', 1),
-- ('Carol', 'Taylor', 'carol.taylor@student.edu', '555-1003', '2003-07-10', '2021-09-01', 2),
-- ('David', 'White', 'david.white@student.edu', '555-1004', '2003-03-25', '2022-01-15', 3),
-- ('Emma', 'Garcia', 'emma.garcia@student.edu', '555-1005', '2002-09-30', '2021-09-01', 4),
-- ('Frank', 'Lopez', 'frank.lopez@student.edu', '555-1006', '2003-12-08', '2021-09-01', 1),
-- ('Grace', 'Lee', 'grace.lee@student.edu', '555-1007', '2002-08-17', '2022-01-15', 2),
-- ('Henry', 'Clark', 'henry.clark@student.edu', '555-1008', '2003-02-28', '2021-09-01', 3);



-- INSERT INTO COURSES (CourseName, CourseCode, Credits, Description, DepartmentID, ProfessorID, Semester, Year, MaxStudents) VALUES
-- ('Introduction to Programming', 'CS101', 3, 'Basic programming concepts using Python', 1, 1, 'Fall', 2024, 40),
-- ('Data Structures', 'CS201', 4, 'Advanced data structures and algorithms', 1, 2, 'Spring', 2025, 35),
-- ('Calculus I', 'MATH101', 4, 'Differential and integral calculus', 2, 3, 'Fall', 2024, 50),
-- ('General Physics', 'PHYS101', 4, 'Classical mechanics and thermodynamics', 3, 4, 'Fall', 2024, 45),
-- ('Business Management', 'BUS101', 3, 'Fundamentals of business administration', 4, 5, 'Spring', 2025, 40),
-- ('Database Systems', 'CS301', 3, 'Database design and SQL', 1, 1, 'Spring', 2025, 30),
-- ('Linear Algebra', 'MATH201', 3, 'Vectors, matrices, and linear transformations', 2, 3, 'Spring', 2025, 40);

-- INSERT INTO ENROLLMENTS (StudentID, CourseID, EnrollmentDate, Semester, Year, Status, Grade) VALUES
-- (1, 1, '2024-08-20', 'Fall', 2024, 'Completed', 'A'),
-- (1, 3, '2024-08-20', 'Fall', 2024, 'Completed', 'B+'),
-- (2, 1, '2024-08-20', 'Fall', 2024, 'Completed', 'A-'),
-- (2, 2, '2025-01-10', 'Spring', 2025, 'Enrolled', NULL),
-- (3, 3, '2024-08-20', 'Fall', 2024, 'Enrolled', NULL),
-- (4, 4, '2024-08-20', 'Fall', 2024, 'Completed', 'B'),
-- (5, 5, '2025-01-10', 'Spring', 2025, 'Enrolled', NULL),
-- (6, 1, '2024-08-20', 'Fall', 2024, 'Completed', 'B+'),
-- (7, 3, '2024-08-20', 'Fall', 2024, 'Completed', 'A-'),
-- (8, 4, '2024-08-20', 'Fall', 2024, 'Enrolled', NULL);

-- INSERT INTO ASSIGNMENTS (CourseID, Title, Description, DueDate, MaxPoints, AssignmentType) VALUES
-- (1, 'Python Basics', 'Complete exercises 1-10 from textbook', '2024-09-15 23:59:00', 100, 'Homework'),
-- (1, 'Midterm Exam', 'Covers chapters 1-5', '2024-10-20 14:00:00', 150, 'Midterm'),
-- (1, 'Final Project', 'Build a complete Python application', '2024-12-10 23:59:00', 200, 'Project'),
-- (2, 'Binary Tree Implementation', 'Implement AVL tree in Java', '2025-02-28 23:59:00', 100, 'Project'),
-- (3, 'Derivatives Quiz', 'Quiz on derivative rules', '2024-09-25 10:00:00', 50, 'Quiz'),
-- (3, 'Integration Assignment', 'Solve integration problems', '2024-11-15 23:59:00', 100, 'Homework'),
-- (4, 'Physics Lab 1', 'Pendulum motion experiment', '2024-10-05 17:00:00', 75, 'Lab'),
-- (4, 'Midterm Exam', 'Covers mechanics', '2024-11-01 14:00:00', 150, 'Midterm');

-- INSERT INTO GRADES (EnrollmentID, AssignmentID, PointsEarned, SubmissionDate, Feedback, IsLate) VALUES
-- (1, 1, 95.00, '2024-09-14 20:30:00', 'Excellent work! Clean code and well-commented.', FALSE),
-- (1, 2, 142.00, '2024-10-20 14:00:00', 'Strong understanding of concepts.', FALSE),
-- (1, 3, 188.00, '2024-12-09 22:15:00', 'Outstanding final project!', FALSE),
-- (3, 1, 88.00, '2024-09-15 23:45:00', 'Good effort, minor syntax errors.', FALSE),
-- (3, 2, 135.00, '2024-10-20 14:00:00', 'Well done overall.', FALSE),
-- (5, 5, 47.00, '2024-09-25 10:00:00', 'Solid grasp of derivative concepts.', FALSE),
-- (6, 7, 68.00, '2024-10-06 18:30:00', 'Good experimental procedure, late submission.', TRUE),
-- (8, 1, 92.00, '2024-09-14 18:20:00', 'Very good work!', FALSE);




-- INSERT INTO STUDENTS (FirstName, LastName, Email, Phone, DateOfBirth, EnrollmentDate, DepartmentID) 
-- VALUES 
-- ('Ivan', 'Ivanov', 'ivan.ivanov@student.edu', '555-1009', '2003-01-20', '2022-09-01', 1);

-- INSERT INTO STUDENTS (FirstName, LastName, Email, DateOfBirth, DepartmentID) 
-- VALUES 
-- ('Jane', 'Doe', 'jane.doe@student.edu', '2002-06-05', 2);


-- INSERT INTO COURSES (CourseName, CourseCode, Credits, Description, DepartmentID, ProfessorID, Semester, Year) 
-- VALUES 
-- ('Introduction to Ethics', 'PHIL101', 3, 'An overview of moral philosophy', 5, NULL, 'Fall', 2024);

-- INSERT INTO ENROLLMENTS (StudentID, CourseID, Semester, Year, Status)
-- VALUES
-- (10, 7, 'Spring', 2025, 'Enrolled');

-- INSERT INTO ENROLLMENTS (StudentID, CourseID, Semester, Year, Status)
-- VALUES
-- (9, 6, 'Spring', 2025, 'Enrolled');


-- PRACTICE 2: UPDATE

-- UPDATE STUDENTS
-- SET Phone = '555-9999'
-- WHERE StudentID = 1;

-- UPDATE PROFESSORS
-- SET Salary = Salary * 1.05
-- WHERE DepartmentID = 1;


-- UPDATE ENROLLMENTS
-- SET 
--     Status = 'Withdrawn',
--     Grade = 'W'
-- WHERE 
--     StudentID = 3 AND CourseID = 3 AND Semester = 'Fall' AND Year = 2024;


-- PRACTICE 3: DELETE

-- DELETE FROM COURSES
-- WHERE CourseID = 8;


-- DELETE FROM PROFESSORS
-- WHERE ProfessorID = 4;
-- SELECT ProfessorID FROM COURSES WHERE CourseID = 4


-- DELETE FROM STUDENTS
-- WHERE StudentID = 9;


