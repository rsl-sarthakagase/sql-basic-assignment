# SQL Basic Assignment

## Overview

This project contains the SQL solution for the **SQL (Basic) Assignment** based on an online bookstore database.

The assignment covers:

- Basic SQL queries
- Filtering, sorting, and limiting
- Aggregate functions
- `GROUP BY` and `HAVING`
- `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN`
- `INSERT`, `UPDATE`, and `DELETE`
- Table creation and constraints

## Database Schema

### Authors

- `author_id` — INT, Primary Key
- `author_name` — VARCHAR(100)
- `country` — VARCHAR(50)

### Books

- `book_id` — INT, Primary Key
- `title` — VARCHAR(100)
- `author_id` — INT, Foreign Key
- `category` — VARCHAR(50)
- `price` — DECIMAL(10,2)
- `published_year` — INT

### Publishers

- `publisher_id` — INT, Primary Key
- `publisher_name` — VARCHAR(100), Unique, Not Null
- `country` — VARCHAR(50), Not Null, Default
- `established_year` — INT, Default

```
+----------------------------------+
| Tables_in_sandbox_db |
+----------------------------------+
| authors                          |
| books                            |
| continents                       |
| publishers                       |
+----------------------------------+
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| author_id   | int          | NO   | PRI | NULL    |       |
| author_name | varchar(100) | NO   |     | NULL    |       |
| country     | varchar(50)  | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
+----------------+---------------+------+-----+---------+-------+
| Field          | Type          | Null | Key | Default | Extra |
+----------------+---------------+------+-----+---------+-------+
| book_id        | int           | NO   | PRI | NULL    |       |
| title          | varchar(100)  | NO   |     | NULL    |       |
| author_id      | int           | YES  | MUL | NULL    |       |
| category       | varchar(50)   | NO   |     | NULL    |       |
| price          | decimal(10,2) | NO   |     | NULL    |       |
| published_year | int           | NO   |     | NULL    |       |
+----------------+---------------+------+-----+---------+-------+
```

## How to Execute

1. Open a MySQL 8.0-compatible SQL environment such as SQLize.online or MySQL Workbench.
2. Open `SQL_Basic_Assignment_Solution.sql`.
3. Execute the script from top to bottom.
4. The script creates the database, tables, sample data, and executes all 21 tasks.
