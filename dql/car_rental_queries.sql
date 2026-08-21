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

-- 5. What is the total payment amount associated with each rental?
-- Demonstrates: JOIN and SUM

SELECT
    r.rental_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(p.amount) AS total_payment
FROM Rentals r
JOIN Customers c
    ON r.customer_id = c.customer_id
JOIN Payments p
    ON r.rental_id = p.rental_id
GROUP BY
    r.rental_id,
    c.first_name,
    c.last_name
ORDER BY r.rental_id;

-- 6. What additional services were selected for each rental?
-- Demonstrates: JOIN across Rentals, RentalServiceDetails and RentalServices

SELECT
    rsd.rental_id,
    rs.service_name,
    rsd.quantity,
    rs.daily_price,
    (rsd.quantity * rs.daily_price) AS service_total
FROM RentalServiceDetails rsd
JOIN RentalServices rs
    ON rsd.service_id = rs.service_id
ORDER BY rsd.rental_id, rs.service_name;



-- ADVANCED DQL QUERIES

-- 1. Which customers made more rentals than the average customer?
-- Demonstrates: Subquery and GROUP BY

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(r.rental_id) AS total_rentals
FROM Customers c
JOIN Rentals r
    ON c.customer_id = r.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(r.rental_id) > (
    SELECT AVG(rental_count)
    FROM (
        SELECT COUNT(*) AS rental_count
        FROM Rentals
        GROUP BY customer_id
    ) AS customer_rentals
)
ORDER BY total_rentals DESC;

-- 2. Which cars were rented more times than the average number of rentals per car?
-- Demonstrates: Subquery and GROUP BY

SELECT
    ca.car_id,
    ca.registration_number,
    ca.make,
    ca.model,
    COUNT(r.rental_id) AS total_rentals
FROM Cars ca
JOIN Rentals r
    ON ca.car_id = r.car_id
GROUP BY
    ca.car_id,
    ca.registration_number,
    ca.make,
    ca.model
HAVING COUNT(r.rental_id) > (
    SELECT AVG(rental_count)
    FROM (
        SELECT COUNT(*) AS rental_count
        FROM Rentals
        GROUP BY car_id
    ) AS car_rentals
)
ORDER BY total_rentals DESC;

-- 3. Which branches have more cars than the average number of cars per branch?
-- Demonstrates: Subquery, JOIN and GROUP BY

SELECT
    b.branch_id,
    b.branch_name,
    COUNT(ca.car_id) AS total_cars
FROM Branches b
JOIN Cars ca
    ON b.branch_id = ca.branch_id
GROUP BY
    b.branch_id,
    b.branch_name
HAVING COUNT(ca.car_id) > (
    SELECT AVG(car_count)
    FROM (
        SELECT COUNT(*) AS car_count
        FROM Cars
        GROUP BY branch_id
    ) AS branch_cars
)
ORDER BY total_cars DESC;

-- 4. Which rental had the highest payment amount?
-- Demonstrates: Subquery and MAX

SELECT
    r.rental_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    p.amount AS payment_amount,
    p.payment_method,
    p.payment_status
FROM Rentals r
JOIN Customers c
    ON r.customer_id = c.customer_id
JOIN Payments p
    ON r.rental_id = p.rental_id
WHERE p.amount = (
    SELECT MAX(amount)
    FROM Payments
);

-- 5. Which rental services were selected more times than the average service selection count?
-- Demonstrates: Subquery, GROUP BY and COUNT

SELECT
    rs.service_id,
    rs.service_name,
    COUNT(rsd.rental_id) AS selection_count
FROM RentalServices rs
JOIN RentalServiceDetails rsd
    ON rs.service_id = rsd.service_id
GROUP BY
    rs.service_id,
    rs.service_name
HAVING COUNT(rsd.rental_id) > (
    SELECT AVG(selection_count)
    FROM (
        SELECT COUNT(*) AS selection_count
        FROM RentalServiceDetails
        GROUP BY service_id
    ) AS service_selections
)
ORDER BY selection_count DESC;

-- 6. Which customers have made at least one rental?
-- Demonstrates: Correlated subquery and EXISTS

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Rentals r
    WHERE r.customer_id = c.customer_id
)
ORDER BY c.customer_id;

-- 7. Which maintenance records have a cost greater than the average maintenance cost for that car?
-- Demonstrates: Correlated subquery

SELECT
    m.maintenance_id,
    m.car_id,
    m.service_date,
    m.description,
    m.cost
FROM Maintenance m
WHERE m.cost > (
    SELECT AVG(m2.cost)
    FROM Maintenance m2
    WHERE m2.car_id = m.car_id
)
ORDER BY m.car_id, m.cost DESC;


-- VIEWS


-- 1: AVAILABLE CARS BY BRANCH
-- Purpose: Shows managers which cars are currently available at each branch.

CREATE OR REPLACE VIEW available_cars_by_branch AS
SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    c.car_id,
    c.registration_number,
    c.make,
    c.model,
    cc.category_name,
    cc.daily_rate
FROM Branches b
JOIN Cars c
    ON b.branch_id = c.branch_id
