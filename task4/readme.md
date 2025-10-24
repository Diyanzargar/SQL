# 🎓 SQL Developer Internship - Task 4: Aggregate Functions & Grouping


## 🎯 Project Overview

This repository contains the complete submission for **Task 4** of the SQL Developer Internship program. The task focuses on mastering aggregate functions and data grouping to perform statistical analysis and generate business intelligence reports.

**Completion Date:** October 24, 2025  
**Database:** UniversityManagementSystem  
**Concepts:** Aggregation, Grouping, Statistical Analysis

---

## 🎯 Task Objective

**Use aggregate functions and grouping to summarize and analyze tabular data.**

The goal is to develop expertise in:
- Applying aggregate functions (SUM, COUNT, AVG, MIN, MAX)
- Grouping data by single and multiple columns
- Filtering groups with HAVING clause
- Understanding WHERE vs HAVING
- Counting distinct values
- Formatting results with ROUND()
- Creating business intelligence queries

---

## 🗄️ Database Schema

The **UniversityManagementSystem** database contains 7 interconnected tables:

### Tables Overview

| Table | Purpose | Aggregate Use Cases |
|-------|---------|---------------------|
| **DEPARTMENTS** | Academic departments | Budget totals, average budgets |
| **PROFESSORS** | Faculty information | Salary statistics, headcount by dept |
| **STUDENTS** | Student records | Student counts, age averages |
| **COURSES** | Course catalog | Credit totals, course counts by semester |
| **ENROLLMENTS** | Student enrollments | Enrollment trends, status distribution |
| **ASSIGNMENTS** | Course assignments | Point averages, assignment type counts |
| **GRADES** | Assignment grades | Performance averages, submission counts |

---


## 🔧 Concepts Covered

This task demonstrates mastery of the following SQL concepts:

### ✅ Aggregate Functions
- **COUNT(*)** - Count all rows (includes NULLs)
- **COUNT(column)** - Count non-NULL values
- **COUNT(DISTINCT column)** - Count unique values
- **SUM()** - Total of numeric values
- **AVG()** - Calculate arithmetic mean
- **MIN()** - Find minimum value
- **MAX()** - Find maximum value

### ✅ Mathematical Functions
- **ROUND(value, decimals)** - Format numeric results
- Calculations within aggregates
- Multiple aggregates in single query

### ✅ Grouping Data
- **GROUP BY** - Single column grouping
- **GROUP BY** - Multiple column grouping
- Hierarchical grouping patterns
- GROUP BY with ORDER BY for ranking

### ✅ Filtering
- **WHERE** - Filter rows before grouping
- **HAVING** - Filter groups after aggregation
- **WHERE + HAVING** - Combined filtering
- Comparison of filtering approaches

### ✅ Advanced Techniques
- Conditional aggregation with CASE
- Text column aggregation
- Subqueries with aggregates
- Complex business intelligence queries
- NULL handling in aggregates

---

## 🌟 Key Highlights

### Comprehensive Coverage
- **Real-world scenarios** from university management
- **Progressive learning** from basic to advanced

### Query Breakdown by Section
1. Basic Aggregate Functions
2. COUNT(*) vs COUNT(column) 
3. Aggregate with Calculations
4. GROUP BY - Single Column
5. GROUP BY - Multiple Columns
6. GROUP BY with ORDER BY 
7. HAVING Clause
8. WHERE vs HAVING 
9. COUNT DISTINCT
10. Aggregates on Text Columns
11. Complex Aggregations
12. Business Intelligence Queries 

### Code Quality
- ✅ Clean, professional formatting
- ✅ Comprehensive inline comments
- ✅ Logic explanations for each query
- ✅ Consistent naming conventions
- ✅ Production-ready SQL code


---

## 📚 Learning Outcomes

After completing this task, you will be able to:

### Technical Skills
1. ✅ Apply all major aggregate functions (COUNT, SUM, AVG, MIN, MAX)
2. ✅ Group data by single and multiple columns
3. ✅ Filter groups using HAVING clause
4. ✅ Understand the difference between WHERE and HAVING
5. ✅ Count distinct values to avoid duplicates
6. ✅ Format numeric results with ROUND()
7. ✅ Handle NULL values in aggregations
8. ✅ Create multi-level groupings
9. ✅ Combine filtering and grouping effectively
10. ✅ Build business intelligence queries

### Analysis Skills
- Summarize large datasets into actionable insights
- Calculate key performance indicators (KPIs)
- Identify trends and patterns
- Create statistical summaries
- Generate comprehensive reports
- Perform comparative analysis

### Business Applications
- Financial reporting (budgets, payroll)
- Academic analytics (enrollment trends)
- Performance metrics (grades, completion rates)
- Resource planning (workload distribution)
- Trend analysis (growth over time)

---

## 🛠 Tools Used

| Tool | Purpose | Version |
|------|---------|---------|
| **MySQL Server** | Database hosting | 8.0+ |
| **MySQL Workbench** | Query development | Latest |
| **GitHub** | Repository hosting | - |
| **Markdown** | Documentation | - |


---

## 📊 Query Statistics

- **Total Queries:** 60+
- **Aggregate Functions Used:** 7 (COUNT, SUM, AVG, MIN, MAX, COUNT DISTINCT, ROUND)
- **Clauses Applied:** GROUP BY, HAVING, WHERE, ORDER BY
- **Tables Analyzed:** 7
- **Lines of SQL Code:** 300+

---

## 💡 Best Practices Demonstrated

### Query Writing
1. **Always format currency** to 2 decimal places using ROUND()
2. **Use meaningful aliases** for aggregate columns
3. **Comment complex logic** for maintainability
4. **Group before filtering** with HAVING for efficiency
5. **Use COUNT(DISTINCT)** when uniqueness matters

### Performance
6. **Filter with WHERE first** to reduce data before grouping
7. **Index grouped columns** for better performance
8. **Use COUNT(*)** instead of COUNT(column) when possible
9. **Avoid unnecessary DISTINCT** operations
10. **Test on sample data** before running on large tables

### Analysis
11. **Validate results** with multiple queries
12. **Cross-check totals** with detail queries
13. **Handle NULLs explicitly** in calculations
14. **Document assumptions** in comments
15. **Present results clearly** with appropriate rounding

---


## 📈 Sample Insights Generated

From the 60+ queries, this task answers questions like:

**Academic Insights:**
- How many students are enrolled in each department?
- What's the average credit load per semester?
- Which courses have the highest enrollment rates?
- What percentage of enrollments are completed?

**Financial Insights:**
- What's the total university budget across all departments?
- What's the average professor salary by department?
- Which department has the highest payroll expenses?
- What's the salary range within each department?

**Operational Insights:**
- How many courses are offered each semester?
- What's the distribution of assignment types?
- Which professors teach the most credits?
- What's the student-to-professor ratio by department?

**Performance Insights:**
- What are the average grades by course?
- Which assignment types have highest completion rates?
- What's the trend in enrollment over time?
- Which courses are most popular?

---
