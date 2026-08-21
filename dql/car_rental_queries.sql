USE driveease_rentals;

-- Maintenance
-- 1. How many maintenance records are there?
-- Demonstrates: COUNT
SELECT
    COUNT(*) AS total_maintenance_records
FROM
    Maintenance;

-- 2. How much has DriveEase spent on vehicle maintenance in total?
-- Demonstrates: SUM
SELECT
    SUM(cost) AS total_maintenance_cost
FROM
    Maintenance;

-- 3. How much has been spent on maintenance for each car?
-- Demonstrates: GROUP BY and SUM
SELECT
    car_id,
    SUM(cost) AS total_cost
FROM
    Maintenance
GROUP BY
    car_id;

-- 4. Which maintenance record had the highest cost?
-- Demonstrates: ORDER BY and MAX/highest value
SELECT
    *
FROM
    Maintenance
ORDER BY
    cost DESC
LIMIT
    1;

-- 5. What is the average maintenance cost?
-- Demonstrates: AVG
SELECT
    AVG(cost) AS average_maintenance_cost
FROM
    Maintenance;

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
FROM
    Cars
ORDER BY
    registration_number;

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
FROM
    Cars
WHERE
    status = 'Available'
ORDER BY
    make,
    model;

-- 3. Which cars are currently rented?
-- Demonstrates: WHERE
SELECT
    car_id,
    registration_number,
    make,
    model,
    status
FROM
    Cars
WHERE
    status = 'Rented'
ORDER BY
    registration_number;

-- 4. How many cars are available, rented, under maintenance,
--    or retired?
-- Demonstrates: GROUP BY and COUNT
SELECT
    status,
    COUNT(*) AS total_cars
FROM
    Cars
GROUP BY
    status
ORDER BY
    total_cars DESC;

-- 5. How many cars are assigned to each branch?
-- Demonstrates: JOIN, GROUP BY and COUNT
SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    COUNT(c.car_id) AS total_cars
FROM
    Branches b
    LEFT JOIN Cars c ON b.branch_id = c.branch_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city
ORDER BY
    total_cars DESC;

-- 6. What is the average mileage of cars at each branch?
-- Demonstrates: JOIN, AVG and GROUP BY
SELECT
    b.branch_name,
    b.city,
    AVG(c.mileage) AS average_mileage
FROM
    Branches b
    JOIN Cars c ON b.branch_id = c.branch_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city
ORDER BY
    average_mileage DESC;

-- 7. Which cars have the highest mileage?
-- Demonstrates: ORDER BY and LIMIT
SELECT
    car_id,
    registration_number,
    make,
    model,
    mileage,
    status
FROM
    Cars
ORDER BY
    mileage DESC
LIMIT
    5;

-- 8. Which cars were manufactured from 2022 onwards?
-- Demonstrates: comparison operator and WHERE
SELECT
    registration_number,
    make,
    model,
    manufacture_year,
    color,
    mileage
FROM
    Cars
WHERE
    manufacture_year >= 2022
ORDER BY
    manufacture_year DESC;

-- 9. How many cars are available for each fuel type?
-- Demonstrates: WHERE, GROUP BY and COUNT
SELECT
    fuel_type,
    COUNT(*) AS available_cars
FROM
    Cars
WHERE
    status = 'Available'
GROUP BY
    fuel_type
ORDER BY
    available_cars DESC;

-- 10. Which cars have mileage greater than the average mileage
--     of all cars?
-- Demonstrates: Subquery and AVG
SELECT
    car_id,
    registration_number,
    make,
    model,
    mileage
FROM
    Cars
WHERE
    mileage > (
        SELECT
            AVG(mileage)
        FROM
            Cars
    )
ORDER BY
    mileage DESC;

-- Employees 
-- 1. How many employees work for DriveEase Rentals? 
-- Demonstrates: COUNT 
SELECT
    COUNT(*) AS total_employees
FROM
    Employees;

-- 2. What are the names, job titles, and hire dates of all employees? 
-- Demonstrates: SELECT and ORDER BY 
SELECT
    CONCAT(first_name, ' ', last_name) AS employee_name,
    job_title,
    hire_date
FROM
    Employees
ORDER BY
    hire_date;

