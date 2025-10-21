1. Difference between NULL and 0?
Answer:

NULL represents the absence of a value or unknown data. It means "no data exists" or "value is not applicable."
0 (zero) is an actual numeric value that represents nothing in quantity but is still a defined value.

Key Differences:

NULL ≠ 0 (they are completely different)
NULL cannot be compared using = operator (use IS NULL instead)
Mathematical operations with NULL return NULL (5 + NULL = NULL)
COUNT(*) counts NULLs, but COUNT(column) doesn't count NULL values

2. What is a default constraint?
Answer:
A default constraint automatically assigns a predefined value to a column when no value is specified during INSERT.

Benefits:

Ensures data consistency
Reduces manual data entry
Prevents NULL values in important fields
Simplifies INSERT statements

3. How does IS NULL work?
Answer:
IS NULL is a SQL operator used to check if a column contains a NULL value. You cannot use = or != with NULL.
NULL represents "unknown", so any comparison with NULL returns NULL (not TRUE or FALSE)
NULL = NULL returns NULL (not TRUE)
Therefore, you must use IS NULL or IS NOT NULL

4. How do you update multiple rows?
Answer:
Use the UPDATE statement with a WHERE clause that matches multiple rows. Without WHERE, ALL rows are updated.
  1. Using IN clause
  2. Using comparison operators
  3. Using pattern matching
  4. Using subqueries
  5. Using AND/OR conditions


5. Can we insert partial values?
Answer:
Yes! You can insert values into specific columns only. Columns not specified will:

Use their DEFAULT value if defined
Be set to NULL if no default exists and NULL is allowed
Cause an error if they are NOT NULL without a default



6. What happens if a NOT NULL field is left empty?
Answer:
If a NOT NULL field is left empty (not specified in INSERT) and it has no DEFAULT constraint, the database will throw an error and the INSERT will fail.


7. How do you rollback a deletion?
Answer:
Use TRANSACTIONS with ROLLBACK to undo deletions before they're permanently committed.
  Using Transactions (RECOMMENDED)
  Testing with SELECT first
  Using Backup (Last Resort)

8. Can we insert values into specific columns only?
Answer:
Yes, absolutely! This is actually the recommended approach in SQL

9. How to insert values using SELECT?
Answer:
Use INSERT INTO ... SELECT to insert data from existing tables. This is powerful for copying, transforming, or migrating data.


10. What is ON DELETE CASCADE?
Answer:
ON DELETE CASCADE is a referential action that automatically deletes child records when the parent record is deleted, maintaining referential integrity.
How it works:
When you delete a row from the parent table, all related rows in child tables are automatically deleted.
