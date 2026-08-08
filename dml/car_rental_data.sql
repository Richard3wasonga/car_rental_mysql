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