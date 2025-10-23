# University Management System Database

## 📖 Overview
A comprehensive database schema designed for managing university operations including students, professors, courses, enrollments, assignments, and grades.

## 🎯 Project Details
- **Internship:** SQL Developer Internship - Day 1
- **Task:** Database Setup and Schema Design
- **Date:** October 20, 2025
- **Domain:** Education/University Management

## 🗂 Database Structure
- **Tables:** 7 (Departments, Professors, Students, Courses, Enrollments, Assignments, Grades)
- **Relationships:** Multiple One-to-Many and Many-to-Many
- **Normalization:** 3rd Normal Form (3NF)
- **Storage Engine:** InnoDB

## 🚀 Quick Start

### Prerequisites
- MySQL Server 8.0+
- MySQL Workbench


## 📊 Key Features
- ✅ Fully normalized database (3NF)
- ✅ Referential integrity with foreign keys
- ✅ Comprehensive constraints (CHECK, UNIQUE, NOT NULL)
- ✅ Sample data included
- ✅ Timestamp tracking (CreatedAt, UpdatedAt)
- ✅ Cascading deletes and updates
- ✅ Data validation rules

## 🔑 Core Entities

### 1. DEPARTMENTS
Manages academic departments
- Primary Key: DepartmentID
- Attributes: Name, Building, Budget, Head Professor

### 2. PROFESSORS
Faculty information
- Primary Key: ProfessorID
- Attributes: Name, Email, Hire Date, Salary, Department

### 3. STUDENTS
Student records
- Primary Key: StudentID
- Attributes: Name, Email, Date of Birth, Department

### 4. COURSES
Course catalog
- Primary Key: CourseID
- Attributes: Name, Code, Credits, Semester, Professor

### 5. ENROLLMENTS
Student course registrations (Junction table)
- Primary Key: EnrollmentID
- Links: Students ↔ Courses

### 6. ASSIGNMENTS
Course assignments
- Primary Key: AssignmentID
- Attributes: Title, Due Date, Max Points

### 7. GRADES
Student performance tracking
- Primary Key: GradeID
- Links: Enrollments and Assignments

## 📐 Relationships
erDiagram
    
    DEPARTMENTS ||--o{ PROFESSORS : "has"
    
    DEPARTMENTS ||--o{ STUDENTS : "has"
    
    DEPARTMENTS ||--o{ COURSES : "offers"
    
    DEPARTMENTS ||--|{ PROFESSORS : "is headed by"
    
    PROFESSORS ||--o{ COURSES : "teaches"
    
    STUDENTS ||--o{ ENROLLMENTS : "has"
    
    COURSES ||--o{ ENROLLMENTS : "has"
    
    COURSES ||--o{ ASSIGNMENTS : "has"
    
    ENROLLMENTS ||--o{ GRADES : "receives"
    
    ASSIGNMENTS ||--o{ GRADES : "has"

