# Task 6: Subqueries - Interview Questions & Answers

## 1. What is a subquery?

A **subquery** (also called an inner query or nested query) is a query embedded within another SQL query. It's enclosed in parentheses and can return a single value, a list of values, or a result set.

**Example:**
```sql
-- Find properties above average price
SELECT address, listing_price
FROM PropertyListings
WHERE listing_price > (SELECT AVG(listing_price) FROM PropertyListings);
```

**Key Points:**
- Executes before the outer query
- Result is used by the outer query
- Can be nested multiple levels deep
- Can appear in SELECT, WHERE, FROM, or HAVING clauses

---

## 2. Difference between subquery and join?

| Aspect | Subquery | JOIN |
|--------|----------|------|
| **Purpose** | Filter/calculate based on other query | Combine columns from multiple tables |
| **Performance** | Can be slower for large datasets | Generally faster with proper indexes |
| **Readability** | Better for complex logic | Better for simple relationships |
| **Result** | Can return single value or list | Returns combined columns |
| **Usage** | When you need aggregations/filtering | When you need columns from multiple tables |

**Same Result - Different Approaches:**

**When to Use Each:**
- **Use Subquery:** Complex filtering, aggregations in WHERE, need intermediate results
- **Use JOIN:** Need columns from multiple tables, better performance for simple queries

---

## 3. What is a correlated subquery?

A **correlated subquery** references columns from the outer query. It's executed once for each row processed by the outer query, making it dependent on the outer query.

**Non-Correlated (Independent):**
```sql
-- Executed once, result reused
SELECT address, listing_price
FROM PropertyListings
WHERE listing_price > (SELECT AVG(listing_price) FROM PropertyListings);
```

**Correlated (Dependent):**
```sql
-- Executed for EACH row, references outer query (p)
SELECT address, listing_price
FROM PropertyListings p
WHERE listing_price > (
    SELECT AVG(listing_price)
    FROM PropertyListings p2
    WHERE p2.neighborhood_id = p.neighborhood_id  -- References outer query
);
```

**How It Works:**
1. Outer query selects a row
2. Subquery executes using values from that row
3. Result determines if row is included
4. Repeat for each row


**Performance Note:** Correlated subqueries can be slow on large datasets because they execute multiple times. Consider using JOINs or window functions for better performance.

---

## 4. Can subqueries return multiple rows?

**Yes!** Subqueries can return:
1. **Single value** (scalar) - used with `=`, `>`, `<`
2. **Multiple rows** (list) - used with `IN`, `ANY`, `ALL`
3. **Multiple columns** (table) - used in `FROM` clause


## 5. How does EXISTS work?

**EXISTS** checks if a subquery returns **any rows**. It returns TRUE if at least one row exists, FALSE otherwise.

**Syntax:**
```sql
SELECT columns FROM table
WHERE EXISTS (subquery);
```

**How It Works:**
1. Executes the subquery
2. If subquery returns ≥1 row → TRUE
3. If subquery returns 0 rows → FALSE
4. Stops checking after finding first row (efficient!)


## 6. How is performance affected by subqueries?

**Performance Impact Factors:**

### 1. **Subquery Type**
- **Scalar (single value):** Fast if executed once
- **Correlated:** Slow - executes for each outer row
- **Derived table:** Can be fast with proper indexing

### 2. **Location**
- **WHERE with IN:** Can be slow for large lists
- **WHERE with EXISTS:** Usually faster than IN
- **SELECT clause:** Executes for each row (can be slow)
- **FROM clause:** Materialized once (generally efficient)

### 3. **Comparison: Slow vs Fast**

**SLOW - Correlated subquery in SELECT:**
```sql
-- Executes subquery for EVERY agent
SELECT 
    agent_name,
    (SELECT COUNT(*) FROM Sales s WHERE s.agent_id = a.agent_id) AS sales
FROM Agents a;
```

**FAST - JOIN with GROUP BY:**
```sql
-- Executes once, uses aggregation
SELECT a.agent_name, COUNT(s.sale_id) AS sales
FROM Agents a
LEFT JOIN Sales s ON a.agent_id = s.agent_id
GROUP BY a.agent_name;
```

**SLOW - IN with large subquery:**
```sql
-- Retrieves all buyer_ids first, then filters
SELECT buyer_name FROM Buyers
WHERE buyer_id IN (SELECT buyer_id FROM Sales);
```

**FAST - EXISTS (stops at first match):**
```sql
-- Stops checking after finding one match
SELECT buyer_name FROM Buyers b
WHERE EXISTS (SELECT 1 FROM Sales s WHERE s.buyer_id = b.buyer_id);
```

### 4. **Optimization Tips**
✅ Use EXISTS instead of IN for large datasets  
✅ Avoid correlated subqueries when JOIN works  
✅ Index columns used in subquery conditions  
✅ Use derived tables to pre-filter data  
✅ Limit subquery result set with WHERE  
✅ Use EXPLAIN QUERY PLAN to analyze  
✅ Consider materialized views for repeated subqueries  