JOIN Car_Categories cc
    ON c.category_id = cc.category_id
WHERE c.status = 'Available';


-- Example query against the view
SELECT *
FROM available_cars_by_branch
ORDER BY branch_name, category_name;



-- 2: BRANCH RENTAL PERFORMANCE
-- Purpose: Shows rental activity and payment amounts associated with each branch.

CREATE OR REPLACE VIEW branch_rental_performance AS
SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    COUNT(DISTINCT r.rental_id) AS total_rentals,
    COUNT(DISTINCT CASE
        WHEN r.rental_status = 'Completed'
        THEN r.rental_id
    END) AS completed_rentals,
    COUNT(DISTINCT CASE
        WHEN r.rental_status = 'Active'
        THEN r.rental_id
    END) AS active_rentals,
    COALESCE(SUM(p.amount), 0) AS total_payment_amount
FROM Branches b
LEFT JOIN Employees e
    ON b.branch_id = e.branch_id
LEFT JOIN Rentals r
    ON e.employee_id = r.employee_id
LEFT JOIN Payments p
    ON r.rental_id = p.rental_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city;


-- Example query against the view
SELECT *
FROM branch_rental_performance
ORDER BY total_payment_amount DESC;



-- 3: CAR MAINTENANCE SUMMARY
-- Purpose: Helps fleet managers monitor maintenance history and maintenance costs for each vehicle.

CREATE OR REPLACE VIEW car_maintenance_summary AS
SELECT
    c.car_id,
    c.registration_number,
    c.make,
    c.model,
    c.status,
    COUNT(m.maintenance_id) AS maintenance_records,
    COALESCE(SUM(m.cost), 0) AS total_maintenance_cost,
    COALESCE(AVG(m.cost), 0) AS average_maintenance_cost
FROM Cars c
LEFT JOIN Maintenance m
    ON c.car_id = m.car_id
GROUP BY
    c.car_id,
    c.registration_number,
    c.make,
    c.model,
    c.status;


-- Example query against the view
SELECT *
FROM car_maintenance_summary
ORDER BY total_maintenance_cost DESC;

USE driveease_rentals;


-- CAR MANAGEMENT

-- 1. Display all cars with their basic information.
-- Demonstrates: SELECT and ORDER BY

SELECT
    car_id,
    registration_number,
    make,
    model,
    color,
    manufacture_year,
    mileage,
    seats,
    fuel_type,
    transmission,
    status
FROM Cars
ORDER BY registration_number;


-- 2. Which cars are currently available for rental?
-- Demonstrates: WHERE

SELECT
    car_id,
    registration_number,
    make,
    model,
    manufacture_year,
    fuel_type,
    transmission,
    status
FROM Cars
WHERE status = 'Available'
ORDER BY make, model;


-- 3. Which cars are currently rented?
-- Demonstrates: WHERE

SELECT
    car_id,
    registration_number,
    make,
    model,
    status
FROM Cars
WHERE status = 'Rented'
ORDER BY registration_number;


-- 4. How many cars are available, rented, under maintenance,
--    or retired?
-- Demonstrates: GROUP BY and COUNT

SELECT
    status,
    COUNT(*) AS total_cars
FROM Cars
GROUP BY status
ORDER BY total_cars DESC;


-- 5. How many cars are assigned to each branch?
-- Demonstrates: JOIN, GROUP BY and COUNT

SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    COUNT(c.car_id) AS total_cars
FROM Branches b
LEFT JOIN Cars c
    ON b.branch_id = c.branch_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city
ORDER BY total_cars DESC;


-- 6. What is the average mileage of cars at each branch?
-- Demonstrates: JOIN, AVG and GROUP BY

SELECT
    b.branch_name,
    b.city,
    AVG(c.mileage) AS average_mileage
FROM Branches b
JOIN Cars c
    ON b.branch_id = c.branch_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city
ORDER BY average_mileage DESC;


-- 7. Which cars have the highest mileage?
-- Demonstrates: ORDER BY and LIMIT

SELECT
    car_id,
    registration_number,
    make,
    model,
    mileage,
    status
FROM Cars
ORDER BY mileage DESC
LIMIT 5;


-- 8. Which cars were manufactured from 2022 onwards?
-- Demonstrates: comparison operator and WHERE

SELECT
    registration_number,
    make,
    model,
    manufacture_year,
    color,
    mileage
FROM Cars
WHERE manufacture_year >= 2022
ORDER BY manufacture_year DESC;


-- 9. How many cars are available for each fuel type?
-- Demonstrates: WHERE, GROUP BY and COUNT

SELECT
    fuel_type,
    COUNT(*) AS available_cars
FROM Cars
WHERE status = 'Available'
GROUP BY fuel_type
ORDER BY available_cars DESC;


-- 10. Which cars have mileage greater than the average mileage
--     of all cars?
-- Demonstrates: Subquery and AVG

SELECT
    car_id,
    registration_number,
    make,
    model,
    mileage
FROM Cars
WHERE mileage > (
    SELECT AVG(mileage)
    FROM Cars
)
ORDER BY mileage DESC;