-- DriveEase Rentals Database

CREATE DATABASE IF NOT EXISTS driveease_rentals;

USE driveease_rentals;

create table Branches(
branch_id int primary key
);

CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    job_title VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    branch_id INT NOT NULL,
    
    CONSTRAINT fk_employee_branch
        FOREIGN KEY (branch_id) 
        REFERENCES Branches(branch_id)
        ON UPDATE CASCADE 
        ON DELETE RESTRICT 
);
CREATE TABLE cars (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    registration_number VARCHAR(20) NOT NULL UNIQUE,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    color VARCHAR(30) NOT NULL,
    fuel_type ENUM('Petrol', 'Diesel', 'Hybrid', 'Electric') NOT NULL,
    transmission ENUM('Manual', 'Automatic') NOT NULL,
    seats INT NOT NULL,
    daily_rate DECIMAL(10,2) NOT NULL,
    status ENUM('Available', 'Rented', 'Maintenance') NOT NULL DEFAULT 'Available',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS Rentals (    rental_id INTEGER PRIMARY KEY AUTOINCREMENT,    customer_name TEXT NOT NULL);CREATE TABLE IF NOT EXISTS Payments (    payment_id INTEGER PRIMARY KEY AUTOINCREMENT,    rental_id INTEGER NOT NULL,    payment_date DATE NOT NULL,    amount DECIMAL(10, 2) NOT NULL,    payment_method TEXT CHECK (payment_method IN ('Cash', 'Card', 'M-Pesa')),    payment_status TEXT CHECK (payment_status IN ('Paid', 'Pending', 'Refunded')),    FOREIGN KEY (rental_id) REFERENCES Rentals(rental_id));INSERT INTO Rentals (rental_id, customer_name) VALUES     (101, 'John Doe'),    (102, 'Jane Smith'),    (103, 'Alex Mercer'),    (104, 'Sarah Connor');INSERT INTO Payments (rental_id, payment_date, amount, payment_method, payment_status) VALUES     (101, '2026-08-01', 150.00, 'Card', 'Paid'),    (102, '2026-08-02', 75.50, 'M-Pesa', 'Paid'),    (103, '2026-08-03', 200.00, 'Cash', 'Pending'),    (104, '2026-08-04', 50.00, 'Card', 'Refunded');SELECT * FROM Payments;
Collapse file‎Gymforever-main/payment.sql‎Copy file name to clipboard+28Lines changed: 28 additions & 0 deletionsOriginal file line numberDiff line numberDiff line change
CREATE TABLE Maintenance (
    maintenance_id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT NOT NULL,
    service_date DATE NOT NULL,
    description TEXT NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    mechanic_name VARCHAR(100) NOT NULL,

    CONSTRAINT fk_maintenance_car
        FOREIGN KEY (car_id)
    CREATE TABLE IF NOT EXISTS Rentals (
    rental_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Payments (
    payment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    rental_id INTEGER NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method TEXT CHECK (payment_method IN ('Cash', 'Card', 'M-Pesa')),
    payment_status TEXT CHECK (payment_status IN ('Paid', 'Pending', 'Refunded')),
    FOREIGN KEY (rental_id) REFERENCES Rentals(rental_id)
);

INSERT INTO Rentals (rental_id, customer_name) VALUES 
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Alex Mercer'),
    (104, 'Sarah Connor');

INSERT INTO Payments (rental_id, payment_date, amount, payment_method, payment_status) VALUES 
    (101, '2026-08-01', 150.00, 'Card', 'Paid'),
    (102, '2026-08-02', 75.50, 'M-Pesa', 'Paid'),
    (103, '2026-08-03', 200.00, 'Cash', 'Pending'),
    (104, '2026-08-04', 50.00, 'Card', 'Refunded');

SELECT * FROM Payments;
        REFERENCES cars(car_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