### 5. **When Subqueries Are Actually Faster**
- Complex aggregations that would need multiple JOINs
- When you only need to check existence (EXISTS)
- Small result sets with good indexes
- Logic that's clearer with nested queries

---

## 7. What is scalar subquery?

A **scalar subquery** returns exactly **one row and one column** (a single value). It can be used anywhere a single value is expected.

**Characteristics:**
- Returns 1 row, 1 column
- Can use `=`, `>`, `<`, `>=`, `<=`, `!=`
- Often uses aggregate functions (AVG, MAX, MIN, SUM, COUNT)
- If returns 0 or 2+ rows, causes error

**Example 1: Comparison**
```sql
-- Find properties above average price
SELECT address, listing_price
FROM PropertyListings
WHERE listing_price > (SELECT AVG(listing_price) FROM PropertyListings);
--                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--                     Scalar subquery: returns single value (e.g., 425000)
```

**Example 2: In SELECT clause**
```sql
-- Add calculated column
SELECT 
    address,
    listing_price,
    (SELECT AVG(listing_price) FROM PropertyListings) AS market_avg,
    listing_price - (SELECT AVG(listing_price) FROM PropertyListings) AS diff
FROM PropertyListings;
```

**Common Aggregate Functions in Scalar Subqueries:**
- `AVG()` - Average value
- `MAX()` - Maximum value
- `MIN()` - Minimum value
- `SUM()` - Total sum
- `COUNT()` - Count of rows

**Error Example:**
```sql
-- ERROR: Returns multiple rows
SELECT address FROM PropertyListings
WHERE neighborhood_id = (SELECT neighborhood_id FROM Neighborhoods);
-- Fix: Use IN instead of =
```

---

## 8. Where can we use subqueries?

Subqueries can be used in **5 main locations**:

### 1. **SELECT Clause** (Calculate values)
```sql
-- Add calculated columns for each row
SELECT 
    buyer_name,
    budget,
    (SELECT COUNT(*) FROM PropertyListings WHERE listing_price <= b.budget) AS affordable_count,
    (SELECT AVG(listing_price) FROM PropertyListings) AS market_avg
FROM Buyers b;
```

### 2. **WHERE Clause** (Filter rows)
```sql
-- Filter based on conditions from another query
SELECT address, listing_price
FROM PropertyListings
WHERE neighborhood_id IN (
    SELECT neighborhood_id FROM Neighborhoods WHERE safety_rating >= 8
);
```

### 3. **FROM Clause** (Create derived tables)
```sql
-- Query from a temporary result set
SELECT neighborhood, avg_price
FROM (
    SELECT 
        n.neighborhood_name AS neighborhood,
        AVG(p.listing_price) AS avg_price
    FROM PropertyListings p
    JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id
    GROUP BY n.neighborhood_name
) AS stats
WHERE avg_price > 400000;
```

### 4. **HAVING Clause** (Filter grouped results)
```sql
-- Filter aggregated data
SELECT neighborhood_id, AVG(listing_price) AS avg_price
FROM PropertyListings
GROUP BY neighborhood_id
HAVING AVG(listing_price) > (SELECT AVG(listing_price) FROM PropertyListings);
```

### 5. **INSERT Statement**
```sql
-- Insert data from a query (example structure)
INSERT INTO HighValueProperties (address, price)
SELECT address, listing_price
FROM PropertyListings
WHERE listing_price > (SELECT AVG(listing_price) * 1.5 FROM PropertyListings);
```

### 6. **UPDATE Statement**
```sql
-- Update based on calculated values (example structure)
UPDATE PropertyListings
SET listing_price = listing_price * 1.1
WHERE neighborhood_id IN (
    SELECT neighborhood_id FROM Neighborhoods WHERE safety_rating >= 9
);
```

### 7. **DELETE Statement**
```sql
-- Delete based on subquery condition (example structure)
DELETE FROM PropertyListings
WHERE property_id NOT IN (
    SELECT property_id FROM Sales
)
AND listing_date < '2024-01-01';
```


## 9. Can a subquery be in FROM clause?

**Yes!** A subquery in the FROM clause is called a **derived table** or **inline view**. It creates a temporary result set that you can query like a regular table.

**Basic Syntax:**
```sql
SELECT columns
FROM (
    SELECT columns FROM table WHERE condition
) AS alias_name
WHERE condition;
```
**Note:** The alias is **mandatory** in most databases.

**Example 1: Simple derived table**
```sql
-- Get neighborhood statistics
SELECT neighborhood, avg_price, property_count
FROM (
    SELECT 
        n.neighborhood_name AS neighborhood,
        AVG(p.listing_price) AS avg_price,
        COUNT(*) AS property_count
    FROM PropertyListings p
    JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id
    GROUP BY n.neighborhood_name
) AS neighborhood_stats
WHERE property_count > 1;
```