-- 3. Which employees work at each branch? 
-- Demonstrates: JOIN 
SELECT
    b.branch_name,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    e.job_title
FROM
    Employees e
    JOIN Branches b ON e.branch_id = b.branch_id
ORDER BY
    b.branch_name,
    employee_name;

-- 4. How many employees work at each branch? 
-- Demonstrates: JOIN, GROUP BY and COUNT 
SELECT
    b.branch_name,
    COUNT(e.employee_id) AS total_employees
FROM
    Branches b
    LEFT JOIN Employees e ON b.branch_id = e.branch_id
GROUP BY
    b.branch_id,
    b.branch_name
ORDER BY
    total_employees DESC;

-- 5. Which employees were hired after 2023? 
-- Demonstrates: WHERE 
SELECT
    employee_id,
    CONCAT(first_name, ' ', last_name) AS employee_name,
    job_title,
    hire_date
FROM
    Employees
WHERE
    hire_date > '2023-12-31'
ORDER BY
    hire_date;

-- Customers 
-- 1. How many customers are registered with DriveEase Rentals? 
-- Demonstrates: COUNT 
SELECT
    COUNT(*) AS total_customers
FROM
    Customers;

-- 2. What are the names, phone numbers, and email addresses of all customers? 
-- Demonstrates: SELECT and ORDER BY 
SELECT
    CONCAT(first_name, ' ', last_name) AS customer_name,
    phone,
    email
FROM
    Customers
ORDER BY
    customer_name;

-- 3. Which customers are registered from each city or location? 
-- Demonstrates: SELECT and ORDER BY 
SELECT
    address,
    CONCAT(first_name, ' ', last_name) AS customer_name,
    phone,
    email
FROM
    Customers
ORDER BY
    address,
    customer_name;

-- 4. Which customers registered during 2025? 
-- Demonstrates: WHERE 
SELECT
    customer_id,
    CONCAT(first_name, ' ', last_name) AS customer_name,
    email,
    phone,
    date_registered
FROM
    Customers
WHERE
    date_registered >= '2025-01-01'
    AND date_registered < '2026-01-01'
ORDER BY
    date_registered;

-- 5. Which customers have made more than one rental? 
-- Demonstrates: JOIN, GROUP BY, COUNT and HAVING 
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(r.rental_id) AS total_rentals
FROM
    Customers c
    JOIN Rentals r ON c.customer_id = r.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    COUNT(r.rental_id) > 1
ORDER BY
    total_rentals DESC;

-- Branches 
-- 1. How many branches does DriveEase Rentals have? 
-- Demonstrates: COUNT 
SELECT
    COUNT(*) AS total_branches
FROM
    Branches;

-- 2. What are the names, cities, addresses, and phone numbers of all branches? 
-- Demonstrates: SELECT and ORDER BY 
SELECT
    branch_name,
    city,
    address,
    phone
FROM
    Branches
ORDER BY
    branch_name;

-- 3. How many employees work at each branch? 
-- Demonstrates: JOIN, GROUP BY and COUNT 
SELECT
    b.branch_name,
    COUNT(e.employee_id) AS total_employees
FROM
    Branches b
    LEFT JOIN Employees e ON b.branch_id = e.branch_id
GROUP BY
    b.branch_id,
    b.branch_name
ORDER BY
    total_employees DESC;

-- 4. How many cars are assigned to each branch? 
-- Demonstrates: JOIN, GROUP BY and COUNT 
SELECT
    b.branch_name,
    COUNT(c.car_id) AS total_cars
FROM
    Branches b
    LEFT JOIN Cars c ON b.branch_id = c.branch_id
GROUP BY
    b.branch_id,
    b.branch_name
ORDER BY
    total_cars DESC;

-- 5. Which branch has the most cars? 
-- Demonstrates: JOIN, GROUP BY, COUNT and ORDER BY 
SELECT
    b.branch_id,
    b.branch_name,
    COUNT(c.car_id) AS total_cars
FROM
    Branches b
    LEFT JOIN Cars c ON b.branch_id = c.branch_id
GROUP BY
    b.branch_id,
    b.branch_name
ORDER BY
    total_cars DESC
LIMIT
    1;

