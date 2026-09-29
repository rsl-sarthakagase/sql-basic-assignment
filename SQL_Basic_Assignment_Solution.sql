-- ============================================================
-- DATABASE SETUP
-- ============================================================

CREATE DATABASE IF NOT EXISTS online_bookstore;
USE online_bookstore;

-- ============================================================
-- TABLE CREATION
-- ============================================================

CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INT,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    published_year INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- ============================================================
-- SAMPLE DATA
-- ============================================================

-- At least 5 authors from different countries.
INSERT INTO Authors (author_id, author_name, country) VALUES
(1, 'Robert C. Martin', 'USA'),
(2, 'Andrew Hunt', 'USA'),
(3, 'Yuval Noah Harari', 'Israel'),
(4, 'R. K. Narayan', 'India'),
(5, 'J. K. Rowling', 'United Kingdom'),
(6, 'James Clear', 'USA'),
(7, 'George Orwell', 'United Kingdom');

-- At least 10 books from different categories.
INSERT INTO Books (
    book_id,
    title,
    author_id,
    category,
    price,
    published_year
) VALUES
(1, 'Clean Code', 1, 'Programming', 850.00, 2008),
(2, 'The Pragmatic Programmer', 2, 'Programming', 780.00, 2019),
(3, 'Sapiens', 3, 'History', 650.00, 2011),
(4, 'Atomic Habits', 6, 'Self-Help', 550.00, 2018),
(5, 'The Guide', 4, 'Fiction', 450.00, 1958),
(6, 'Harry Potter and the Philosopher''s Stone', 5, 'Fantasy', 750.00, 1997),
(7, 'Zero to One', 2, 'Business', 620.00, 2014),
(8, '21 Lessons for the 21st Century', 3, 'History', 700.00, 2018),
(9, 'The Clean Coder', 1, 'Programming', 900.00, 2011),
(10, 'Ikigai', 6, 'Self-Help', 500.00, 2021),
(11, 'The Midnight Library', 5, 'Fiction', 720.00, 2020),
(12, 'Start With Why', 2, 'Business', 680.00, 2021),
(13, 'SQL Fundamentals', NULL, 'Programming', 600.00, 2025);

-- ============================================================
-- SECTION 1: BASIC QUERIES
-- ============================================================

-- Task 1: Display all books.
SELECT *
FROM Books;

-- Task 2: Display only the book title and price.
SELECT title, price
FROM Books;

-- Task 3: Display the book title as Book Name and price as Book Price using column aliases.
SELECT
    title AS `Book Name`,
    price AS `Book Price`
FROM Books;

-- Task 4: Display all unique book categories.
SELECT DISTINCT category
FROM Books;

-- ============================================================
-- SECTION 2: FILTERING DATA
-- ============================================================

-- Task 5: Display books priced above ₹700.
SELECT *
FROM Books
WHERE price > 700;

-- Task 6: Display books priced between ₹500 and ₹800.
SELECT *
FROM Books
WHERE price BETWEEN 500 AND 800;

-- Task 7: Display books that belong to the Programming category.
SELECT *
FROM Books
WHERE category = 'Programming';

-- Task 8: Display books whose titles start with the letter S.
SELECT *
FROM Books
WHERE title LIKE 'S%';

-- Task 9: Display books published after 2020.
SELECT *
FROM Books
WHERE published_year > 2020;

-- ============================================================
-- SECTION 3: SORTING AND LIMITING RESULTS
-- ============================================================

-- Task 10: Display books sorted by price in descending order.
SELECT *
FROM Books
ORDER BY price DESC;

-- Task 11: Display the top 3 most expensive books.
SELECT *
FROM Books
ORDER BY price DESC
LIMIT 3;

-- ============================================================
-- SECTION 4: AGGREGATE FUNCTIONS
-- ============================================================

-- Task 12: Find:
--   a) Total number of books
--   b) Total price of all books
--   c) Average book price
--   d) Highest book price
--   e) Lowest book price
SELECT
    COUNT(*) AS `Total Number of Books`,
    SUM(price) AS `Total Price of All Books`,
    AVG(price) AS `Average Book Price`,
    MAX(price) AS `Highest Book Price`,
    MIN(price) AS `Lowest Book Price`
FROM Books;

-- ============================================================
-- SECTION 5: GROUP BY AND HAVING
-- ============================================================

-- Task 13: Display the average book price for each category.
SELECT
    category,
    AVG(price) AS `Average Book Price`
FROM Books
GROUP BY category;

-- Task 14: Display only those categories whose average book price is greater than ₹650.
SELECT
    category,
    AVG(price) AS `Average Book Price`
FROM Books
GROUP BY category
HAVING AVG(price) > 650;

-- ============================================================
-- SECTION 6: JOINS
-- ============================================================

-- Task 15: Display each book along with its author's name using an INNER JOIN.
SELECT
    b.book_id,
    b.title,
    b.category,
    b.price,
    b.published_year,
    a.author_name
FROM Books AS b
INNER JOIN Authors AS a
    ON b.author_id = a.author_id;

-- Task 16: Display all authors along with the books they have written using a LEFT JOIN.
SELECT
    a.author_id,
    a.author_name,
    a.country,
    b.book_id,
    b.title,
    b.category,
    b.price
FROM Authors AS a
LEFT JOIN Books AS b
    ON a.author_id = b.author_id;

-- Task 17: Display all books along with their author details using a RIGHT JOIN.
SELECT
    b.book_id,
    b.title,
    b.category,
    b.price,
    b.published_year,
    a.author_id,
    a.author_name,
    a.country
FROM Authors AS a
RIGHT JOIN Books AS b
    ON a.author_id = b.author_id;

-- ============================================================
-- SECTION 7: DATA MANIPULATION
-- ============================================================

-- Task 18: Insert a new book into the Books table.
INSERT INTO Books (
    book_id,
    title,
    author_id,
    category,
    price,
    published_year
)
VALUES (
    14,
    'SQL Fundamentals',
    1,
    'Programming',
    600.00,
    2025
);

-- Task 19: Update the price of the book you inserted.
UPDATE Books
SET price = 650.00
WHERE book_id = 14;

-- Task 20: Delete the book record that you inserted.
DELETE FROM Books
WHERE book_id = 14;

-- ============================================================
-- SECTION 8: CREATING TABLES AND CONSTRAINTS
-- ============================================================

-- Task 21: Create a new table named Publishers.
-- Constraints applied:
--   publisher_id    -> PRIMARY KEY
--   publisher_name  -> NOT NULL and UNIQUE
--   country         -> NOT NULL and DEFAULT value
--   established_year -> DEFAULT value
CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL UNIQUE,
    country VARCHAR(50) NOT NULL DEFAULT 'India',
    established_year INT DEFAULT 2000
);

DESCRIBE Publishers;
