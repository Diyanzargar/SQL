
This document provides a high-level overview of the design, structure, and operational logic of the University Management System database.

🎯 What Was Done 
![licensed-image](https://github.com/user-attachments/assets/608a6aed-9e8b-498e-a79f-7271619c44a0)


The project resulted in a fully-realized relational database designed to manage the core academic operations of a university. The final product includes:

A Seven-Table Relational Schema: A logical structure was built to model key university entities:

Core Entities: DEPARTMENTS, PROFESSORS, STUDENTS, COURSES.

Linking Entities: ENROLLMENTS (connecting students to courses).

Detail Entities: ASSIGNMENTS and GRADES (tracking academic performance).

Robust Data Integrity: The database is fortified with a comprehensive set of constraints to ensure data accuracy, consistency, and adherence to business rules. This includes checks for valid emails, positive salaries, and logical credit hours.

Advanced Relationship Management: Foreign keys were implemented with specific ON DELETE and ON UPDATE actions (CASCADE, SET NULL). This automates data management, ensuring that, for instance, all of a student's enrollments are removed if the student is deleted from the system (ON DELETE CASCADE).

Practical DML Scenarios: A full suite of INSERT, UPDATE, and DELETE commands was developed to populate the database and simulate real-world administrative tasks, such as enrolling students, updating grades, and removing courses.

🛠️ How It Was Done (The Methodology)

The database was constructed using a structured, logical approach to ensure a scalable and maintainable system:

Logical Schema Design: The tables were designed in a logical order, starting with independent entities (DEPARTMENTS) and moving to dependent ones (PROFESSORS, COURSES). This "parent-first" approach simplifies the creation of foreign key relationships. The use of linking tables like ENROLLMENTS effectively resolves many-to-many relationships between students and courses.

Constraint-Driven Integrity: Rather than relying on application-level logic, data integrity was enforced at the database level:

FOREIGN KEY: Used extensively to link tables and define cascading rules for updates and deletions.

CHECK Constraints: Implemented to enforce business rules directly on the data (e.g., Budget >= 0, Email LIKE '%@%.%').

UNIQUE Constraints: Applied to critical fields like Email and CourseCode to prevent duplicate entries.

DEFAULT Values: Used to streamline data entry for fields like EnrollmentDate and IsActive.

Two-Phase Data Population: The INSERT process was handled strategically. Core data (Departments, Professors) was inserted first. A subsequent UPDATE statement was then used to assign the HeadProfessorID to each department. This clever two-step process resolves the "chicken-and-egg" dilemma where a department needs a professor's ID, and a professor needs a department's ID.

Simulated Operations: The UPDATE and DELETE commands were written not just as simple examples, but as simulations of real administrative actions. This included giving department-wide raises, withdrawing a student from a course, and deactivating student records, thereby testing the database's referential integrity rules in a practical context. This approach ensures the database is not just structurally sound, but also functionally robust.