**Example 2: Pre-filter data**
```sql
-- Work with expensive properties only
SELECT address, listing_price, price_category
FROM (
    SELECT 
        address,
        listing_price,
        CASE 
            WHEN listing_price < 300000 THEN 'Budget'
            WHEN listing_price BETWEEN 300000 AND 450000 THEN 'Mid-Range'
            ELSE 'Luxury'
        END AS price_category
    FROM PropertyListings
) AS categorized
WHERE price_category = 'Luxury';
```


**Benefits:**
- ✅ Pre-aggregate data before further processing
- ✅ Simplify complex queries into logical steps
- ✅ Improve readability
- ✅ Can apply WHERE/HAVING to aggregated results
- ✅ Reuse complex calculations

**Best Practices:**
- Always provide an alias (required by most databases)
- Use meaningful alias names
- Pre-filter data to reduce size
- Consider creating views for frequently used derived tables

---

## 10. What is a derived table?

A **derived table** is a subquery in the FROM clause that acts as a temporary table within a query. It exists only for the duration of the query execution.

**Definition:**
- Temporary result set created by a subquery
- Used in FROM clause
- Must have an alias
- Can be joined with other tables
- Not stored in database (virtual)

**Basic Structure:**
```sql
SELECT columns
FROM (
    -- This is the derived table
    SELECT columns FROM table WHERE condition
) AS table_alias;
```

**Example 1: Agent performance analysis**
```sql
SELECT agent_name, total_sales, avg_sale_price
FROM (
    SELECT 
        a.agent_name,
        COUNT(s.sale_id) AS total_sales,
        AVG(s.sale_price) AS avg_sale_price,
        SUM(s.sale_price) AS total_value
    FROM Agents a
    JOIN Sales s ON a.agent_id = s.agent_id
    GROUP BY a.agent_name
) AS agent_performance
WHERE total_sales >= 2
ORDER BY total_value DESC;
```

**Example 2: Top performers only**
```sql
-- Get only top 3 neighborhoods by average price
SELECT *
FROM (
    SELECT 
        n.neighborhood_name,
        AVG(p.listing_price) AS avg_price,
        COUNT(*) AS property_count
    FROM PropertyListings p
    JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id
    GROUP BY n.neighborhood_name
    ORDER BY avg_price DESC
    LIMIT 3
) AS top_neighborhoods;
```

**Derived Table vs View:**

| Aspect | Derived Table | View |
|--------|---------------|------|
| **Storage** | Not stored, temporary | Stored definition |
| **Scope** | Single query only | Available to all queries |
| **Performance** | Computed each time | Can be indexed (materialized) |
| **Reusability** | One-time use | Reusable across queries |
| **Syntax** | Inline in FROM clause | CREATE VIEW statement |

**Example: Creating a View (alternative)**
```sql
-- Instead of derived table, create reusable view
CREATE VIEW neighborhood_stats AS
SELECT 
    n.neighborhood_name,
    AVG(p.listing_price) AS avg_price,
    COUNT(*) AS property_count
FROM PropertyListings p
JOIN Neighborhoods n ON p.neighborhood_id = n.neighborhood_id
GROUP BY n.neighborhood_name;

-- Then use it
SELECT * FROM neighborhood_stats WHERE avg_price > 400000;
```

**When to Use Derived Tables:**
- ✅ Need pre-aggregated data for further queries
- ✅ Want to apply WHERE/HAVING to grouped results
- ✅ One-time use, not needed elsewhere
- ✅ Complex multi-step logic
- ✅ Avoid creating permanent views

**Performance Consideration:**
- Derived tables are computed each time the query runs
- For frequently used logic, consider creating a VIEW
- For better performance, consider materialized views
- Ensure underlying tables have proper indexes

---


### Key Concepts to Remember:
1. **Scalar subquery** = 1 value, **Table subquery** = multiple rows/columns
2. **Correlated** = references outer query, **Non-correlated** = independent
3. **EXISTS** is usually faster than **IN** for large datasets
4. **Derived tables** must have aliases
5. Subqueries can be nested multiple levels

### Common Mistakes to Avoid:
❌ Using = with multi-row subquery (use IN instead)  
❌ Forgetting alias for derived tables  
❌ Overusing correlated subqueries (use JOIN when possible)  
❌ Not considering performance implications  
❌ Ignoring NULL handling in subqueries  

### Performance Guidelines:
✅ **Use EXISTS** for existence checks  
✅ **Use JOIN** when you need columns from both tables  
✅ **Use subquery** for complex filtering/aggregations  
✅ **Index** columns used in subquery conditions  
✅ **Test** with EXPLAIN QUERY PLAN  


---