-- Car Categories 
-- 1. How many car categories are available? 
-- Demonstrates: COUNT 
SELECT
    COUNT(*) AS total_car_categories
FROM
    Car_Categories;

-- 2. What are the names and daily rental rates of all car categories? 
-- Demonstrates: SELECT and ORDER BY 
SELECT
    category_name,
    daily_rate
FROM
    Car_Categories
ORDER BY
    category_name;

-- 3. Which car category has the highest daily rental rate? 
-- Demonstrates: ORDER BY and LIMIT 
SELECT
    category_name,
    daily_rate
FROM
    Car_Categories
ORDER BY
    daily_rate DESC
LIMIT
    1;

-- 4. Which car category has the lowest daily rental rate? 
-- Demonstrates: ORDER BY and LIMIT 
SELECT
    category_name,
    daily_rate
FROM
    Car_Categories
ORDER BY
    daily_rate ASC
LIMIT
    1;

-- 5. How many cars belong to each category? 
-- Demonstrates: JOIN, GROUP BY and COUNT 
SELECT
    cc.category_name,
    COUNT(c.car_id) AS total_cars
FROM
    Car_Categories cc
    LEFT JOIN Cars c ON cc.category_id = c.category_id
GROUP BY
    cc.category_id,
    cc.category_name
ORDER BY
    total_cars DESC;

-- Rentals 
-- 1. How many rentals have been completed, are currently active, and have been cancelled? 
-- Demonstrates: GROUP BY and COUNT 
SELECT
    rental_status,
    COUNT(*) AS total_rentals
FROM
    Rentals
GROUP BY
    rental_status
ORDER BY
    rental_status;

-- 2. Which rentals are currently active? 
-- Demonstrates: WHERE 
SELECT
    rental_id,
    customer_id,
    car_id,
    employee_id,
    rental_date,
    expected_return_date,
    rental_status
FROM
    Rentals
WHERE
    rental_status = 'Active'
ORDER BY
    rental_date;

-- 3. Which rentals were completed after their expected return date? 
-- Demonstrates: WHERE and date comparison 
SELECT
    rental_id,
    customer_id,
    car_id,
    rental_date,
    expected_return_date,
    actual_return_date
FROM
    Rentals
WHERE
    rental_status = 'Completed'
    AND actual_return_date > expected_return_date
ORDER BY
    actual_return_date;

-- 4. Which customers have made the most rentals? 
-- Demonstrates: JOIN, GROUP BY, COUNT and ORDER BY 
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(r.rental_id) AS total_rentals
FROM
    Customers c
    JOIN Rentals r ON c.customer_id = r.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    total_rentals DESC;

-- 5. What is the average duration of completed rentals? 
-- Demonstrates: AVG and DATEDIFF 
SELECT
    AVG(DATEDIFF(actual_return_date, rental_date)) AS average_rental_duration_days
FROM
    Rentals
WHERE
    rental_status = 'Completed';

-- Payments 
-- 1. How many payments have been made using each payment method? 
-- Demonstrates: GROUP BY and COUNT 
SELECT
    payment_method,
    COUNT(payment_id) AS total_payments
FROM
    Payments
GROUP BY
    payment_method
ORDER BY
    total_payments DESC;

-- 2. How much money has been received through each payment method? 
-- Demonstrates: GROUP BY and SUM 
SELECT
    payment_method,
    SUM(amount) AS total_amount_received
FROM
    Payments
WHERE
    payment_status = 'Paid'
GROUP BY
    payment_method
ORDER BY
    total_amount_received DESC;

-- 3. How many payments are Paid, Pending, and Refunded? 
-- Demonstrates: GROUP BY and COUNT 
SELECT
    payment_status,
    COUNT(payment_id) AS total_payments
FROM
    Payments
GROUP BY
    payment_status
ORDER BY
    total_payments DESC;

-- 4. Which rentals have pending payments? 
-- Demonstrates: JOIN and WHERE 
SELECT
    p.rental_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    p.amount,
    p.payment_date,
    p.payment_method,
    p.payment_status
FROM
    Payments p
    JOIN Rentals r ON p.rental_id = r.rental_id
    JOIN Customers c ON r.customer_id = c.customer_id
