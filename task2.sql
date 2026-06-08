-- Online Food Delivery System - SQL Practice Instructions
-- Create a database named food_delivery.
-- Create a customers table with appropriate columns.
-- Create an orders table using CURRENT_DATE as the default order date.
-- Insert 10 customer records.
-- Insert 20 order records.
-- Display all customer details.
-- Display all order details.
-- Find orders placed today.
-- Find orders placed in the last 7 days.
-- Update the quantity of a specific order.
-- Update the city of a customer.
-- Delete an order that was cancelled.
-- Delete a customer who has no orders.
-- Display customer names and their ordered food items using JOIN.
-- Find the total amount spent by each customer.
-- Find the highest-priced order.
-- Find the lowest-priced order.
-- Display the current date, current time, and current timestamp.
-- Calculate the number of days between the order date and today.
-- Generate a report showing customer name, food item, quantity, order date, and total bill sorted by latest order date.
-- Create database
CREATE DATABASE food_delivery;

-- Use database
USE food_delivery;

-- Create customer table
CREATE TABLE customer (
    cust_id INT,
    name VARCHAR(20),
    email VARCHAR(20),
    phone VARCHAR(15),
    city VARCHAR(50)
);

-- Create orders table
CREATE TABLE orders (
    cust_id INT,
    item VARCHAR(20),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE DEFAULT (CURRENT_DATE)
);

-- Modify phone column
ALTER TABLE customer MODIFY phone BIGINT;

-- Insert customers
INSERT INTO customer VALUES
(1,'Amit','amit@gmail.com','98765410','Hyderabad'),
(2,'Sneha','sneha@gmail.com','9876311','Mumbai'),
(3,'Ravi','ravi@gmail.com','98765412','Delhi'),
(4,'Priya','priya@gmail.com','98764313','Chennai'),
(5,'Kiran','kiran@gmail.com','98765432','Bangalore'),
(6,'Meena','meena@gmail.com','98765435','Pune'),
(7,'Arjun','arjun@gmail.com','98765421','Kolkata'),
(8,'Neha','neha@gmail.com','98765432','Jaipur'),
(9,'Raj','raj@gmail.com','98765432','Lucknow'),
(10,'Divya','divya@gmail.com','98765432','Ahmedabad');

-- Add order id column
ALTER TABLE orders ADD o_id INT FIRST;

-- Insert orders
INSERT INTO orders (o_id, cust_id, item, quantity, price) VALUES
(1,1,'Pizza',2,500),
(2,2,'Burger',1,150),
(3,3,'Pasta',3,600),
(4,4,'Sandwich',2,200),
(5,5,'Biryani',1,250),
(6,6,'Noodles',2,300),
(7,7,'Salad',1,120),
(8,8,'Soup',2,180),
(9,9,'Ice Cream',3,450),
(10,10,'Pizza',1,250);

-- View data
SELECT * FROM customer;
SELECT * FROM orders;

-- Update dates
UPDATE orders
SET order_date='2026-06-01'
WHERE o_id IN (6,7,8,9,10);

-- Orders for today
SELECT * FROM orders
WHERE order_date = CURRENT_DATE;

-- Orders from last 7 days
SELECT *
FROM orders
WHERE order_date BETWEEN (CURRENT_DATE - INTERVAL 7 DAY)
AND CURRENT_DATE;

-- Show date 7 days ago
SELECT CURRENT_DATE - INTERVAL 7 DAY;

-- Same query with selected columns
SELECT o_id, cust_id, item, quantity, price, order_date
FROM orders
WHERE order_date BETWEEN (CURRENT_DATE - INTERVAL 7 DAY)
AND CURRENT_DATE;

-- Update quantity
UPDATE orders
SET quantity = 6
WHERE o_id = 6;

-- Update city
UPDATE customer
SET city = 'hyderabad'
WHERE cust_id = 6;

-- Delete records
DELETE FROM orders
WHERE o_id = 1;

DELETE FROM customer
WHERE cust_id = 1;

-- Join customer and orders
SELECT c.name, o.item
FROM customer c
JOIN orders o
ON c.cust_id = o.cust_id;

-- Total amount spent by each customer
SELECT c.name, SUM(price)
FROM customer c
JOIN orders o
ON c.cust_id = o.cust_id
GROUP BY c.name;

-- Maximum price
SELECT MAX(price)
FROM orders;

-- Minimum price
SELECT MIN(price)
FROM orders;

-- Current date
SELECT CURDATE();

-- Current time
SELECT CURTIME();

-- Current date and timegit status
SELECT NOW();

-- Difference in days from current date
SELECT o_id,
       cust_id,
       order_date,
       DATEDIFF(CURRENT_DATE(), order_date) AS days_between
FROM orders;

-- Customer bill report
SELECT c.name,
       o.item,
       o.quantity,
       o.order_date,
       (o.quantity * o.price) AS total_bill
FROM customer c
JOIN orders o
ON c.cust_id = o.cust_id
ORDER BY c.name DESC;