-- use universitymanagementsystem;

-- SELECT COUNT(*) AS 'Total Students'
-- FROM STUDENTS;

-- SELECT COUNT(*) AS 'Total Professors'
-- FROM PROFESSORS;

-- SELECT SUM(Budget) AS 'Total University Budget'
-- FROM DEPARTMENTS;

-- SELECT AVG(Salary) AS 'Average Professor Salary'
-- FROM PROFESSORS;

-- SELECT MAX(Salary) AS 'Highest Salary'
-- FROM PROFESSORS;

-- SELECT MIN(Salary) AS 'Lowest Salary'
-- FROM PROFESSORS;

-- SELECT COUNT(*) AS 'Total Courses'
-- FROM COURSES;

-- SELECT AVG(Credits) AS 'Average Course Credits'
-- FROM COURSES;

-- SELECT SUM(Credits) AS 'Total Credits Offered'
-- FROM COURSES;

-- SELECT COUNT(*) AS 'Total Enrollments'
-- FROM ENROLLMENTS;

-- SELECT COUNT(Phone) AS 'Students With Phone'
-- FROM STUDENTS;

-- SELECT 
--     COUNT(*) - COUNT(Phone) AS 'Students Without Phone'
-- FROM STUDENTS;

-- SELECT 
--     COUNT(*) AS 'Total Enrollments',
--     COUNT(Grade) AS 'Graded Enrollments',
--     COUNT(*) - COUNT(Grade) AS 'Ungraded Enrollments'
-- FROM ENROLLMENTS;

-- SELECT 
-- 	COUNT(*) AS 'Total Courses',
--     COUNT(ProfessorID) AS 'Courses With Professor',
--     Count(*) - COUNT(ProfessorID) AS 'Courses Without Professor'
-- FROM COURSES;

-- SELECT
-- 	ROUND(AVG(Salary), 2) AS 'Average Salary(Rounded)'
-- 	FROM PROFESSORS;

-- SELECT ROUND(SUM(Salary),2) AS 'Total Annual Payroll'
-- FROM PROFESSORS;

-- SELECT ROUND(AVG(MaxPoints), 0) AS 'Average Assignment Points'
-- FROM ASSIGNMENTS;

-- SELECT 
-- 	COUNT(*) AS 'Total Professors',
--     ROUND(MIN(Salary), 2) AS 'Minimum Salary',
--     ROUND(MAX(Salary), 2) AS 'Maximum Salary',
--     ROUND(AVG(Salary), 2) AS 'Average Salary',
--     ROUND(SUM(Salary), 2) AS 'Total Payroll'
-- FROM PROFESSORS;

-- SELECT
-- 	COUNT(*) AS 'Total Payroll',
--     ROUND(MIN(BUDGET), 2) AS 'Smallest Budget',
--     ROUND(MAX(BUDGET), 2) AS 'Largest Budget',
--     ROUND(AVG(BUDGET), 2) AS 'Average Budget',
--     ROUND(SUM(BUDGET), 2) AS 'Total Budget'
-- FROM DEPARTMENTS;

-- SELECT 
-- 	DepartmentID,
--     COUNT(*) AS 'Number of Students'
-- FROM STUDENTS
-- GROUP BY DepartmentID;

-- SELECT 
-- 	Semester,
--     COUNT(*) AS 'Number of Courses'
-- FROM COURSES
-- GROUP BY SEMESTER;

-- SELECT 
-- 	DepartmentID,
--     ROUND(AVG(Salary), 2) AS 'Average Salary'
-- FROM PROFESSORS
-- GROUP BY DepartmentID
-- ;

-- SELECT 
--     DepartmentName,
--     ROUND(Budget, 2) AS 'Budget'
-- FROM DEPARTMENTS
-- GROUP BY DepartmentName;

-- SELECT 
--     Status,
--     COUNT(*) AS 'Number of Enrollments'
-- FROM ENROLLMENTS
-- GROUP BY Status;

-- SELECT 
--     AssignmentType,
--     COUNT(*) AS 'Count'
-- FROM ASSIGNMENTS
-- GROUP BY AssignmentType;

-- SELECT 
--     AssignmentType,
--     ROUND(AVG(MaxPoints), 2) AS 'Average Points'
-- FROM ASSIGNMENTS
-- GROUP BY AssignmentType;