WHERE
    p.payment_status = 'Pending'
ORDER BY
    p.rental_id;

-- 5. What is the average payment amount? 
-- Demonstrates: AVG 
SELECT
    AVG(amount) AS average_payment_amount
FROM
    Payments;

-- Rental Services 
-- 1. How many additional rental services are offered? 
-- Demonstrates: COUNT 
SELECT
    COUNT(*) AS total_rental_services
FROM
    RentalServices;

-- 2. What are the available rental services and their daily prices? 
-- Demonstrates: SELECT and ORDER BY 
SELECT
    service_id,
    service_name,
    daily_price
FROM
    RentalServices
ORDER BY
    daily_price;

-- 3. Which rental service is the most expensive per day? 
-- Demonstrates: ORDER BY and LIMIT 
SELECT
    service_id,
    service_name,
    daily_price
FROM
    RentalServices
ORDER BY
    daily_price DESC
LIMIT
    1;

-- 4. Which rental service is the cheapest per day? 
-- Demonstrates: ORDER BY and LIMIT 
SELECT
    service_id,
    service_name,
    daily_price
FROM
    RentalServices
ORDER BY
    daily_price ASC
LIMIT
    1;

-- 5. What is the average daily price of the additional services? 
-- Demonstrates: AVG 
SELECT
    AVG(daily_price) AS average_daily_price
FROM
    RentalServices;

-- Rental Service Details 
-- 1. Which additional services have been added to each rental? 
-- Demonstrates: JOIN 
SELECT
    rsd.rental_id,
    rs.service_name,
    rsd.quantity,
    rs.daily_price,
    (rsd.quantity * rs.daily_price) AS service_total
FROM
    RentalServiceDetails rsd
    JOIN RentalServices rs ON rsd.service_id = rs.service_id
ORDER BY
    rsd.rental_id,
    rs.service_name;

-- 2. How many times has each rental service been selected? 
-- Demonstrates: JOIN, GROUP BY and COUNT 
SELECT
    rs.service_id,
    rs.service_name,
    COUNT(rsd.rental_id) AS selection_count
FROM
    RentalServices rs
    JOIN RentalServiceDetails rsd ON rs.service_id = rsd.service_id
GROUP BY
    rs.service_id,
    rs.service_name
ORDER BY
    selection_count DESC;

-- 3. Which rental service has been selected the most times? 
-- Demonstrates: JOIN, GROUP BY, COUNT and ORDER BY 
SELECT
    rs.service_id,
    rs.service_name,
    COUNT(rsd.rental_id) AS selection_count
FROM
    RentalServices rs
    JOIN RentalServiceDetails rsd ON rs.service_id = rsd.service_id
GROUP BY
    rs.service_id,
    rs.service_name
ORDER BY
    selection_count DESC
LIMIT
    1;

-- 4. Which rentals have more than one additional service? 
-- Demonstrates: JOIN, GROUP BY, COUNT and HAVING 
SELECT
    rsd.rental_id,
    COUNT(rsd.service_id) AS total_services
FROM
    RentalServiceDetails rsd
GROUP BY
    rsd.rental_id
HAVING
    COUNT(rsd.service_id) > 1
ORDER BY
    total_services DESC;

-- 5. Which rentals have no additional services? 
-- Demonstrates: LEFT JOIN and WHERE 
SELECT
    r.rental_id,
    r.customer_id,
    r.car_id,
    r.rental_date,
    r.rental_status
FROM
    Rentals r
    LEFT JOIN RentalServiceDetails rsd ON r.rental_id = rsd.rental_id
WHERE
    rsd.rental_id IS NULL
ORDER BY
    r.rental_id;

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
FROM
    Customers c
    JOIN Rentals r ON c.customer_id = r.customer_id
    JOIN Cars ca ON r.car_id = ca.car_id
ORDER BY
    c.customer_id,
    r.rental_date;

-- 2. How many rentals has each employee processed?
-- Demonstrates: JOIN, GROUP BY and COUNT
SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    COUNT(r.rental_id) AS total_rentals_processed
FROM
    Employees e
    LEFT JOIN Rentals r ON e.employee_id = r.employee_id
GROUP BY
    e.employee_id,
    e.first_name,
    e.last_name
