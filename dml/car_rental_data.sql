USE driveease_rentals;

-- Clear existing data before seeding
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE RentalServiceDetails;
TRUNCATE TABLE RentalServices;
TRUNCATE TABLE Payments;
TRUNCATE TABLE Maintenance;
TRUNCATE TABLE Rentals;
TRUNCATE TABLE Cars;
TRUNCATE TABLE Employees;
TRUNCATE TABLE Car_Categories;
TRUNCATE TABLE Branches;
TRUNCATE TABLE Customers;

SET FOREIGN_KEY_CHECKS = 1;

-- =====================================================
-- CARS DATA
-- =====================================================

INSERT INTO Cars (
    registration_number,
    make,
    model,
    manufacture_year,
    color,
    mileage,
    seats,
    fuel_type,
    transmission,
    status,
    category_id,
    branch_id
)
VALUES
-- Nairobi CBD Branch
('KDA 101A', 'Toyota', 'Corolla', 2022, 'White', 28500, 5, 'Petrol', 'Automatic', 'Available', 2, 1),
('KDB 102B', 'Toyota', 'Prado', 2021, 'Black', 47000, 7, 'Diesel', 'Automatic', 'Rented', 3, 1),
('KDC 103C', 'Mazda', 'Demio', 2023, 'Silver', 18000, 5, 'Petrol', 'Automatic', 'Available', 1, 1),
('KDD 104D', 'Subaru', 'Forester', 2020, 'Blue', 65000, 5, 'Petrol', 'Automatic', 'Maintenance', 3, 1),
('KDE 105E', 'Mercedes-Benz', 'C200', 2022, 'Black', 22000, 5, 'Petrol', 'Automatic', 'Available', 5, 1),
('KDF 106F', 'Isuzu', 'D-Max', 2021, 'White', 54000, 5, 'Diesel', 'Manual', 'Available', 4, 1),
('KDG 107G', 'Nissan', 'Note', 2023, 'Red', 12000, 5, 'Petrol', 'Automatic', 'Available', 1, 1),
('KDH 108H', 'BMW', 'X5', 2022, 'Grey', 26000, 5, 'Diesel', 'Automatic', 'Rented', 5, 1),

-- Westlands Branch
('KDJ 109J', 'Toyota', 'Hilux', 2021, 'White', 51000, 5, 'Diesel', 'Manual', 'Available', 4, 2),
('KDK 110K', 'Honda', 'Fit', 2022, 'Silver', 24000, 5, 'Petrol', 'Automatic', 'Available', 1, 2),
('KDL 111L', 'Toyota', 'RAV4', 2021, 'Blue', 46000, 5, 'Petrol', 'Automatic', 'Available', 3, 2),
('KDM 112M', 'Toyota', 'Premio', 2020, 'Black', 62000, 5, 'Petrol', 'Automatic', 'Rented', 2, 2),
('KDN 113N', 'Mercedes-Benz', 'GLE', 2023, 'White', 15000, 5, 'Petrol', 'Automatic', 'Available', 5, 2),
('KDP 114P', 'Mazda', 'CX-5', 2022, 'Grey', 28000, 5, 'Petrol', 'Automatic', 'Available', 3, 2),
('KDQ 115Q', 'Suzuki', 'Alto', 2024, 'White', 6000, 4, 'Petrol', 'Manual', 'Available', 6, 2),
('KDR 116R', 'Ford', 'Ranger', 2021, 'Orange', 45000, 5, 'Diesel', 'Manual', 'Maintenance', 4, 2),

-- Mombasa Branch
('KDS 117S', 'Toyota', 'Axio', 2022, 'Silver', 26000, 5, 'Petrol', 'Automatic', 'Available', 2, 3),
('KDT 118T', 'Nissan', 'X-Trail', 2021, 'White', 42000, 5, 'Petrol', 'Automatic', 'Available', 3, 3),
('KDU 119U', 'Honda', 'Vezel', 2022, 'Blue', 30000, 5, 'Hybrid', 'Automatic', 'Rented', 3, 3),
('KDV 120V', 'Toyota', 'Land Cruiser', 2020, 'Black', 75000, 7, 'Diesel', 'Automatic', 'Available', 5, 3),
('KDW 121W', 'Isuzu', 'MU-X', 2023, 'Grey', 18000, 7, 'Diesel', 'Automatic', 'Available', 3, 3),
('KDX 122X', 'Mazda', 'Axela', 2021, 'Red', 39000, 5, 'Petrol', 'Automatic', 'Available', 2, 3),
('KDY 123Y', 'Suzuki', 'Swift', 2024, 'White', 8500, 5, 'Petrol', 'Manual', 'Available', 1, 3),
('KDZ 124Z', 'Toyota', 'Hilux', 2022, 'Black', 33000, 5, 'Diesel', 'Manual', 'Available', 4, 3),

-- Kisumu Branch
('KEA 125A', 'Toyota', 'Fielder', 2021, 'White', 34000, 5, 'Hybrid', 'Automatic', 'Available', 2, 4),
('KEB 126B', 'Nissan', 'March', 2023, 'Silver', 11000, 5, 'Petrol', 'Automatic', 'Available', 1, 4),
('KEC 127C', 'Subaru', 'XV', 2022, 'Blue', 25000, 5, 'Petrol', 'Automatic', 'Rented', 3, 4),
('KED 128D', 'Toyota', 'Fortuner', 2021, 'Black', 47000, 7, 'Diesel', 'Automatic', 'Available', 5, 4),
('KEE 129E', 'Ford', 'Everest', 2020, 'Grey', 68000, 7, 'Diesel', 'Automatic', 'Maintenance', 5, 4),
('KEF 130F', 'Isuzu', 'D-Max', 2022, 'White', 22000, 5, 'Diesel', 'Manual', 'Available', 4, 4),
('KEG 131G', 'Honda', 'Civic', 2023, 'Red', 15000, 5, 'Petrol', 'Automatic', 'Available', 2, 4),
('KEH 132H', 'Mazda', 'CX-30', 2024, 'Blue', 5000, 5, 'Petrol', 'Automatic', 'Available', 3, 4),

-- Nakuru Branch
('KEJ 133J', 'Toyota', 'Corolla', 2022, 'White', 27000, 5, 'Petrol', 'Automatic', 'Available', 2, 5),
('KEK 134K', 'Toyota', 'Prado', 2021, 'Black', 51000, 7, 'Diesel', 'Automatic', 'Rented', 5, 5),
('KEL 135L', 'Nissan', 'Note', 2024, 'Silver', 7000, 5, 'Petrol', 'Automatic', 'Available', 1, 5),
('KEM 136M', 'Honda', 'CR-V', 2022, 'Grey', 29000, 5, 'Petrol', 'Automatic', 'Available', 3, 5),
('KEN 137N', 'Mercedes-Benz', 'E200', 2023, 'Black', 13000, 5, 'Petrol', 'Automatic', 'Available', 5, 5),
('KEP 138P', 'Toyota', 'Hilux', 2021, 'White', 48000, 5, 'Diesel', 'Manual', 'Available', 4, 5),
('KEQ 139Q', 'Suzuki', 'Alto', 2023, 'Blue', 10000, 4, 'Petrol', 'Manual', 'Available', 6, 5),
('KER 140R', 'BMW', '320i', 2022, 'White', 21000, 5, 'Petrol', 'Automatic', 'Available', 5, 5);

SAVEPOINT cars_loaded;