-- SELECT 
--     IsActive,
--     COUNT(*) AS 'Student Count'
-- FROM STUDENTS
-- GROUP BY IsActive;

-- SELECT 
--     Year,
--     COUNT(*) AS 'Courses Offered'
-- FROM COURSES
-- GROUP BY Year;

-- SELECT 
--     Semester,
--     ROUND(AVG(Credits), 2) AS 'Average Credits'
-- FROM COURSES
-- GROUP BY Semester;

-- SELECT 
--     Semester,
--     Year,
--     COUNT(*) AS 'Number of Courses'
-- FROM COURSES
-- GROUP BY Semester, Year
-- ORDER BY Year, Semester;

-- SELECT 
--     Semester,
--     Year,
--     COUNT(*) AS 'Total Enrollments'
-- FROM ENROLLMENTS
-- GROUP BY Semester, Year
-- ORDER BY Year, Semester;

-- SELECT 
--     Semester,
--     Status,
--     COUNT(*) AS 'Count'
-- FROM ENROLLMENTS
-- GROUP BY Semester, Status
-- ORDER BY Semester, Status;

-- SELECT 
--     DepartmentID,
--     IsActive,
--     ROUND(AVG(Salary), 2) AS 'Average Salary',
--     COUNT(*) AS 'Professor Count'
-- FROM PROFESSORS
-- GROUP BY DepartmentID, IsActive;

-- SELECT 
--     DepartmentID,
--     IsActive,
--     COUNT(*) AS 'Student Count'
-- FROM STUDENTS
-- GROUP BY DepartmentID, IsActive
-- ORDER BY DepartmentID;

-- SELECT 
--     DepartmentID,
--     IsActive,
--     COUNT(*) AS 'Student Count'
-- FROM STUDENTS
-- GROUP BY DepartmentID, IsActive
-- ORDER BY DepartmentID;

-- SELECT 
--     DepartmentID,
--     ROUND(AVG(Salary), 2) AS 'Average Salary',
--     COUNT(*) AS 'Number of Professors'
-- FROM PROFESSORS
-- GROUP BY DepartmentID
-- ORDER BY AVG(Salary) DESC;

-- SELECT 
--     AssignmentType,
--     COUNT(*) AS 'Count'
-- FROM ASSIGNMENTS
-- GROUP BY AssignmentType
-- ORDER BY COUNT(*) DESC;

-- SELECT 
--     Status,
--     COUNT(*) AS 'Count'
-- FROM ENROLLMENTS
-- GROUP BY Status
-- ORDER BY COUNT(*) DESC;

-- SELECT 
--     Year,
--     Semester,
--     COUNT(*) AS 'Courses'
-- FROM COURSES
-- GROUP BY Year, Semester
-- ORDER BY Year ASC, 
--          CASE Semester  -- custom sort order 
--              WHEN 'Spring' THEN 1
--              WHEN 'Summer' THEN 2
--              WHEN 'Fall' THEN 3
--          END;

-- SELECT 
--     DepartmentID,
--     COUNT(*) AS 'Student Count'
-- FROM STUDENTS
-- GROUP BY DepartmentID
-- HAVING COUNT(*) > 2;

-- SELECT 
--     DepartmentID,
--     ROUND(AVG(Salary), 2) AS 'Average Salary',
--     COUNT(*) AS 'Professors'
-- FROM PROFESSORS
-- GROUP BY DepartmentID
-- HAVING AVG(Salary) > 80000;

-- SELECT 
--     Semester,
--     Year,
--     COUNT(*) AS 'Course Count'
-- FROM COURSES
-- GROUP BY Semester, Year
-- HAVING COUNT(*) > 3;

-- SELECT 
--     DepartmentName,
--     Budget
-- FROM DEPARTMENTS
-- GROUP BY DepartmentName, Budget
-- HAVING Budget > 400000;

--     DepartmentID,
--     COUNT(*) AS 'Active Students'
-- FROM STUDENTS
-- WHERE IsActive = TRUE
-- GROUP BY DepartmentID;

-- SELECT 
--     DepartmentID,
--     COUNT(*) AS 'Student Count'
-- FROM STUDENTS
-- GROUP BY DepartmentID
-- HAVING COUNT(*) >= 2;

