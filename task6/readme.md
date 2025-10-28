# 🔍 Task 6: Subqueries and Nested Queries

## 📋 Project Overview

Master SQL subqueries through 40+ practical examples using the house sales database from Task 5. Learn scalar, correlated, and table subqueries in SELECT, WHERE, and FROM clauses.

**Database:** Springfield City House Sales (5 tables)  
**Focus:** Advanced query logic with nested queries  
**Level:** Intermediate to Advanced

---

## 🎯 Learning Objectives

✅ Understand scalar vs table subqueries  
✅ Master correlated subqueries  
✅ Use IN, EXISTS, =, ANY, ALL operators  
✅ Write subqueries in SELECT, WHERE, FROM clauses  
✅ Create and query derived tables  
✅ Optimize subquery performance  
✅ Know when to use subqueries vs JOINs  

---

## 🗄️ Database Schema (from Task 5)

**5 Tables:**
1. **Neighborhoods** - Area information with ratings
2. **Agents** - Real estate agents
3. **Buyers** - Property buyers with budgets
4. **PropertyListings** - Houses for sale
5. **Sales** - Completed transactions

---

## 🚀 Quick Start

## 💡 What's Covered


**Section 1: Scalar Subqueries**
- Single value returns
- Comparison operators (=, >, <)
- Average, MIN, MAX calculations

**Section 2: WHERE Clause Subqueries**
- IN operator (buyers who purchased)
- NOT IN (buyers who haven't)
- Comparison operators
- ANY and ALL operators

**Section 3: EXISTS Operator**
- Existence checks
- NOT EXISTS for missing records
- Performance advantages over IN

**Section 4: Correlated Subqueries**
- Reference outer query
- Per-row calculations
- Neighborhood-specific averages

**Section 5: SELECT Clause Subqueries**
- Calculated columns
- Agent statistics
- Dynamic value addition

**Section 6: FROM Clause (Derived Tables)**
- Temporary result sets
- Pre-aggregated data
- Multiple derived table joins

**Section 7: Nested Subqueries**
- Multi-level nesting
- Complex filtering logic
- Three-level examples

**Section 8: Subquery vs JOIN**
- Performance comparison
- When to use each
- Same results, different approaches

**Section 9: Real-World Examples**
- Undervalued properties finder
- Agent efficiency reports
- Buyer-property matching
- Investment opportunities

**Section 10: Performance Optimization**
- EXISTS vs IN comparison
- Avoiding correlated subqueries
- Pre-filtering strategies

---


---

## 📊 Key Concepts

### Subquery Types:
- **Scalar:** Returns 1 value (used with =, <, >)
- **Column:** Returns multiple rows, 1 column (used with IN)
- **Row:** Returns 1 row, multiple columns
- **Table:** Returns multiple rows/columns (FROM clause)

### Subquery Locations:
- **SELECT:** Calculate values per row
- **WHERE:** Filter rows
- **FROM:** Create derived tables
- **HAVING:** Filter grouped results

### Operators:
- **IN/NOT IN:** Check list membership
- **EXISTS/NOT EXISTS:** Check existence
- **=, <, >:** Compare with scalar value
- **ANY/ALL:** Compare with multiple values

---

## ⚡ Performance Tips

### Fast Approaches:
✅ Use EXISTS instead of IN for large datasets  
✅ Use JOIN when you need columns from both tables  
✅ Pre-filter with derived tables  
✅ Index columns used in subqueries  

### Slow Approaches:
❌ Correlated subqueries in SELECT (execute per row)  
❌ IN with large subquery results  
❌ Multiple nested correlated subqueries  
❌ Subqueries without proper indexes  

---

## 🎯 When to Use Subqueries

### Use Subqueries For:
- Complex filtering logic
- Aggregations in WHERE clause
- Existence checks (EXISTS)
- Dynamic value comparisons
- Creating derived tables

### Use JOINs Instead For:
- Simple relationships
- Need columns from multiple tables
- Better performance on large datasets
- Straightforward table combinations

---


---

## 🛠️ Tools Required

- **DB Browser for SQLite** (Recommended - Free)
- OR **MySQL Workbench** (Free)
- OR **PostgreSQL + pgAdmin** (Free)

---

## ✅ Task Requirements Met

| Requirement | Status | Details |
|-------------|--------|---------|
| Scalar subqueries | ✅ |
| Correlated subqueries | ✅ |
| Subqueries with IN | ✅ |
| Subqueries with EXISTS | ✅ | 
| Subqueries with = | ✅ |
| Subqueries in SELECT | ✅ |
| Subqueries in WHERE | ✅ |
| Subqueries in FROM | ✅ | 
| Nested logic | ✅ |

---

## 🚀 Submission Checklist

Before submitting:

- [x] All SQL queries run without errors
- [x] Database has data from Task 5
- [x] README.md is complete
- [x] Files organized in GitHub repo
- [x] Code is well-commented

---



## 🔗 Related Tasks

- **Task 5:** SQL Joins (prerequisite for this task)
- Uses the same database schema
- Builds on JOIN knowledge
- Combines concepts in advanced queries

---

## 📝 Summary

This task provides comprehensive coverage of SQL subqueries through:
- 40+ practical examples
- 10 progressive sections
- All interview questions answered
- Real-world business scenarios
- Performance optimization techniques


---


*"Subqueries are not just nested queries - they're a powerful tool for expressing complex logic clearly and concisely."*
