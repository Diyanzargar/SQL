# 💼 Interview Questions & Answers – Task 8

---

### 1️⃣ Difference between Procedure and Function

**Procedure:**

* Performs one or more actions like insert, update, delete, or select.
* Can return multiple result sets.
* Called using `CALL`.
* Example:

  ```sql
  CALL sp_CalcAgentCommission(1);
  ```

**Function:**

* Always returns a single value (scalar).
* Used in expressions or `SELECT` queries.
* Called using `SELECT fn_name()`.

  ```sql
  SELECT fn_AvgSalePrice(1);
  ```

---

### 2️⃣ What is IN/OUT Parameter?

* **IN:** Passes input values into a procedure.
* **OUT:** Returns values from a procedure.

Example:

```sql
CALL sp_AgentCommission_Out(1, @total, @commission);
SELECT @total, @commission;
```

---

### 3️⃣ Can Functions Return Tables?

* In **MySQL**, functions can return only a single value, not a table.
* You can simulate table-like results using **JSON** or a **procedure** that returns a resultset.

---

### 4️⃣ What is RETURN Used For?

* `RETURN` sends a computed value back from a function.
  Example:

```sql
CREATE FUNCTION fn_TotalSalesAgent(id INT)
RETURNS DECIMAL(12,2)
BEGIN
  RETURN (SELECT SUM(sale_price) FROM Sales WHERE agent_id = id);
END;
```

---

### 5️⃣ How to Call Stored Procedures?

Use the `CALL` keyword.

```sql
CALL sp_CalcAgentCommission(1);
```

---

### 6️⃣ Benefits of Stored Routines

* **Reusability** and **modularity**.
* Consistency across applications.
* Better performance for repeated logic.
* Easier debugging and maintenance.

---

### 7️⃣ Can Procedures Have Loops?

Yes. Loops can iterate through data or perform repeated tasks.
Example (from `sp_AnnualSalesForAgent`):

```sql
WHILE yr <= p_end_year DO
  SELECT yr, SUM(sale_price) FROM Sales WHERE YEAR(sale_date)=yr;
  SET yr = yr + 1;
END WHILE;
```

---

### 8️⃣ Difference Between Scalar and Table-Valued Functions

* **Scalar function:** Returns a single value (e.g., total, average, count).
* **Table-valued function:** Returns a table. (MySQL doesn’t support directly; use procedures instead.)

---

### 9️⃣ What is a Trigger?

A **trigger** runs automatically after or before an event (INSERT, UPDATE, DELETE).
Example:

```sql
CREATE TRIGGER before_insert_agent
BEFORE INSERT ON Agents
FOR EACH ROW
SET NEW.email = LOWER(NEW.email);
```

---

### 🔐 10️⃣ How to Debug Stored Procedures?

* Use temporary `SELECT` statements inside the procedure to inspect variable values.
  Example:

```sql
SELECT 'Debug:', variable_name;
```

* Run step-by-step and review intermediate outputs to find errors or unexpected results.
