# 🎓 University Management System - SQL Project

This project simulates a **University Management System** using SQL. It includes a robust database schema design, various data manipulation practices, and the use of real-world constraints and relationships that reflect how a university operates.

---

## 📘 What’s Inside?

This SQL project covers essential relational database concepts through practical exercises involving:

### ✅ Database Schema Design
- **7 Interconnected Tables**:
  - `DEPARTMENTS`
  - `PROFESSORS`
  - `STUDENTS`
  - `COURSES`
  - `ENROLLMENTS`
  - `ASSIGNMENTS`
  - `GRADES`
- **Constraints Used**:
  - Primary & Foreign Keys
  - Unique & Not Null Constraints
  - Check Constraints
  - Default Values
  - Enum Data Types

---

## 🛠️ SQL Practices Demonstrated

### 1. **CREATE & ALTER**
- Creating normalized tables with strong referential integrity.
- Adding foreign keys post-creation (`ALTER TABLE`).

### 2. **INSERT**
- Populating tables with sample data representing:
  - Students, Professors, and Departments
  - Course offerings per semester
  - Enrollment and grading details

### 3. **UPDATE**
- Modifying records based on conditions:
  - Updating salaries
  - Changing enrollment statuses
  - Disabling inactive students

### 4. **DELETE**
- Removing data safely using foreign keys and cascading rules.
- Demonstrating logical deletions based on conditions.

---

## 💡 Key Concepts Practiced

- **Data Normalization**
- **Relational Integrity**
- **Cascade Actions (`ON DELETE`, `ON UPDATE`)**
- **Complex Constraints (like email format, grade validations, etc.)**
- **Time-stamped records (`CreatedAt`, `UpdatedAt`)**

---

## 📂 Use Cases

This database can serve as a foundation for:
- College/university admin systems
- Student information systems
- Educational dashboards
- Academic reporting platforms

---

## ⚙️ How to Use

1. Run the database creation and table definitions in your MySQL server.
2. Execute the sample inserts to simulate real-world data.
3. Use the `UPDATE` and `DELETE` queries to test data modifications.
4. Extend the schema with new features like course prerequisites, department budgets over time, or student GPA calculations.

---