-- SELECT 
--     DepartmentID,
--     COUNT(*) AS 'Active Students'
-- FROM STUDENTS
-- WHERE IsActive = TRUE
-- GROUP BY DepartmentID
-- HAVING COUNT(*) >= 2;

-- SELECT 
--     StudentID,
--     COUNT(*) AS 'Completed Courses'
-- FROM ENROLLMENTS
-- WHERE Status = 'Completed'
-- GROUP BY StudentID
-- HAVING COUNT(*) >= 2;

-- SELECT 
--     DepartmentID,
--     COUNT(*) AS 'High Earners',
--     ROUND(AVG(Salary), 2) AS 'Average Salary'
-- FROM PROFESSORS
-- WHERE Salary > 80000
-- GROUP BY DepartmentID
-- HAVING COUNT(*) >= 1;

-- SELECT COUNT(DISTINCT DepartmentID) AS 'Departments With Students'
-- FROM STUDENTS;

-- SELECT COUNT(DISTINCT Semester) AS 'Unique Semesters'
-- FROM COURSES;

-- SELECT COUNT(DISTINCT Year) AS 'Active Academic Years'
-- FROM COURSES;

-- SELECT COUNT(DISTINCT AssignmentType) AS 'Assignment Categories'
-- FROM ASSIGNMENTS;

-- SELECT COUNT(DISTINCT Status) AS 'Status Types'
-- FROM ENROLLMENTS;

-- SELECT 
--     Semester,
--     Year,
--     COUNT(DISTINCT StudentID) AS 'Unique Students'
-- FROM ENROLLMENTS
-- GROUP BY Semester, Year;

-- SELECT 
--     LastName,
--     COUNT(*) AS 'Count'
-- FROM PROFESSORS
-- GROUP BY LastName;

-- SELECT 
--     SUBSTRING(CourseCode, 1,2) AS 'Department Code', -- extracts a part of the string
--     COUNT(*) AS 'Course Count'
-- FROM COURSES
-- GROUP BY SUBSTRING(CourseCode, 1, 2);

-- SELECT 
--     SUBSTRING_INDEX(Email, '@', -1) AS 'Email Domain', 
--     COUNT(*) AS 'Count'
-- FROM STUDENTS
-- GROUP BY SUBSTRING_INDEX(Email, '@', -1);

-- SELECT 
--     SUBSTRING_INDEX(Email, '@', -1) AS 'Email Domain',  -- splits and returns the text after delimiter
--     COUNT(*) AS 'Count'
-- FROM STUDENTS
-- GROUP BY SUBSTRING_INDEX(Email, '@', -1);

-- SELECT 
--     ProfessorID,
--     COUNT(*) AS 'Total Courses',
--     SUM(Credits) AS 'Total Credits Teaching',
--     ROUND(AVG(Credits), 2) AS 'Average Course Credits'
-- FROM COURSES
-- WHERE ProfessorID IS NOT NULL
-- GROUP BY ProfessorID;

-- SELECT 
--     CourseID,
--     COUNT(*) AS 'Total Assignments',
--     SUM(MaxPoints) AS 'Total Possible Points',
--     ROUND(AVG(MaxPoints), 2) AS 'Average Points Per Assignment',
--     MAX(MaxPoints) AS 'Highest Point Assignment'
-- FROM ASSIGNMENTS
-- GROUP BY CourseID;

-- SELECT 
--     P.DepartmentID,
--     COUNT(P.ProfessorID) AS 'Faculty Count',
--     ROUND(SUM(P.Salary), 2) AS 'Total Payroll',
--     ROUND(AVG(P.Salary), 2) AS 'Average Salary'
-- FROM PROFESSORS P
-- GROUP BY P.DepartmentID
-- ORDER BY SUM(P.Salary) DESC;

-- SELECT 
--     Year,
--     Semester,
--     COUNT(*) AS 'Total Enrollments',
--     COUNT(DISTINCT StudentID) AS 'Unique Students',
--     COUNT(DISTINCT CourseID) AS 'Courses With Enrollments'
-- FROM ENROLLMENTS
-- GROUP BY Year, Semester
-- ORDER BY Year, Semester;