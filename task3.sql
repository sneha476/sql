-- Library Database Schema

CREATE DATABASE IF NOT EXISTS library_db;
USE library_db;

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    author VARCHAR(30),
    category VARCHAR(20),
    price BIGINT,
    available_copies INT
);

CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    city VARCHAR(20) NOT NULL,
    join_date DATE NOT NULL
);

CREATE TABLE issued_books (
    issued_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    book_id INT,
    issued_date DATE NOT NULL,
    return_date DATE NOT NULL,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
SELECT * FROM members WHERE join_date > '2024-01-01';

SELECT DISTINCT category FROM books;

SELECT * FROM books ORDER BY price DESC;

SELECT COUNT(*) FROM books;

SELECT COUNT(*) AS total_books FROM books;

SELECT COUNT(*) AS total_members FROM members;

SELECT MAX(price) AS highest_price FROM books;

SELECT MIN(price) AS cheapest_price FROM books;

SELECT AVG(price) AS avg_price FROM books;

SELECT SUM(price * available_copies) AS inventory_value
FROM books;

SELECT category, COUNT(*) AS book_count
FROM books
GROUP BY category;

SELECT category, AVG(price) AS avg_category_price
FROM books
GROUP BY category;

SELECT city, COUNT(*) AS members_count
FROM members
GROUP BY city;

SELECT category, COUNT(*) AS book_count
FROM books
GROUP BY category
ORDER BY book_count DESC
LIMIT 1;

SELECT category, COUNT(*) AS book_count
FROM books
GROUP BY category
ORDER BY book_count DESC;

SELECT m.name, b.title
FROM issued_books ib
JOIN members m ON ib.member_id = m.member_id
JOIN books b ON ib.book_id = b.book_id;

SELECT m.name, b.title, ib.issue_date, ib.return_date
FROM issued_books ib
JOIN members m ON ib.member_id = m.member_id
JOIN books b ON ib.book_id = b.book_id;

SELECT ib.issued_id, m.name, b.title, ib.issued_date, ib.return_date
FROM issued_books ib
JOIN members m ON ib.member_id = m.member_id
JOIN books b ON ib.book_id = b.book_id;

SELECT b.*, ib.issue_date, ib.return_date
FROM books b
LEFT JOIN issued_books ib
ON b.book_id = ib.book_id;

SELECT m.member_id, m.name, m.city, m.join_date,
       b.title, ib.issued_date
FROM members m
LEFT JOIN issued_books ib
ON m.member_id = ib.member_id
LEFT JOIN books b
ON ib.book_id = b.book_id;

SELECT m.name,
       COUNT(ib.book_id) AS borrowed_count
FROM members m
LEFT JOIN issued_books ib
ON m.member_id = ib.member_id
GROUP BY m.name;

SELECT b.title,
       COUNT(ib.book_id) AS borrow_count
FROM books b
JOIN issued_books ib
ON b.book_id = ib.book_id
GROUP BY b.title
ORDER BY borrow_count DESC;

SELECT m.name,
       COUNT(ib.book_id) AS borrow_count
FROM members m
JOIN issued_books ib
ON m.member_id = ib.member_id
GROUP BY m.name
ORDER BY borrow_count DESC;

SELECT *
FROM books
WHERE price > (
    SELECT AVG(price)
    FROM books
);

SELECT *
FROM members
WHERE member_id IN (
    SELECT DISTINCT member_id
    FROM issued_books
);

SELECT *
FROM members
WHERE member_id NOT IN (
    SELECT DISTINCT member_id
    FROM issued_books
);

SELECT category
FROM books
GROUP BY category
ORDER BY AVG(price) DESC
LIMIT 1;

SELECT issued_date,
       DATEDIFF(return_date, issued_date)
FROM issued_books;

SELECT b.title,
       ib.issued_date,
       ib.return_date
FROM issued_books ib
JOIN books b
ON ib.book_id = b.book_id
WHERE ib.return_date < CURDATE();