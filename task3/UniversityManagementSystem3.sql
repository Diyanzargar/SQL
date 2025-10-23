-- use universitymanagementsystem;

--  SELECT * FROM STUDENTS;

-- SELECT FirstName, LastName, Email, DepartmentID 
-- FROM STUDENTS;

-- SELECT * FROM PROFESSORS;

-- SELECT CourseName, CourseCode, Credits, Semester, Year 
-- FROM COURSES;

-- SELECT FirstName, LastName, Email , DepartmentID
-- FROM STUDENTS
-- WHERE DepartmentID = 1;

-- SELECT FirstName, LastName, Salary, DepartmentID
-- FROM PROFESSORS
-- WHERE Salary > 80000;

-- SELECT FirstName, LastName, Email, IsActive
-- FROM STUDENTS
-- WHERE IsActive = TRUE;

-- SELECT CourseName, CourseCode, Credits
-- FROM COURSES
-- WHERE Credits = 3;

-- SELECT StudentID, CourseID, Status, Grade
-- FROM ENROLLMENTS
-- WHERE Status = 'Completed';

-- SELECT FirstName, LastName, Email
-- FROM STUDENTS
-- WHERE DepartmentID = 1 AND IsActive = TRUE;

-- SELECT FirstName, LastName, Salary, HireDate
-- FROM PROFESSORS
-- WHERE Salary > 80000 AND HireDate > '2015-01-01';

-- SELECT FirstName, LastName, DepartmentID
-- FROM STUDENTS
-- WHERE DepartmentID = 1 OR DepartmentID = 2;

-- SELECT CourseName, CourseCode, Semester, Year
-- FROM COURSES
-- WHERE (Semester = 'Fall' AND Year = 2024)
--    OR (Semester = 'Spring' AND Year = 2025);

-- SELECT FirstName, LastName, Salary, DepartmentID
-- FROM PROFESSORS
-- WHERE Salary > 85000 OR DepartmentID = 1;

-- SELECT FirstName, LastName, DepartmentID
-- FROM STUDENTS
-- WHERE DepartmentID IN (1, 2, 3);

-- SELECT CourseName, CourseCode, Credits
-- FROM COURSES
-- WHERE Credits IN (3, 4);

-- SELECT StudentID, CourseID, Status, Grade
-- FROM ENROLLMENTS
-- WHERE Status IN ('Completed', 'Enrolled');

-- SELECT Title, AssignmentType, MaxPoints
-- FROM ASSIGNMENTS
-- WHERE AssignmentType IN ('Midterm', 'Final', 'Project');

-- SELECT FirstName, LastName, Email
-- FROM STUDENTS
-- WHERE FirstName LIKE 'A%';

-- SELECT FirstName, LastName, Email
-- FROM STUDENTS
-- WHERE Email LIKE '%garcia%';

-- SELECT FirstName, LastName, Email
-- FROM PROFESSORS
-- WHERE LastName LIKE '%son';

-- SELECT CourseName, CourseCode, Description
-- FROM COURSES
-- WHERE CourseName LIKE '%Introduction%';

-- SELECT FirstName, LastName, Phone
-- FROM STUDENTS
-- WHERE Phone LIKE '555-10%';

-- SELECT FirstName, LastName, Salary
-- FROM PROFESSORS
-- WHERE Salary BETWEEN 75000 AND 85000;

-- SELECT FirstName, LastName, DateOfBirth
-- FROM STUDENTS
-- WHERE DateOfBirth BETWEEN '2002-01-01' AND '2003-12-31';

-- SELECT CourseName, CourseCode, Credits
-- FROM COURSES
-- WHERE Credits BETWEEN 3 AND 4;

-- SELECT Title, MaxPoints, AssignmentType
-- FROM ASSIGNMENTS
-- WHERE MaxPoints BETWEEN 50 AND 100;

-- SELECT FirstName, LastName, Email
-- FROM STUDENTS
-- ORDER BY LastName;

-- SELECT FirstName, LastName, Salary
-- FROM PROFESSORS
-- ORDER BY Salary DESC;

-- SELECT CourseName, CourseCode, Credits
-- FROM COURSES
-- ORDER BY Credits DESC, CourseName ASC;

-- SELECT FirstName, LastName, EnrollmentDate
-- FROM STUDENTS
-- ORDER BY EnrollmentDate DESC;

