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
CREATE TABLE Maintenance (
    maintenance_id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT NOT NULL,
    service_date DATE NOT NULL,
    description TEXT NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    mechanic_name VARCHAR(100) NOT NULL,

    CONSTRAINT fk_maintenance_car
        FOREIGN KEY (car_id)
        REFERENCES cars(car_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
