USE driveease_rentals;
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
