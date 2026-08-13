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
('KDA 125A', 'Toyota', 'Fielder', 2021, 'White', 34000, 5, 'Hybrid', 'Automatic', 'Available', 2, 4),
('KDS 126B', 'Nissan', 'March', 2023, 'Silver', 11000, 5, 'Petrol', 'Automatic', 'Available', 1, 4),
('KDT 127C', 'Subaru', 'XV', 2022, 'Blue', 25000, 5, 'Petrol', 'Automatic', 'Rented', 3, 4),
('KDH 128D', 'Toyota', 'Fortuner', 2021, 'Black', 47000, 7, 'Diesel', 'Automatic', 'Available', 5, 4),
('KDQ 129E', 'Ford', 'Everest', 2020, 'Grey', 68000, 7, 'Diesel', 'Automatic', 'Maintenance', 5, 4),
('KDK 130F', 'Isuzu', 'D-Max', 2022, 'White', 22000, 5, 'Diesel', 'Manual', 'Available', 4, 4),
('KDL 131G', 'Honda', 'Civic', 2023, 'Red', 15000, 5, 'Petrol', 'Automatic', 'Available', 2, 4),
('KDU 132H', 'Mazda', 'CX-30', 2024, 'Blue', 5000, 5, 'Petrol', 'Automatic', 'Available', 3, 4),

-- Nakuru Branch
('KDJ 133J', 'Toyota', 'Corolla', 2022, 'White', 27000, 5, 'Petrol', 'Automatic', 'Available', 2, 5),
('KDK 134K', 'Toyota', 'Prado', 2021, 'Black', 51000, 7, 'Diesel', 'Automatic', 'Rented', 5, 5),
('KDL 135L', 'Nissan', 'Note', 2024, 'Silver', 7000, 5, 'Petrol', 'Automatic', 'Available', 1, 5),
('KDM 136M', 'Honda', 'CR-V', 2022, 'Grey', 29000, 5, 'Petrol', 'Automatic', 'Available', 3, 5),
('KDN 137N', 'Mercedes-Benz', 'E200', 2023, 'Black', 13000, 5, 'Petrol', 'Automatic', 'Available', 5, 5),
('KDP 138P', 'Toyota', 'Hilux', 2021, 'White', 48000, 5, 'Diesel', 'Manual', 'Available', 4, 5),
('KDQ 139Q', 'Suzuki', 'Alto', 2023, 'Blue', 10000, 4, 'Petrol', 'Manual', 'Available', 6, 5),
('KDL 140R', 'BMW', '320i', 2022, 'White', 21000, 5, 'Petrol', 'Automatic', 'Available', 5, 5);

SAVEPOINT cars_loaded;

INSERT INTO Maintenance (car_id, service_date, description, cost, mechanic_name) VALUES
(4, '2025-01-20', 'Engine oil and oil filter replacement', 8500.00, 'Peter Mwangi'),
(4, '2025-01-21', 'Front brake pads and discs replaced', 18500.00, 'John Kamau'),

(12, '2025-02-05', 'Engine oil, oil filter and air filter replacement', 9500.00, 'Samuel Otieno'),
(12, '2025-02-06', 'Brake pads inspected and replaced', 12000.00, 'David Kariuki'),

(16, '2025-02-15', 'Engine service, oil change and filter replacement', 14500.00, 'Brian Mutiso'),
(16, '2025-02-16', 'Replacement of two worn tyres', 24000.00, 'James Mwangi'),

(20, '2025-02-25', 'Major engine service and fluid replacement', 32000.00, 'Joseph Kibet'),
(20, '2025-02-26', 'Brake pads and brake fluid replacement', 18000.00, 'Martin Rotich'),

(29, '2025-03-05', 'Engine oil and oil filter replacement', 9000.00, 'Victor Kariuki'),
(29, '2025-03-06', 'Brake pads and rear discs replaced', 21000.00, 'Susan Kemunto'),

(6, '2025-03-15', 'Engine service, filters and fluid inspection', 16000.00, 'Dennis Barasa'),

(9, '2025-03-22', 'Engine oil and oil filter replacement', 8500.00, 'Kevin Otieno'),

(34, '2025-04-02', 'Replacement of worn suspension components', 27500.00, 'Peter Omondi'),

(32, '2025-04-10', 'Brake pads inspected and replaced', 13500.00, 'Eric Odhiambo'),

(2, '2025-04-18', 'Engine oil and oil filter replacement', 9000.00, 'Samuel Kiptoo'),

(27, '2025-05-01', 'Replacement of two worn tyres', 22000.00, 'Martin Rotich'),

(11, '2025-05-12', 'Engine service, filters and fluid inspection', 15000.00, 'Lilian Atieno'),

(10, '2025-05-20', 'Brake pads and brake fluid replacement', 12500.00, 'David Musyoka'),

(18, '2025-06-03', 'Engine oil and oil filter replacement', 8000.00, 'Grace Akoth'),

(22, '2025-06-15', 'Routine inspection and fluid checks', 6500.00, 'Eric Kariuki');

SAVEPOINT cars_loaded;
