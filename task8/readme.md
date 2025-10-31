# 🏡 Task 8 – Stored Procedures & Functions (House Sales Database)

### 📚 Internship: SQL Developer Training Program  
**Day:** 8  
**Topic:** Stored Procedures and Functions  
**Tool Used:** MySQL Workbench  
**Database:** House Sales Database  

---

## 🎯 Objective
To learn how to modularize SQL logic by creating and using:
- **Stored Procedures** (for reusable multi-step operations)
- **Functions** (for reusable calculations that return values)

This task focuses on building, calling, and understanding stored routines using real-world data from the *House Sales Database*.

---

## 🧠 Concepts Covered
- Creating and calling procedures (`CREATE PROCEDURE`, `CALL`)
- Creating and using functions (`CREATE FUNCTION`, `SELECT fn_name()`)
- `IN` and `OUT` parameters  
- Using `RETURN` in functions  
- Conditional logic and loops (`IF`, `WHILE`)  
- Handling NULLs and empty result sets  
- Practical, real-world calculations using joins and aggregates  

---

## 🗃️ Database Used – *House Sales Database*
The database models a property sales system with these tables:
1. **Neighborhoods** – area, city, and safety rating  
2. **Agents** – agent info, experience, and commission rate  
3. **Buyers** – customer details and preferred neighborhoods  
4. **PropertyListings** – property details (size, price, year, agent)  
5. **Sales** – completed property transactions  

---

## ⚙️ Implemented Routines

### 🔹 Stored Procedures (5 Total)
| Procedure | Description |
|------------|--------------|
| **sp_CalcAgentCommission** | Shows total sales and commission for a given agent |
| **sp_AgentCommission_Out** | Demonstrates `OUT` parameters returning sales & commission |
| **sp_SalesInRangeByNeighborhood** | Lists sales for a neighborhood between given dates |
| **sp_UpdateAgentCommissionRate** | Updates an agent’s rate and returns the old rate via `OUT` |
| **sp_AnnualSalesForAgent** | Uses a `WHILE` loop to show annual sales totals per agent |

### 🔸 Functions (5 Total)
| Function | Description |
|-----------|--------------|
| **fn_AvgSalePrice** | Returns average sale price for a neighborhood |
| **fn_TotalSalesAgent** | Returns total sales amount for an agent |
| **fn_HighestSaleInNeighborhood** | Returns the highest sale price in a neighborhood |
| **fn_EstCommissionForProperty** | Estimates commission for a property using listing price |
| **fn_CountSalesInRange** | Counts total sales in a neighborhood within date range |

---

## 💡 Examples
The file includes **30 concise examples** demonstrating:
- Calling procedures using `CALL`
- Reading `OUT` parameter values
- Using functions inside `SELECT` queries
- Conditional and range-based logic
- Combining procedure outputs with function results

---

## 🧰 How to Run
1. Open **MySQL Workbench**  
2. Run your database creation script (House Sales Database)  
3. Copy the code from `task8_practice.sql` and execute  
4. Call any procedure or function from the examples section  

Example:
```sql
CALL sp_CalcAgentCommission(1);
SELECT fn_AvgSalePrice(1);