ORDER BY
    total_rentals_processed DESC;

-- 3. What are the cars in each category and their daily rental rates?
-- Demonstrates: JOIN between Cars and Car_Categories
SELECT
    cc.category_name,
    ca.registration_number,
    ca.make,
    ca.model,
    cc.daily_rate
FROM
    Car_Categories cc
    JOIN Cars ca ON cc.category_id = ca.category_id
ORDER BY
    cc.category_name,
    ca.registration_number;

-- 4. What cars are available at each branch?
-- Demonstrates: JOIN with WHERE
SELECT
    b.branch_name,
    b.city,
    ca.registration_number,
    ca.make,
    ca.model,
    ca.status
FROM
    Branches b
    JOIN Cars ca ON b.branch_id = ca.branch_id
WHERE
    ca.status = 'Available'
ORDER BY
    b.branch_name,
    ca.registration_number;

-- 5. What is the total payment amount associated with each rental?
-- Demonstrates: JOIN and SUM
SELECT
    r.rental_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(p.amount) AS total_payment
FROM
    Rentals r
    JOIN Customers c ON r.customer_id = c.customer_id
    JOIN Payments p ON r.rental_id = p.rental_id
GROUP BY
    r.rental_id,
    c.first_name,
    c.last_name
ORDER BY
    r.rental_id;

-- 6. What additional services were selected for each rental?
-- Demonstrates: JOIN across Rentals, RentalServiceDetails and RentalServices
SELECT
    rsd.rental_id,
    rs.service_name,
    rsd.quantity,
    rs.daily_price,
    (rsd.quantity * rs.daily_price) AS service_total
FROM
    RentalServiceDetails rsd
    JOIN RentalServices rs ON rsd.service_id = rs.service_id
ORDER BY
    rsd.rental_id,
    rs.service_name;

-- ADVANCED DQL QUERIES
-- 1. Which customers made more rentals than the average customer?
-- Demonstrates: Subquery and GROUP BY
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(r.rental_id) AS total_rentals
FROM
    Customers c
    JOIN Rentals r ON c.customer_id = r.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    COUNT(r.rental_id) > (
        SELECT
            AVG(rental_count)
        FROM
            (
                SELECT
                    COUNT(*) AS rental_count
                FROM
                    Rentals
                GROUP BY
                    customer_id
            ) AS customer_rentals
    )
ORDER BY
    total_rentals DESC;

-- 2. Which cars were rented more times than the average number of rentals per car?
-- Demonstrates: Subquery and GROUP BY
SELECT
    ca.car_id,
    ca.registration_number,
    ca.make,
    ca.model,
    COUNT(r.rental_id) AS total_rentals
FROM
    Cars ca
    JOIN Rentals r ON ca.car_id = r.car_id
GROUP BY
    ca.car_id,
    ca.registration_number,
    ca.make,
    ca.model
HAVING
    COUNT(r.rental_id) > (
        SELECT
            AVG(rental_count)
        FROM
            (
                SELECT
                    COUNT(*) AS rental_count
                FROM
                    Rentals
                GROUP BY
                    car_id
            ) AS car_rentals
    )
ORDER BY
    total_rentals DESC;

-- 3. Which branches have more cars than the average number of cars per branch?
-- Demonstrates: Subquery, JOIN and GROUP BY
SELECT
    b.branch_id,
    b.branch_name,
    COUNT(ca.car_id) AS total_cars
FROM
    Branches b
    JOIN Cars ca ON b.branch_id = ca.branch_id
GROUP BY
    b.branch_id,
    b.branch_name
HAVING
    COUNT(ca.car_id) > (
        SELECT
            AVG(car_count)
        FROM
            (
                SELECT
                    COUNT(*) AS car_count
                FROM
                    Cars
                GROUP BY
                    branch_id
            ) AS branch_cars
    )
ORDER BY
    total_cars DESC;

-- 4. Which rental had the highest payment amount?
-- Demonstrates: Subquery and MAX
SELECT
    r.rental_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    p.amount AS payment_amount,
    p.payment_method,
    p.payment_status
FROM
    Rentals r
    JOIN Customers c ON r.customer_id = c.customer_id
    JOIN Payments p ON r.rental_id = p.rental_id
