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

-- Maintenance

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
