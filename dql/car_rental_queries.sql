USE driveease_rentals;


-- Maintenance

-- 1. How many maintenance records are there?
-- Demonstrates: COUNT
SELECT COUNT(*) AS total_maintenance_records
FROM Maintenance;


-- 2. How much has DriveEase spent on vehicle maintenance in total?
-- Demonstrates: SUM
SELECT SUM(cost) AS total_maintenance_cost
FROM Maintenance;


-- 3. How much has been spent on maintenance for each car?
-- Demonstrates: GROUP BY and SUM
SELECT car_id, SUM(cost) AS total_cost
FROM Maintenance
GROUP BY car_id;


-- 4. Which maintenance record had the highest cost?
-- Demonstrates: ORDER BY and MAX/highest value
SELECT *
FROM Maintenance
ORDER BY cost DESC
LIMIT 1;


-- 5. What is the average maintenance cost?
-- Demonstrates: AVG
SELECT AVG(cost) AS average_maintenance_cost
FROM Maintenance;


-- CROSS-TABLE / BUSINESS QUESTIONS

-- 1. What cars has each customer rented?
-- Demonstrates: INNER JOIN across Customers, Rentals and Cars

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    ca.registration_number,
    ca.make,
    ca.model,
    r.rental_date,
    r.rental_status
FROM Customers c
JOIN Rentals r
    ON c.customer_id = r.customer_id
JOIN Cars ca
    ON r.car_id = ca.car_id
ORDER BY c.customer_id, r.rental_date;

-- 2. How many rentals has each employee processed?
-- Demonstrates: JOIN, GROUP BY and COUNT

SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    COUNT(r.rental_id) AS total_rentals_processed
FROM Employees e
LEFT JOIN Rentals r
    ON e.employee_id = r.employee_id
GROUP BY
    e.employee_id,
    e.first_name,
    e.last_name
ORDER BY total_rentals_processed DESC;

-- 3. What are the cars in each category and their daily rental rates?
-- Demonstrates: JOIN between Cars and Car_Categories

SELECT
    cc.category_name,
    ca.registration_number,
    ca.make,
    ca.model,
    cc.daily_rate
FROM Car_Categories cc
JOIN Cars ca
    ON cc.category_id = ca.category_id
ORDER BY cc.category_name, ca.registration_number;

-- 4. What cars are available at each branch?
-- Demonstrates: JOIN with WHERE

SELECT
    b.branch_name,
    b.city,
    ca.registration_number,
    ca.make,
    ca.model,
    ca.status
FROM Branches b
JOIN Cars ca
    ON b.branch_id = ca.branch_id
WHERE ca.status = 'Available'
ORDER BY b.branch_name, ca.registration_number;