WHERE
    p.amount = (
        SELECT
            MAX(amount)
        FROM
            Payments
    );

-- 5. Which rental services were selected more times than the average service selection count?
-- Demonstrates: Subquery, GROUP BY and COUNT
SELECT
    rs.service_id,
    rs.service_name,
    COUNT(rsd.rental_id) AS selection_count
FROM
    RentalServices rs
    JOIN RentalServiceDetails rsd ON rs.service_id = rsd.service_id
GROUP BY
    rs.service_id,
    rs.service_name
HAVING
    COUNT(rsd.rental_id) > (
        SELECT
            AVG(selection_count)
        FROM
            (
                SELECT
                    COUNT(*) AS selection_count
                FROM
                    RentalServiceDetails
                GROUP BY
                    service_id
            ) AS service_selections
    )
ORDER BY
    selection_count DESC;

-- 6. Which customers have made at least one rental?
-- Demonstrates: Correlated subquery and EXISTS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM
    Customers c
WHERE
    EXISTS (
        SELECT
            1
        FROM
            Rentals r
        WHERE
            r.customer_id = c.customer_id
    )
ORDER BY
    c.customer_id;

-- 7. Which maintenance records have a cost greater than the average maintenance cost for that car?
-- Demonstrates: Correlated subquery
SELECT
    m.maintenance_id,
    m.car_id,
    m.service_date,
    m.description,
    m.cost
FROM
    Maintenance m
WHERE
    m.cost > (
        SELECT
            AVG(m2.cost)
        FROM
            Maintenance m2
        WHERE
            m2.car_id = m.car_id
    )
ORDER BY
    m.car_id,
    m.cost DESC;

-- VIEWS
-- 1: AVAILABLE CARS BY BRANCH
-- Purpose: Shows managers which cars are currently available at each branch.
CREATE
OR REPLACE VIEW available_cars_by_branch AS
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
FROM
    Branches b
    JOIN Cars c ON b.branch_id = c.branch_id
    JOIN Car_Categories cc ON c.category_id = cc.category_id
WHERE
    c.status = 'Available';

-- Example query against the view
SELECT
    *
FROM
    available_cars_by_branch
ORDER BY
    branch_name,
    category_name;

-- 2: BRANCH RENTAL PERFORMANCE
-- Purpose: Shows rental activity and payment amounts associated with each branch.
CREATE
OR REPLACE VIEW branch_rental_performance AS
SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    COUNT(DISTINCT r.rental_id) AS total_rentals,
    COUNT(
        DISTINCT CASE
            WHEN r.rental_status = 'Completed' THEN r.rental_id
        END
    ) AS completed_rentals,
    COUNT(
        DISTINCT CASE
            WHEN r.rental_status = 'Active' THEN r.rental_id
        END
    ) AS active_rentals,
    COALESCE(SUM(p.amount), 0) AS total_payment_amount
FROM
    Branches b
    LEFT JOIN Employees e ON b.branch_id = e.branch_id
    LEFT JOIN Rentals r ON e.employee_id = r.employee_id
    LEFT JOIN Payments p ON r.rental_id = p.rental_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city;

-- Example query against the view
SELECT
    *
FROM
    branch_rental_performance
ORDER BY
    total_payment_amount DESC;

-- 3: CAR MAINTENANCE SUMMARY
-- Purpose: Helps fleet managers monitor maintenance history and maintenance costs for each vehicle.
CREATE
OR REPLACE VIEW car_maintenance_summary AS
SELECT
    c.car_id,
    c.registration_number,
    c.make,
    c.model,
    c.status,
    COUNT(m.maintenance_id) AS maintenance_records,
    COALESCE(SUM(m.cost), 0) AS total_maintenance_cost,
    COALESCE(AVG(m.cost), 0) AS average_maintenance_cost
FROM
    Cars c
    LEFT JOIN Maintenance m ON c.car_id = m.car_id
GROUP BY
    c.car_id,
    c.registration_number,
    c.make,
    c.model,
    c.status;

-- Example query against the view
SELECT
    *
FROM
    car_maintenance_summary
ORDER BY
    total_maintenance_cost DESC;