-- SELECT DepartmentName, Building, Budget
-- FROM DEPARTMENTS
-- ORDER BY Budget DESC;



-- SELECT FirstName, LastName, EnrollmentDate
-- FROM STUDENTS
-- ORDER BY EnrollmentDate
-- LIMIT 3;

-- SELECT CourseName, CourseCode, Credits
-- FROM COURSES
-- ORDER BY Credits DESC
-- LIMIT 5;

-- SELECT Title, DueDate, MaxPoints
-- FROM ASSIGNMENTS
-- ORDER BY DueDate DESC
-- LIMIT 3;

-- SELECT DISTINCT DepartmentID
-- FROM STUDENTS;

-- SELECT DISTINCT Semester
-- FROM COURSES;

-- SELECT DISTINCT Status
-- FROM ENROLLMENTS;

-- SELECT DISTINCT Year
-- FROM COURSES
-- ORDER BY Year;

-- SELECT DISTINCT AssignmentType
-- FROM ASSIGNMENTS;

-- SELECT 
--     FirstName AS 'First Name',
--     LastName AS 'Last Name',
--     Email AS 'Email Address'
-- FROM STUDENTS;

-- SELECT 
--     FirstName,
--     LastName,
--     Salary,
--     Salary * 1.10 AS 'Salary After 10% Raise'
-- FROM PROFESSORS;

-- SELECT 
--     S.FirstName,
--     S.LastName,
--     S.DepartmentID
-- FROM STUDENTS AS S
-- WHERE S.IsActive = TRUE;

-- SELECT 
--     C.CourseName AS 'Course',
--     C.CourseCode AS 'Code',
--     C.Credits AS 'Credit Hours'
-- FROM COURSES AS C
-- WHERE C.Credits >= 3;

-- SELECT 
--     FirstName,
--     LastName,
--     Salary,
--     HireDate,
--     DepartmentID
-- FROM PROFESSORS
-- WHERE (Salary > 80000 OR DepartmentID = 1)
--   AND HireDate > '2014-01-01'
-- ORDER BY Salary DESC
-- LIMIT 3;

-- SELECT 
--     CourseName AS COURSE,
--     CourseCode AS CODE,
--     Credits AS CREDIT
-- FROM COURSES
-- WHERE CourseName LIKE '%Introduction%'
-- ORDER BY Credits DESC;

-- SELECT 
--     FirstName,
--     LastName,
--     DateOfBirth,
--     DepartmentID
-- FROM STUDENTS
-- WHERE DateOfBirth BETWEEN '2002-01-01' AND '2003-12-31'
--   AND DepartmentID IN (1, 2, 3)
-- ORDER BY DateOfBirth;

-- SELECT DISTINCT
--     S.FirstName AS 'Student Name',
--     S.LastName AS 'Last Name',
--     S.Email AS 'Contact Email',
--     S.DepartmentID AS 'Dept ID'
-- FROM STUDENTS AS S
-- WHERE S.DepartmentID IN (1, 2)
--   AND S.IsActive = TRUE
--   AND S.Email LIKE '%@student.edu'
-- ORDER BY S.LastName ASC
-- LIMIT 10;

-- SELECT 
--     CourseName AS 'Course',
--     CourseCode AS 'Code',
--     Credits,
--     ProfessorID AS 'Professor'
-- FROM COURSES
-- WHERE Semester = 'Fall' AND Year = 2024
-- ORDER BY CourseName;

-- SELECT 
--     FirstName,
--     LastName,
--     EnrollmentDate,
--     DepartmentID
-- FROM STUDENTS
-- WHERE EnrollmentDate BETWEEN '2021-01-01' AND '2021-12-31'
-- ORDER BY EnrollmentDate;

-- SELECT 
--     Title,
--     AssignmentType,
--     MaxPoints,
--     DueDate
-- FROM ASSIGNMENTS
-- WHERE MaxPoints >= 90
-- ORDER BY MaxPoints DESC;

-- SELECT 
--     StudentID,
--     CourseID,
--     Grade,
--     Semester,
--     Year,
--     Status
-- FROM ENROLLMENTS
-- WHERE Status = 'Completed' AND Grade IS NOT NULL
-- ORDER BY StudentID,  Semester;

-- SELECT 
--     DepartmentName AS 'Department',
--     Building,
--     Budget AS 'Annual Budget'
-- FROM DEPARTMENTS
-- WHERE Budget > 400000
-- ORDER BY Budget DESC;