The script performed four main actions in order:

Created the Database: First, it ran CREATE DATABASE UniversityManagementSystem;. This built the main "container" or "file cabinet" to hold all your tables. It also used DROP DATABASE IF EXISTS... to ensure it was starting with a clean slate.

Built the Tables (The Schema): This was the main part. It ran seven CREATE TABLE commands to build the "folders" inside your file cabinet: DEPARTMENTS, PROFESSORS, STUDENTS, COURSES, ENROLLMENTS, ASSIGNMENTS, and GRADES.

Linked the Tables: After all the tables were created, it ran an ALTER TABLE command. This command went back to the DEPARTMENTS table and officially added the foreign key to link HeadProfessorID to the PROFESSORS table.

Added Sample Data: Finally, it used a series of INSERT INTO commands to populate your new tables with sample data (like 'Computer Science', 'John Smith', 'Alice Anderson', etc.). This lets you start testing and running queries right away.

How the Database Was Designed 
The "how" is all about the design choices made inside those CREATE TABLE commands. The database was built using these key concepts:

1. Normalization
Instead of one giant spreadsheet, the data was split into separate, logical tables.

You don't write the professor's name in the COURSES table.

Instead, you have a PROFESSORS table and just put the professor's ID (ProfessorID) in the COURSES table. This process, called normalization, is how you avoid data redundancy. If a professor changes their name, you only have to update it in one place (the PROFESSORS table), not in every course they've ever taught.

2. Primary and Foreign Keys 
This is the most important part.

Primary Keys (PK): Each table gets a primary key (like StudentID, CourseID) to uniquely identify every row. AUTO_INCREMENT was used to make this easy, so the database just assigns a new number (1, 2, 3...) for every new entry.

Foreign Keys (FK): These are the "links." The DepartmentID in the STUDENTS table is a foreign key that points to the DepartmentID (the primary key) in the DEPARTMENTS table. This is what connects a student to their department.

3. Data Integrity (Constraints)
Constraints are the rules that protect your data and keep it clean and logical.

NOT NULL: Ensures that important fields, like a person's LastName, cannot be left blank.

UNIQUE: Guarantees that no two entries are the same, like Email or CourseCode.

CHECK: Creates a custom rule, like CHECK (Budget >= 0) to stop someone from entering a negative number.

DEFAULT: Puts in a value automatically if you don't provide one, like IsActive BOOLEAN DEFAULT TRUE.

ON DELETE SET NULL: A safety rule. If you delete a professor, this rule will set the ProfessorID in the COURSES table to NULL (empty) instead of deleting the whole course.

ON DELETE CASCADE: A cleanup rule. If you delete a student from the STUDENTS table, this rule automatically deletes all their ENROLLMENTS records, since they no longer apply.
